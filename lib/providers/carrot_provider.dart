import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/carrot_service.dart';
import '../models/dto/carrot_dto.dart';
import 'package:get_it/get_it.dart';

part 'carrot_provider.g.dart';

// 당근 잔액 provider
@riverpod
class CarrotBalance extends _$CarrotBalance {
  final _carrotService = GetIt.instance<CarrotService>();

  @override
  FutureOr<CarrotBalanceDTO?> build() async {
    return _carrotService.getBalance();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// 당근 거래 내역 provider
@riverpod
class CarrotTransactions extends _$CarrotTransactions {
  final _carrotService = GetIt.instance<CarrotService>();

  int? _lastPagingKey;
  static const int _pageSize = 20;

  @override
  FutureOr<List<CarrotTransactionDTO>?> build() async {
    _lastPagingKey = null;
    return _carrotService.getTransactions(limit: _pageSize);
  }

  Future<void> loadMore() async {
    final currentTransactions = state.value ?? [];
    if (currentTransactions.isEmpty) return;

    final lastTransaction = currentTransactions.last;
    // 이전과 같은 페이징 키면 요청하지 않음
    if (lastTransaction.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastTransaction.id;
      final moreTransactions = await _carrotService.getTransactions(
        limit: _pageSize,
        pagingKey: lastTransaction.id,
      );

      if (moreTransactions == null || moreTransactions.isEmpty) return;

      state = AsyncData([...currentTransactions, ...moreTransactions]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  // 새로운 거래 추가
  void addTransaction(CarrotTransactionDTO transaction) {
    final currentTransactions = state.value ?? [];
    state = AsyncData([transaction, ...currentTransactions]);
  }
}

// 당근 랭킹 provider
@riverpod
class CarrotRankings extends _$CarrotRankings {
  final _carrotService = GetIt.instance<CarrotService>();
  DateTime? _lastFetchTime;
  static const _cacheValidDuration = Duration(minutes: 5);

  @override
  FutureOr<CarrotRankingDTO?> build() async {
    // 캐시가 유효한 경우 기존 데이터 반환
    if (state.hasValue &&
        state.value != null &&
        _lastFetchTime != null &&
        DateTime.now().difference(_lastFetchTime!) < _cacheValidDuration) {
      return state.value;
    }

    final rankings = await _carrotService.getRankings();
    _lastFetchTime = DateTime.now();
    return rankings;
  }

  Future<void> refresh() async {
    _lastFetchTime = null;
    ref.invalidateSelf();
  }
}

// 당근 전송 provider
@riverpod
class CarrotSender extends _$CarrotSender {
  final _carrotService = GetIt.instance<CarrotService>();

  @override
  FutureOr<void> build() {}

  Future<CarrotBalanceDTO?> sendCarrots(RequestSendCarrots request) async {
    state = const AsyncLoading();
    try {
      final balance = await _carrotService.sendCarrots(request);

      return balance;
    } catch (e, stack) {
      state = AsyncError(e, stack);
      return null;
    }
  }
}
