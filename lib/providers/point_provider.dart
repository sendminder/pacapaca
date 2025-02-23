import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pacapaca/services/point_service.dart';
import 'package:pacapaca/models/dto/point_dto.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
part 'point_provider.g.dart';

// 포인트 잔액 provider
@riverpod
class PointBalance extends _$PointBalance {
  final _pointService = GetIt.instance<PointService>();

  @override
  FutureOr<int?> build() async {
    return _pointService.getBalance();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// 포인트 내역 provider
@riverpod
class PointHistories extends _$PointHistories {
  final _pointService = GetIt.instance<PointService>();

  int? _lastPagingKey;
  static const int _pageSize = 20;

  @override
  FutureOr<List<PointsHistoryDTO>?> build() async {
    _lastPagingKey = null;
    return _pointService.getHistories(limit: _pageSize);
  }

  Future<void> loadMore() async {
    final currentHistories = state.value ?? [];
    if (currentHistories.isEmpty) return;

    final lastHistory = currentHistories.last;
    // 이전과 같은 페이징 키면 요청하지 않음
    if (lastHistory.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastHistory.id;

      final moreHistories = await _pointService.getHistories(
        limit: _pageSize,
        pagingKey: lastHistory.id,
      );

      if (moreHistories == null || moreHistories.isEmpty) return;

      state = AsyncData([...currentHistories, ...moreHistories]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// 포인트 랭킹 provider
@riverpod
class PointRankings extends _$PointRankings {
  final _pointService = GetIt.instance<PointService>();

  int? _lastPagingUserId;
  int? _lastPagingAmount;

  @override
  FutureOr<List<DisplayUserDTO>?> build() async {
    return _pointService.getRankings(
      pagingUserId: state.value?.last.id,
      pagingAmount: state.value?.last.points,
    );
  }

  Future<void> loadMore() async {
    final currentRankings = state.value ?? [];
    if (currentRankings.isEmpty) return;

    final lastRanking = currentRankings.last;
    if (lastRanking.id == _lastPagingUserId &&
        lastRanking.points == _lastPagingAmount) {
      return;
    }

    try {
      _lastPagingUserId = lastRanking.id;
      _lastPagingAmount = lastRanking.points;

      final moreRankings = await _pointService.getRankings(
        pagingUserId: lastRanking.id,
        pagingAmount: lastRanking.points,
      );

      if (moreRankings == null || moreRankings.isEmpty) return;

      state = AsyncData([...currentRankings, ...moreRankings]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
