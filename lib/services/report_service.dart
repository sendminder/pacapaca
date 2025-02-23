import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/report_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'dart:convert';
import 'package:pacapaca/services/dio_service.dart';

class ReportService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  /// 사용자 신고하기
  Future<UserReportDTO?> createReport(RequestCreateUserReport request) async {
    try {
      final response = await _dio.post(
        '/v1/reports',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        return UserReportDTO.fromJson(responseRest.response!);
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('create report', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
