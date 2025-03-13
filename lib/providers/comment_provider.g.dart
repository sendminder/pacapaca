// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentListHash() => r'bdc6da45f4179503bd84d467675fcc3f6d908a68';

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

abstract class _$CommentList
    extends BuildlessAutoDisposeAsyncNotifier<List<ArticleCommentDTO>?> {
  late final int articleId;

  FutureOr<List<ArticleCommentDTO>?> build(
    int articleId,
  );
}

/// See also [CommentList].
@ProviderFor(CommentList)
const commentListProvider = CommentListFamily();

/// See also [CommentList].
class CommentListFamily extends Family<AsyncValue<List<ArticleCommentDTO>?>> {
  /// See also [CommentList].
  const CommentListFamily();

  /// See also [CommentList].
  CommentListProvider call(
    int articleId,
  ) {
    return CommentListProvider(
      articleId,
    );
  }

  @override
  CommentListProvider getProviderOverride(
    covariant CommentListProvider provider,
  ) {
    return call(
      provider.articleId,
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
  String? get name => r'commentListProvider';
}

/// See also [CommentList].
class CommentListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CommentList, List<ArticleCommentDTO>?> {
  /// See also [CommentList].
  CommentListProvider(
    int articleId,
  ) : this._internal(
          () => CommentList()..articleId = articleId,
          from: commentListProvider,
          name: r'commentListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentListHash,
          dependencies: CommentListFamily._dependencies,
          allTransitiveDependencies:
              CommentListFamily._allTransitiveDependencies,
          articleId: articleId,
        );

  CommentListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.articleId,
  }) : super.internal();

  final int articleId;

  @override
  FutureOr<List<ArticleCommentDTO>?> runNotifierBuild(
    covariant CommentList notifier,
  ) {
    return notifier.build(
      articleId,
    );
  }

  @override
  Override overrideWith(CommentList Function() create) {
    return ProviderOverride(
      origin: this,
      override: CommentListProvider._internal(
        () => create()..articleId = articleId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        articleId: articleId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CommentList, List<ArticleCommentDTO>?>
      createElement() {
    return _CommentListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentListProvider && other.articleId == articleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, articleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CommentListRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArticleCommentDTO>?> {
  /// The parameter `articleId` of this provider.
  int get articleId;
}

class _CommentListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CommentList,
        List<ArticleCommentDTO>?> with CommentListRef {
  _CommentListProviderElement(super.provider);

  @override
  int get articleId => (origin as CommentListProvider).articleId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
