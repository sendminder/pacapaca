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
String _$carrotRankingsHash() => r'414008649aa560817106b02592ef052734ce3fc3';

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
String _$carrotSenderHash() => r'2f163f042c3db5eecbf1b0e4515737eff5d49c1e';

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
