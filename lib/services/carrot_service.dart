import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/carrot_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'dart:convert';
import 'package:pacapaca/services/dio_service.dart';

class CarrotService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  // 당근 잔액 조회
  Future<CarrotBalanceDTO?> getBalance() async {
    try {
      final response = await _dio.get('/v1/carrots/balance');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        return CarrotBalanceDTO.fromJson(responseRest.response!);
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get carrot balance', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 당근 전송
  Future<CarrotBalanceDTO?> sendCarrots(RequestSendCarrots request) async {
    try {
      final response = await _dio.post(
        '/v1/carrots/send',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        return CarrotBalanceDTO.fromJson(responseRest.response!);
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('send carrots', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 거래 내역 조회
  Future<List<CarrotTransactionDTO>?> getTransactions({
    required int limit,
    int? pagingKey,
  }) async {
    try {
      final request = RequestListTransactions(
        limit: limit,
        pagingKey: pagingKey,
      );

      final response = await _dio.get(
        '/v1/carrots/transactions',
        queryParameters: request.toJson(),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final List<dynamic> transactions =
            responseRest.response!['transactions'];
        return transactions
            .map((json) => CarrotTransactionDTO.fromJson(json))
            .toList();
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get transactions', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 랭킹 조회
  Future<CarrotRankingDTO?> getRankings() async {
    try {
      final response = await _dio.get('/v1/carrots/rankings');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        return CarrotRankingDTO.fromJson(responseRest.response!);
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get carrot rankings', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
