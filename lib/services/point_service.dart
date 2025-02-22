import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/point_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'package:pacapaca/services/dio_service.dart';
import 'package:pacapaca/models/dto/user_dto.dart';

class PointService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  // 포인트 랭킹 조회
  Future<List<DisplayUserDTO>?> getRankings({
    int? limit = 20,
  }) async {
    try {
      final queryParams = {
        'limit': limit,
      };
      final response = await _dio.get(
        '/v1/points/rankings',
        queryParameters: queryParams,
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final List<dynamic> rankings = responseRest.response!['top_users'];
        return rankings.map((json) => DisplayUserDTO.fromJson(json)).toList();
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get point rankings', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 포인트 잔액 조회
  Future<int?> getBalance() async {
    try {
      final response = await _dio.get('/v1/points/balance');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        return responseRest.response!['balance'] as int;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get point balance', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 포인트 내역 조회
  Future<List<PointsHistoryDTO>?> getHistories({
    required int limit,
    int? pagingUserID,
    int? pagingAmount,
  }) async {
    try {
      final queryParams = {
        'limit': limit,
        if (pagingUserID != null) 'paging_user_id': pagingUserID,
        if (pagingAmount != null) 'paging_amount': pagingAmount,
      };

      final response = await _dio.get(
        '/v1/points/histories',
        queryParameters: queryParams,
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final List<dynamic> histories = responseRest.response!['histories'];
        return histories
            .map((json) => PointsHistoryDTO.fromJson(json))
            .toList();
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get point transactions', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
