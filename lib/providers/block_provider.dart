import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/block_dto.dart';
import 'package:pacapaca/services/block_service.dart';

part 'block_provider.g.dart';

@riverpod
class BlockState extends _$BlockState {
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
    final request = CreateBlockRequest(
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

  /// 특정 사용자가 차단되었는지 확인
  bool isUserBlocked(int userId) {
    return state.value?.any((block) => block.reportedId == userId) ?? false;
  }

  /// 차단된 사용자 목록 새로고침
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

/// 차단된 사용자 ID 목록 제공
@riverpod
List<int> blockedUserIds(BlockedUserIdsRef ref) {
  final blockState = ref.watch(blockStateProvider);
  return blockState.value?.map((block) => block.reportedId).toList() ?? [];
}

/// 특정 사용자의 차단 여부 확인
@riverpod
bool isUserBlocked(IsUserBlockedRef ref, int userId) {
  final blockedIds = ref.watch(blockedUserIdsProvider);
  return blockedIds.contains(userId);
}
