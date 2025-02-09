import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';

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
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('API Error', error: err, stackTrace: err.stackTrace);
    return handler.next(err);
  }
}
