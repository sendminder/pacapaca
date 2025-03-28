import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/services/storage_service.dart';
import 'package:pacapaca/services/auth_service.dart';
import 'package:pacapaca/services/dio_service.dart';

/// 응답 인터셉터: API 응답 처리 및 토큰 갱신 로직을 담당
class ResponseInterceptor extends Interceptor {
  final Logger _logger = GetIt.instance<Logger>();
  StorageService get _storage => GetIt.instance<StorageService>();
  AuthService get _authService => GetIt.instance<AuthService>();
  Dio get _dio => DioService.instance;

  static const _tokenRefreshTimeout = Duration(seconds: 10);

  // 토큰 갱신 Future를 저장
  Future<String?>? _refreshTokenFuture;
  DateTime? _lastLogoutTime;

  bool get _isLoggingOut {
    if (_lastLogoutTime == null) return false;
    return DateTime.now().difference(_lastLogoutTime!) <
        const Duration(seconds: 5);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d('Response data: ${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_isLoggingOut) {
      _logger.w('User is logging out, skipping token refresh');
      return handler.next(err);
    }

    if (err.response?.statusCode == 401) {
      return _handle401Error(err, handler);
    }

    final errorMessage = _extractErrorMessage(err.response);
    final modifiedErr = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: errorMessage,
      stackTrace: err.stackTrace,
      message: err.message,
    );

    _logger.e('API Error', error: modifiedErr);
    return handler.next(modifiedErr);
  }

  Future<void> _handle401Error(
      DioException err, ErrorInterceptorHandler handler) async {
    try {
      final accessToken = await _refreshToken()
          .timeout(_tokenRefreshTimeout, onTimeout: () => null);

      if (accessToken == null) {
        await _performSignOut();
        return handler.next(err);
      }

      return _retryRequest(err, handler, accessToken);
    } catch (e) {
      _logger.e('Token refresh failed', error: e);
      await _performSignOut();
      return handler.next(err);
    }
  }

  /// 토큰 갱신 로직을 Queue로 관리
  Future<String?> _refreshToken() async {
    try {
      // 이미 진행 중인 토큰 갱신이 있다면 그 결과를 기다림
      if (_refreshTokenFuture != null) {
        return await _refreshTokenFuture!;
      }

      // 새로운 토큰 갱신 시작
      _refreshTokenFuture = _performTokenRefresh();
      final result = await _refreshTokenFuture!;
      _refreshTokenFuture = null;
      return result;
    } catch (e) {
      _refreshTokenFuture = null;
      rethrow;
    }
  }

  /// 실제 토큰 갱신 수행
  Future<String?> _performTokenRefresh() async {
    final refreshToken = await _storage.refreshToken;
    if (refreshToken == null) {
      _logger.w('Refresh token not found');
      return null;
    }

    try {
      final accessToken = await _authService.refreshToken();
      if (accessToken == null || accessToken.isEmpty) {
        _logger.w('Failed to get valid access token');
        return null;
      }
      return accessToken;
    } catch (e) {
      _logger.e('Token refresh request failed', error: e);
      return null;
    }
  }

  /// 요청 재시도
  Future<void> _retryRequest(DioException err, ErrorInterceptorHandler handler,
      String accessToken) async {
    try {
      final originalRequest = err.requestOptions;
      originalRequest.headers['Authorization'] = 'Bearer $accessToken';

      final retryResponse = await _dio.request(
        originalRequest.path,
        data: originalRequest.data,
        queryParameters: originalRequest.queryParameters,
        options: Options(
          method: originalRequest.method,
          headers: originalRequest.headers,
          contentType: originalRequest.contentType,
          responseType: originalRequest.responseType,
        ),
      );

      return handler.resolve(retryResponse);
    } catch (e) {
      _logger.e('Retry request failed', error: e);
      return handler.next(err);
    }
  }

  /// 오류 메시지 추출
  String _extractErrorMessage(Response? response) {
    if (response?.data == null) {
      return '알 수 없는 오류가 발생했습니다.';
    }

    try {
      if (response!.data is Map<String, dynamic> &&
          response.data.containsKey('message')) {
        return response.data['message'] as String;
      }

      if (response.data is String) {
        return response.data as String;
      }

      return '서버 오류가 발생했습니다.';
    } catch (e) {
      _logger.e('Error message extraction failed', error: e);
      return '알 수 없는 오류가 발생했습니다.';
    }
  }

  /// 로그아웃 처리
  Future<void> _performSignOut() async {
    if (!_isLoggingOut) {
      _lastLogoutTime = DateTime.now();
      try {
        await _authService.signOut();
      } catch (e) {
        _logger.e('Sign out failed', error: e);
      }
    }
  }
}
