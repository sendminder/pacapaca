// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrot_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carrotBalanceHash() => r'816846bd85ab3c27a89465e793af21e3843cf03f';

/// See also [CarrotBalance].
@ProviderFor(CarrotBalance)
final carrotBalanceProvider =
    AutoDisposeAsyncNotifierProvider<CarrotBalance, int?>.internal(
  CarrotBalance.new,
  name: r'carrotBalanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carrotBalanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CarrotBalance = AutoDisposeAsyncNotifier<int?>;
String _$carrotTransactionsHash() =>
    r'641c49621408400c94fd437846dfa94051e3dd31';

/// See also [CarrotTransactions].
@ProviderFor(CarrotTransactions)
final carrotTransactionsProvider = AutoDisposeAsyncNotifierProvider<
    CarrotTransactions, List<CarrotTransactionDTO>?>.internal(
  CarrotTransactions.new,
  name: r'carrotTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carrotTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CarrotTransactions
    = AutoDisposeAsyncNotifier<List<CarrotTransactionDTO>?>;
String _$carrotRankingsHash() => r'90a772ed2657b218911bfc418f5f3bcdd645ea4b';

/// See also [CarrotRankings].
@ProviderFor(CarrotRankings)
final carrotRankingsProvider = AutoDisposeAsyncNotifierProvider<CarrotRankings,
    ResponseCarrotRankings?>.internal(
  CarrotRankings.new,
  name: r'carrotRankingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carrotRankingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CarrotRankings = AutoDisposeAsyncNotifier<ResponseCarrotRankings?>;
String _$carrotSenderHash() => r'd3227417d0be735579143ad2e9fa17448ed14180';

/// See also [CarrotSender].
@ProviderFor(CarrotSender)
final carrotSenderProvider =
    AutoDisposeAsyncNotifierProvider<CarrotSender, void>.internal(
  CarrotSender.new,
  name: r'carrotSenderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$carrotSenderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CarrotSender = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
