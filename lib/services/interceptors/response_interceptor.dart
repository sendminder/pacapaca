import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/services/storage_service.dart';
import 'package:pacapaca/services/auth_service.dart';
import 'package:pacapaca/services/dio_service.dart';

/// 응답 인터셉터: API 응답 처리 및 토큰 갱신 로직을 담당
class ResponseInterceptor extends Interceptor {
  final Logger _logger = GetIt.instance<Logger>();
  // 재시도 중인 요청을 추적하기 위한 Set
  final Set<String> _retryingRequests = {};
  // 토큰 갱신 중인지 여부를 추적
  bool _isRefreshing = false;
  // 로그아웃 처리 중인지 여부를 추적
  bool _isLoggingOut = false;

  // 의존성
  StorageService get _storage => GetIt.instance<StorageService>();
  AuthService get _authService => GetIt.instance<AuthService>();
  Dio get _dio => DioService.instance;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      // 응답 데이터를 ResponseRest로 변환하지 않고 원본 유지
      _logger.d('Response data: ${response.data}');
      return handler.next(response);
    } catch (e, stackTrace) {
      _logger.e('Response transform error', error: e, stackTrace: stackTrace);
      return handler.next(response);
    }
  }

  /// 응답에서 오류 메시지 추출
  String _extractErrorMessage(Response? response) {
    if (response?.data == null) {
      return '알 수 없는 오류가 발생했습니다.';
    }

    try {
      // RestResponse 형식인 경우 메시지 추출
      if (response!.data is Map<String, dynamic> &&
          response.data.containsKey('message')) {
        return response.data['message'] as String;
      }

      // 문자열인 경우 그대로 반환
      if (response.data is String) {
        return response.data as String;
      }

      return '서버 오류가 발생했습니다.';
    } catch (e) {
      _logger.e('Error message extraction failed', error: e);
      return '알 수 없는 오류가 발생했습니다.';
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // 로그아웃 중이면 모든 요청 에러를 그대로 반환
    if (_isLoggingOut) {
      _logger.w('User is logging out, skipping token refresh');
      return handler.next(err);
    }

    if (err.response?.statusCode == 401) {
      return _handle401Error(err, handler);
    }

    // 오류 메시지 추출 및 DioException에 추가
    final errorMessage = _extractErrorMessage(err.response);
    _logger.e('API Error: $errorMessage', error: err.response?.data.toString());

    // 오류 메시지를 DioException의 error 필드에 저장
    final modifiedErr = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: errorMessage,
      stackTrace: err.stackTrace,
      message: err.message,
    );

    _logger.e('API Error',
        error: modifiedErr, stackTrace: modifiedErr.stackTrace);
    return handler.next(modifiedErr);
  }

  /// 401 인증 오류 처리
  Future<void> _handle401Error(
      DioException err, ErrorInterceptorHandler handler) async {
    final requestId = _getRequestId(err.requestOptions);

    // 무한 루프 방지
    if (_retryingRequests.contains(requestId)) {
      _logger.w('Avoiding infinite retry loop for request: $requestId');
      _retryingRequests.remove(requestId);
      await _performSignOut();
      return handler.next(err);
    }

    // 토큰 갱신 중이면 대기
    if (_isRefreshing) {
      return _waitForTokenRefresh(err, handler);
    }

    // 토큰 갱신 시도
    return _refreshTokenAndRetry(err, handler, requestId);
  }

  /// 요청 식별자 생성
  String _getRequestId(RequestOptions options) {
    return '${options.uri.toString()}_${options.method}';
  }

  /// 토큰 갱신 대기 후 재시도
  Future<void> _waitForTokenRefresh(
      DioException err, ErrorInterceptorHandler handler) async {
    _logger.d('Token refresh already in progress, waiting...');

    // 토큰 갱신이 완료될 때까지 대기 (최대 5초)
    if (!await _waitUntilRefreshComplete()) {
      return handler.next(err);
    }

    // 토큰 갱신이 완료되었으면 재시도
    final accessToken = await _storage.accessToken;
    if (accessToken == null) {
      _logger.w('Access token not found');
      return handler.next(err);
    }

    return _retryRequestWithToken(err, handler, accessToken);
  }

  /// 토큰 갱신이 완료될 때까지 대기
  Future<bool> _waitUntilRefreshComplete() async {
    int attempts = 0;
    while (_isRefreshing && attempts < 10) {
      await Future.delayed(Duration(milliseconds: 2000));
      attempts++;
    }
    return !_isRefreshing;
  }

  /// 토큰 갱신 및 요청 재시도
  Future<void> _refreshTokenAndRetry(DioException err,
      ErrorInterceptorHandler handler, String requestId) async {
    _retryingRequests.add(requestId);
    _isRefreshing = true;

    try {
      // 리프레시 토큰 확인
      final refreshToken = await _storage.refreshToken;
      if (refreshToken == null) {
        _logger.w('Refresh token not found');
        _cleanupAndSignOut(requestId);
        return handler.next(err);
      }

      // 액세스 토큰 갱신
      final accessToken = await _authService.refreshToken();
      if (accessToken == null || accessToken.isEmpty) {
        _logger.w('Failed to get valid access token');
        _cleanupAndSignOut(requestId);
        return handler.next(err);
      }

      _isRefreshing = false;
      return _retryRequestWithToken(err, handler, accessToken, requestId);
    } catch (e, stackTrace) {
      _logger.e('Token refresh failed', error: e, stackTrace: stackTrace);
      _cleanupAndSignOut(requestId);
      return handler.next(err);
    }
  }

  /// 토큰으로 요청 재시도
  Future<void> _retryRequestWithToken(
      DioException err, ErrorInterceptorHandler handler, String accessToken,
      [String? requestId]) async {
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

      // 재시도 완료 후 Set에서 제거
      if (requestId != null) {
        _retryingRequests.remove(requestId);
      }

      return handler.resolve(retryResponse);
    } catch (e) {
      _logger.e('Retry after token refresh failed', error: e);

      if (requestId != null) {
        _retryingRequests.remove(requestId);
      }

      return handler.next(err);
    }
  }

  /// 리소스 정리 및 로그아웃
  void _cleanupAndSignOut(String requestId) {
    _retryingRequests.remove(requestId);
    _isRefreshing = false;
    _performSignOut();
  }

  /// 로그아웃 처리를 한 번만 수행
  Future<void> _performSignOut() async {
    if (!_isLoggingOut) {
      _isLoggingOut = true;
      try {
        await _authService.signOut();
      } finally {
        // 일정 시간 후 로그아웃 상태 초기화 (다음 세션을 위해)
        Future.delayed(Duration(seconds: 5), () {
          _isLoggingOut = false;
        });
      }
    }
  }
}
