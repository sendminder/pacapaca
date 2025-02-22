// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pointBalanceHash() => r'217cd5b76c7a6ee18e9ff9c2480db5a38a34f2cd';

/// See also [PointBalance].
@ProviderFor(PointBalance)
final pointBalanceProvider =
    AutoDisposeAsyncNotifierProvider<PointBalance, int?>.internal(
  PointBalance.new,
  name: r'pointBalanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pointBalanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PointBalance = AutoDisposeAsyncNotifier<int?>;
String _$pointHistoriesHash() => r'ec3760aa9f9e146137f0a1c5e04404c3a085f972';

/// See also [PointHistories].
@ProviderFor(PointHistories)
final pointHistoriesProvider = AutoDisposeAsyncNotifierProvider<PointHistories,
    List<PointsHistoryDTO>?>.internal(
  PointHistories.new,
  name: r'pointHistoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pointHistoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PointHistories = AutoDisposeAsyncNotifier<List<PointsHistoryDTO>?>;
String _$pointRankingsHash() => r'72c707c8d5266db725a7b5764166014fec5a655d';

/// See also [PointRankings].
@ProviderFor(PointRankings)
final pointRankingsProvider = AutoDisposeAsyncNotifierProvider<PointRankings,
    List<DisplayUserDTO>?>.internal(
  PointRankings.new,
  name: r'pointRankingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pointRankingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PointRankings = AutoDisposeAsyncNotifier<List<DisplayUserDTO>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
