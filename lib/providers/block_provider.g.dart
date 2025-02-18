// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blockedUserIdsHash() => r'249be756e6bb80069bc9bcb05045fb338ca16ea9';

/// 차단된 사용자 ID 목록 제공
///
/// Copied from [blockedUserIds].
@ProviderFor(blockedUserIds)
final blockedUserIdsProvider = AutoDisposeProvider<List<int>>.internal(
  blockedUserIds,
  name: r'blockedUserIdsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$blockedUserIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BlockedUserIdsRef = AutoDisposeProviderRef<List<int>>;
String _$isUserBlockedHash() => r'b47f9673894ca5e7e3ca9d849448241107fd27c2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 특정 사용자의 차단 여부 확인
///
/// Copied from [isUserBlocked].
@ProviderFor(isUserBlocked)
const isUserBlockedProvider = IsUserBlockedFamily();

/// 특정 사용자의 차단 여부 확인
///
/// Copied from [isUserBlocked].
class IsUserBlockedFamily extends Family<bool> {
  /// 특정 사용자의 차단 여부 확인
  ///
  /// Copied from [isUserBlocked].
  const IsUserBlockedFamily();

  /// 특정 사용자의 차단 여부 확인
  ///
  /// Copied from [isUserBlocked].
  IsUserBlockedProvider call(
    int userId,
  ) {
    return IsUserBlockedProvider(
      userId,
    );
  }

  @override
  IsUserBlockedProvider getProviderOverride(
    covariant IsUserBlockedProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isUserBlockedProvider';
}

/// 특정 사용자의 차단 여부 확인
///
/// Copied from [isUserBlocked].
class IsUserBlockedProvider extends AutoDisposeProvider<bool> {
  /// 특정 사용자의 차단 여부 확인
  ///
  /// Copied from [isUserBlocked].
  IsUserBlockedProvider(
    int userId,
  ) : this._internal(
          (ref) => isUserBlocked(
            ref as IsUserBlockedRef,
            userId,
          ),
          from: isUserBlockedProvider,
          name: r'isUserBlockedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isUserBlockedHash,
          dependencies: IsUserBlockedFamily._dependencies,
          allTransitiveDependencies:
              IsUserBlockedFamily._allTransitiveDependencies,
          userId: userId,
        );

  IsUserBlockedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    bool Function(IsUserBlockedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsUserBlockedProvider._internal(
        (ref) => create(ref as IsUserBlockedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsUserBlockedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsUserBlockedProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsUserBlockedRef on AutoDisposeProviderRef<bool> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _IsUserBlockedProviderElement extends AutoDisposeProviderElement<bool>
    with IsUserBlockedRef {
  _IsUserBlockedProviderElement(super.provider);

  @override
  int get userId => (origin as IsUserBlockedProvider).userId;
}

String _$blockStateHash() => r'e8d6563872a8741d8dbf91b85ddc6b6eceb95cae';

/// See also [BlockState].
@ProviderFor(BlockState)
final blockStateProvider =
    AutoDisposeAsyncNotifierProvider<BlockState, List<UserBlockDTO>>.internal(
  BlockState.new,
  name: r'blockStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$blockStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BlockState = AutoDisposeAsyncNotifier<List<UserBlockDTO>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
