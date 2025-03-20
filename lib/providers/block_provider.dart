import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/block_dto.dart';
import 'package:pacapaca/services/block_service.dart';

part 'block_provider.g.dart';

@riverpod
class Blocks extends _$Blocks {
  final _blockService = GetIt.instance<BlockService>();

  @override
  Future<List<UserBlockDTO>> build() async {
    // 초기 차단 목록 로드
    final blocks = await _blockService.getBlocks();
    return blocks ?? [];
  }

  /// 사용자 차단하기
  Future<void> blockUser({
    required int userId,
    required String reason,
    int? commentId,
    int? articleId,
  }) async {
    final request = RequestCreateUserBlock(
      reportedId: userId,
      reason: reason,
      commentId: commentId,
      articleId: articleId,
    );

    final block = await _blockService.createBlock(request);
    if (block != null) {
      state = AsyncValue.data([...state.value ?? [], block]);
    }
  }

  /// 차단 해제하기
  Future<void> unblockUser(int blockId) async {
    await _blockService.unblock(blockId);
    state = AsyncValue.data(
      state.value?.where((block) => block.id != blockId).toList() ?? [],
    );
  }

  /// 차단한 사용자 목록 새로고침
  Future<void> refreshBlocks() async {
    state = const AsyncValue.loading();
    try {
      final blocks = await _blockService.getBlocks();
      state = AsyncValue.data(blocks ?? []);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// 현재 사용자의 차단 상태를 확인하는 provider
@riverpod
class UserBlockStatus extends _$UserBlockStatus {
  final _blockService = GetIt.instance<BlockService>();

  @override
  Future<Map<String, dynamic>> build() async {
    return await _blockService.isUserBlocked();
  }

  /// 사용자 차단 상태 새로고침
  Future<void> refreshBlockStatus() async {
    state = const AsyncValue.loading();
    try {
      final status = await _blockService.isUserBlocked();
      state = AsyncValue.data(status);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
