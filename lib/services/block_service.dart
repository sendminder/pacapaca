import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/block_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'dart:convert';
import 'package:pacapaca/services/dio_service.dart';

class BlockService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  /// 사용자 차단하기
  Future<UserBlockDTO?> createBlock(CreateBlockRequest request) async {
    try {
      final response = await _dio.post(
        '/v1/blocks',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final blockResponse = GetBlockResponse.fromJson(responseRest.response!);
        return blockResponse.block;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('create block', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 차단 해제하기
  Future<void> unblock(int blockId) async {
    try {
      await _dio.put('/v1/blocks/$blockId');
    } catch (e, stackTrace) {
      logger.e('unblock user', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 차단 목록 조회하기
  Future<List<UserBlockDTO>?> getBlocks() async {
    try {
      final response = await _dio.get('/v1/blocks');

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final blocks = (responseRest.response!['blocks'] as List)
            .map((item) => UserBlockDTO.fromJson(item as Map<String, dynamic>))
            .toList();
        return blocks;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get blocks', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
