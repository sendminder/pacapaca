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
  Future<UserReportDTO?> createReport(CreateReportRequest request) async {
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
        final reportResponse =
            GetReportResponse.fromJson(responseRest.response!);
        return reportResponse.report;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('create report', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 신고 내역 조회하기
  Future<List<UserReportDTO>?> getReports() async {
    try {
      final response = await _dio.get('/v1/reports');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final reports = (responseRest.response!['reports'] as List)
            .map((item) => UserReportDTO.fromJson(item as Map<String, dynamic>))
            .toList();
        return reports;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get reports', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
