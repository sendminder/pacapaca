import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/services/storage_service.dart';
import 'package:logger/logger.dart';

class AuthInterceptor extends Interceptor {
  final StorageService _storageService = GetIt.instance<StorageService>();
  final logger = GetIt.instance<Logger>();
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    logger.d('onRequest: ${options.path}');

    // 인증이 필요한 엔드포인트 목록
    final authRequiredPaths = [
      '/v1/auth/logout',
      '/v1/users',
      '/v1/articles',
    ];

    // 현재 요청 경로가 인증이 필요한지 확인
    final needsAuth =
        authRequiredPaths.any((path) => options.path.startsWith(path));

    if (needsAuth) {
      final token = await _storageService.accessToken;
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    return handler.next(options);
  }
}
