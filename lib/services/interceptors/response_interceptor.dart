import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/services/storage_service.dart';
import 'package:pacapaca/services/auth_service.dart';
import 'package:pacapaca/services/dio_service.dart';

class ResponseInterceptor extends Interceptor {
  final Logger logger = GetIt.instance<Logger>();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      // 응답 데이터를 ResponseRest로 변환하지 않고 원본 유지
      logger.d('Response data: ${response.data}');
      return handler.next(response);
    } catch (e, stackTrace) {
      logger.e('Response transform error', error: e, stackTrace: stackTrace);
      return handler.next(response);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final dio = DioService.instance;
      final storage = GetIt.instance<StorageService>();
      final authService = GetIt.instance<AuthService>();
      try {
        final refreshToken = await storage.refreshToken;
        if (refreshToken == null) {
          logger.w('Refresh token not found');
          await authService.signOut();
          return handler.next(err);
        }

        final accessToken = await authService.refreshToken();
        // 실패했던 요청 재시도
        final originalRequest = err.requestOptions;
        originalRequest.headers['Authorization'] = 'Bearer $accessToken';

        final retryResponse = await dio.fetch(originalRequest);
        return handler.resolve(retryResponse);
      } catch (e, stackTrace) {
        // signOut() 메서드 호출
        logger.e('Token refresh failed', error: e, stackTrace: stackTrace);
        await authService.signOut();
        return handler.next(err);
      }
    }

    logger.e('API Error', error: err, stackTrace: err.stackTrace);
    return handler.next(err);
  }
}
