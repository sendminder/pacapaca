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
    int? pagingUserId,
    int? pagingAmount,
  }) async {
    try {
      final request = RequestListPointRankings(
        limit: limit ?? 20,
        pagingUserId: pagingUserId,
        pagingAmount: pagingAmount,
      );

      final response = await _dio.get(
        '/v1/points/rankings',
        queryParameters: request.toJson(),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final pointRankings = ResponseGetTopPointUsers.fromJson(
          responseRest.response!,
        );
        return pointRankings.topUsers;
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
      final response = await _dio.get('/v1/points');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final pointBalance = ResponseGetPointBalance.fromJson(
          responseRest.response!,
        );
        return pointBalance.balance;
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
    int? pagingKey,
  }) async {
    try {
      final request = RequestListPointsHistory(
        limit: limit,
        pagingKey: pagingKey,
      );

      final response = await _dio.get(
        '/v1/points/histories',
        queryParameters: request.toJson(),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final pointHistories = ResponseGetPointsHistory.fromJson(
          responseRest.response!,
        );
        return pointHistories.histories;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get point transactions', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
