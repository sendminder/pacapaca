import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/paca_helper.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'dart:convert';
import 'package:pacapaca/services/dio_service.dart';

class PacaHelperService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  /// 고민 정의하기
  Future<ResponseDefineProblems?> defineProblems(
      RequestDefineProblems request) async {
    try {
      final response = await _dio.post(
        '/v1/paca/define-problems',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        return ResponseDefineProblems.fromJson(responseRest.response!);
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('define problems', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 고민 요약하기
  Future<ResponseSummarizeConcerns?> summarizeConcerns(
      RequestSummarizeConcerns request) async {
    try {
      final response = await _dio.post(
        '/v1/paca/summarize-concerns',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        return ResponseSummarizeConcerns.fromJson(responseRest.response!);
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('summarize concerns', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
