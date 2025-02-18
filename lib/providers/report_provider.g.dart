// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isUserReportedHash() => r'bd1481d928691a33fd597657de801c72bbff1d3d';

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

/// 특정 사용자에 대한 신고 여부 확인
///
/// Copied from [isUserReported].
@ProviderFor(isUserReported)
const isUserReportedProvider = IsUserReportedFamily();

/// 특정 사용자에 대한 신고 여부 확인
///
/// Copied from [isUserReported].
class IsUserReportedFamily extends Family<bool> {
  /// 특정 사용자에 대한 신고 여부 확인
  ///
  /// Copied from [isUserReported].
  const IsUserReportedFamily();

  /// 특정 사용자에 대한 신고 여부 확인
  ///
  /// Copied from [isUserReported].
  IsUserReportedProvider call(
    int userId,
  ) {
    return IsUserReportedProvider(
      userId,
    );
  }

  @override
  IsUserReportedProvider getProviderOverride(
    covariant IsUserReportedProvider provider,
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
  String? get name => r'isUserReportedProvider';
}

/// 특정 사용자에 대한 신고 여부 확인
///
/// Copied from [isUserReported].
class IsUserReportedProvider extends AutoDisposeProvider<bool> {
  /// 특정 사용자에 대한 신고 여부 확인
  ///
  /// Copied from [isUserReported].
  IsUserReportedProvider(
    int userId,
  ) : this._internal(
          (ref) => isUserReported(
            ref as IsUserReportedRef,
            userId,
          ),
          from: isUserReportedProvider,
          name: r'isUserReportedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isUserReportedHash,
          dependencies: IsUserReportedFamily._dependencies,
          allTransitiveDependencies:
              IsUserReportedFamily._allTransitiveDependencies,
          userId: userId,
        );

  IsUserReportedProvider._internal(
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
    bool Function(IsUserReportedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsUserReportedProvider._internal(
        (ref) => create(ref as IsUserReportedRef),
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
    return _IsUserReportedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsUserReportedProvider && other.userId == userId;
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
mixin IsUserReportedRef on AutoDisposeProviderRef<bool> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _IsUserReportedProviderElement extends AutoDisposeProviderElement<bool>
    with IsUserReportedRef {
  _IsUserReportedProviderElement(super.provider);

  @override
  int get userId => (origin as IsUserReportedProvider).userId;
}

String _$reportedUserIdsHash() => r'3d36284ec719a8856adfd8402d6550127f46b1c6';

/// 신고된 사용자 ID 목록 제공
///
/// Copied from [reportedUserIds].
@ProviderFor(reportedUserIds)
final reportedUserIdsProvider = AutoDisposeProvider<List<int>>.internal(
  reportedUserIds,
  name: r'reportedUserIdsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reportedUserIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReportedUserIdsRef = AutoDisposeProviderRef<List<int>>;
String _$reportStateHash() => r'dde5c6f6e6c746c7e562a8e733a077b171435fe3';

/// See also [ReportState].
@ProviderFor(ReportState)
final reportStateProvider =
    AutoDisposeAsyncNotifierProvider<ReportState, List<UserReportDTO>>.internal(
  ReportState.new,
  name: r'reportStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$reportStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReportState = AutoDisposeAsyncNotifier<List<UserReportDTO>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
