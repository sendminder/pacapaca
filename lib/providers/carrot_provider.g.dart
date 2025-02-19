// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrot_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carrotServiceHash() => r'0f9c45b7692fbea64b536767a5ca83bf8366feab';

/// See also [carrotService].
@ProviderFor(carrotService)
final carrotServiceProvider = AutoDisposeProvider<CarrotService>.internal(
  carrotService,
  name: r'carrotServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carrotServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CarrotServiceRef = AutoDisposeProviderRef<CarrotService>;
String _$carrotBalanceHash() => r'f0e7ffb76d71d18ba6cb82b0df6b8cbad01168d1';

/// See also [CarrotBalance].
@ProviderFor(CarrotBalance)
final carrotBalanceProvider =
    AutoDisposeAsyncNotifierProvider<CarrotBalance, CarrotBalanceDTO?>.internal(
  CarrotBalance.new,
  name: r'carrotBalanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carrotBalanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CarrotBalance = AutoDisposeAsyncNotifier<CarrotBalanceDTO?>;
String _$carrotTransactionsHash() =>
    r'0c376c1d455937fb05a6cbd1b13d8080da30e041';

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
String _$carrotRankingsHash() => r'ce0fb5f57c124c60975a51983969737069e8554a';

/// See also [CarrotRankings].
@ProviderFor(CarrotRankings)
final carrotRankingsProvider = AutoDisposeAsyncNotifierProvider<CarrotRankings,
    CarrotRankingDTO?>.internal(
  CarrotRankings.new,
  name: r'carrotRankingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carrotRankingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CarrotRankings = AutoDisposeAsyncNotifier<CarrotRankingDTO?>;
String _$carrotSenderHash() => r'60a6ccd984556ff836043ef30a0693869009794d';

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
