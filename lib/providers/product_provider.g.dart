// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsHash() => r'0b6aa37f3524e794a7525686947b3e97c6f94fc6';

/// See also [Products].
@ProviderFor(Products)
final productsProvider =
    AutoDisposeAsyncNotifierProvider<Products, List<ProductDTO>>.internal(
  Products.new,
  name: r'productsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Products = AutoDisposeAsyncNotifier<List<ProductDTO>>;
String _$featuredProductsHash() => r'e20c6e6e07af46767083068949ccecb170d9f4f0';

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

abstract class _$FeaturedProducts
    extends BuildlessAutoDisposeAsyncNotifier<List<ProductDTO>> {
  late final String platform;

  FutureOr<List<ProductDTO>> build({
    required String platform,
  });
}

/// See also [FeaturedProducts].
@ProviderFor(FeaturedProducts)
const featuredProductsProvider = FeaturedProductsFamily();

/// See also [FeaturedProducts].
class FeaturedProductsFamily extends Family<AsyncValue<List<ProductDTO>>> {
  /// See also [FeaturedProducts].
  const FeaturedProductsFamily();

  /// See also [FeaturedProducts].
  FeaturedProductsProvider call({
    required String platform,
  }) {
    return FeaturedProductsProvider(
      platform: platform,
    );
  }

  @override
  FeaturedProductsProvider getProviderOverride(
    covariant FeaturedProductsProvider provider,
  ) {
    return call(
      platform: provider.platform,
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
  String? get name => r'featuredProductsProvider';
}

/// See also [FeaturedProducts].
class FeaturedProductsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FeaturedProducts, List<ProductDTO>> {
  /// See also [FeaturedProducts].
  FeaturedProductsProvider({
    required String platform,
  }) : this._internal(
          () => FeaturedProducts()..platform = platform,
          from: featuredProductsProvider,
          name: r'featuredProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$featuredProductsHash,
          dependencies: FeaturedProductsFamily._dependencies,
          allTransitiveDependencies:
              FeaturedProductsFamily._allTransitiveDependencies,
          platform: platform,
        );

  FeaturedProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.platform,
  }) : super.internal();

  final String platform;

  @override
  FutureOr<List<ProductDTO>> runNotifierBuild(
    covariant FeaturedProducts notifier,
  ) {
    return notifier.build(
      platform: platform,
    );
  }

  @override
  Override overrideWith(FeaturedProducts Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeaturedProductsProvider._internal(
        () => create()..platform = platform,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        platform: platform,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FeaturedProducts, List<ProductDTO>>
      createElement() {
    return _FeaturedProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeaturedProductsProvider && other.platform == platform;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, platform.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FeaturedProductsRef
    on AutoDisposeAsyncNotifierProviderRef<List<ProductDTO>> {
  /// The parameter `platform` of this provider.
  String get platform;
}

class _FeaturedProductsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FeaturedProducts,
        List<ProductDTO>> with FeaturedProductsRef {
  _FeaturedProductsProviderElement(super.provider);

  @override
  String get platform => (origin as FeaturedProductsProvider).platform;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
