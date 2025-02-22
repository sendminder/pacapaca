import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/point_service.dart';
import '../models/dto/point_dto.dart';
import 'package:get_it/get_it.dart';

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

  int? _lastPagingUserId;
  int? _lastPagingAmount;
  static const int _pageSize = 20;

  @override
  FutureOr<List<PointHistoryDTO>?> build() async {
    _lastPagingUserId = null;
    _lastPagingAmount = null;
    return _pointService.getHistories(limit: _pageSize);
  }

  Future<void> loadMore() async {
    final currentHistories = state.value ?? [];
    if (currentHistories.isEmpty) return;

    final lastHistory = currentHistories.last;
    // 이전과 같은 페이징 키면 요청하지 않음
    if (lastHistory.userId == _lastPagingUserId &&
        lastHistory.amount == _lastPagingAmount) return;

    try {
      _lastPagingUserId = lastHistory.userId;
      _lastPagingAmount = lastHistory.amount;

      final moreHistories = await _pointService.getHistories(
        limit: _pageSize,
        pagingUserID: lastHistory.userId,
        pagingAmount: lastHistory.amount,
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
  DateTime? _lastFetchTime;
  static const _cacheValidDuration = Duration(minutes: 5);

  @override
  FutureOr<List<PointRankingDTO>?> build() async {
    // 캐시가 유효한 경우 기존 데이터 반환
    if (state.hasValue &&
        state.value != null &&
        _lastFetchTime != null &&
        DateTime.now().difference(_lastFetchTime!) < _cacheValidDuration) {
      return state.value;
    }

    final rankings = await _pointService.getRankings();
    _lastFetchTime = DateTime.now();
    return rankings;
  }

  Future<void> refresh() async {
    _lastFetchTime = null;
    ref.invalidateSelf();
  }
}
