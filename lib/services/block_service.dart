import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/block_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'dart:convert';
import 'package:pacapaca/services/dio_service.dart';
import 'package:pacapaca/services/storage_service.dart';

class BlockService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();
  final _storageService = GetIt.instance<StorageService>();

  /// 사용자 차단하기
  Future<UserBlockDTO?> createBlock(RequestCreateUserBlock request) async {
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
        final blockResponse =
            ResponseUserBlock.fromJson(responseRest.response!);
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
        final blocksResponse =
            ResponseUserBlocks.fromJson(responseRest.response!);
        return blocksResponse.blocks;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get blocks', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 현재 사용자가 차단(제재) 상태인지 확인
  ///
  /// 현재 시간이 차단 시간보다 이전인 경우 차단된 상태로 판단
  /// 차단되었다면 차단 해제 시간도 함께 반환
  Future<Map<String, dynamic>> isUserBlocked() async {
    try {
      final user = await _storageService.userData;
      if (user == null) {
        return {'isBlocked': false};
      }

      // 사용자의 차단 시간 확인
      if (user.displayUser.isBlocked && user.blockTime != null) {
        final now = DateTime.now();
        final blockTime = DateTime.parse(user.blockTime!);

        // 현재 시간이 차단 시간보다 이전이면 차단 상태
        if (blockTime.isAfter(now)) {
          return {
            'isBlocked': true,
            'blockUntil': blockTime,
          };
        }
      }

      return {'isBlocked': false};
    } catch (e, stackTrace) {
      logger.e('check user block status', error: e, stackTrace: stackTrace);
      return {'isBlocked': false};
    }
  }
}
