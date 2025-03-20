// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blocksHash() => r'ebd490c7c8e956caaba21defa1676966bd85af3a';

/// See also [Blocks].
@ProviderFor(Blocks)
final blocksProvider =
    AutoDisposeAsyncNotifierProvider<Blocks, List<UserBlockDTO>>.internal(
  Blocks.new,
  name: r'blocksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$blocksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Blocks = AutoDisposeAsyncNotifier<List<UserBlockDTO>>;
String _$userBlockStatusHash() => r'7157902165e3908ad8124fc426da3ba0a94950b7';

/// See also [UserBlockStatus].
@ProviderFor(UserBlockStatus)
final userBlockStatusProvider = AutoDisposeAsyncNotifierProvider<
    UserBlockStatus, Map<String, dynamic>>.internal(
  UserBlockStatus.new,
  name: r'userBlockStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userBlockStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserBlockStatus = AutoDisposeAsyncNotifier<Map<String, dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
