// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrot_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carrotBalanceHash() => r'8673a28e4271c2d5e0b8c5950b42ada7fb6a9396';

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
String _$carrotRankingsHash() => r'00746e35df91eee7831c2000971e19049e2d832c';

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
String _$carrotSenderHash() => r'c8084c586adc8ddafa2c2a46130582d92590c112';

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
