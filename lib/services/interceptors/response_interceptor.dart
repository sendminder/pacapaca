import 'package:dio/dio.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';

class ResponseInterceptor extends Interceptor {
  final Logger logger = GetIt.instance<Logger>();
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      // 응답 데이터를 ResponseRest로 변환
      final responseData = response.data;
      if (responseData is Map<String, dynamic>) {
        response.data = ResponseRest<Map<String, dynamic>>.fromJson(
          responseData,
          (json) => json as Map<String, dynamic>,
        );
      }
    } catch (e, stackTrace) {
      // 변환 실패 시 원본 데이터 유지
      logger.e('Response transform error', error: e, stackTrace: stackTrace);
    }

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 에러 응답도 ResponseRest 형식이면 변환
    if (err.response?.data is Map<String, dynamic>) {
      try {
        err.response!.data = ResponseRest<Map<String, dynamic>>.fromJson(
          err.response!.data,
          (json) => json as Map<String, dynamic>,
        );
      } catch (e, stackTrace) {
        logger.e('Error response transform error',
            error: e, stackTrace: stackTrace);
      }
    }

    return handler.next(err);
  }
}
