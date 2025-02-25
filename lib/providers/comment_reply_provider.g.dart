// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_reply_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentReplyListHash() => r'605093be92517aa689147fbb1f7d1147e2ccbfd4';

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

abstract class _$CommentReplyList
    extends BuildlessAutoDisposeAsyncNotifier<List<ArticleCommentDTO>?> {
  late final int articleId;
  late final int commentId;

  FutureOr<List<ArticleCommentDTO>?> build(
    int articleId,
    int commentId,
  );
}

/// See also [CommentReplyList].
@ProviderFor(CommentReplyList)
const commentReplyListProvider = CommentReplyListFamily();

/// See also [CommentReplyList].
class CommentReplyListFamily
    extends Family<AsyncValue<List<ArticleCommentDTO>?>> {
  /// See also [CommentReplyList].
  const CommentReplyListFamily();

  /// See also [CommentReplyList].
  CommentReplyListProvider call(
    int articleId,
    int commentId,
  ) {
    return CommentReplyListProvider(
      articleId,
      commentId,
    );
  }

  @override
  CommentReplyListProvider getProviderOverride(
    covariant CommentReplyListProvider provider,
  ) {
    return call(
      provider.articleId,
      provider.commentId,
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
  String? get name => r'commentReplyListProvider';
}

/// See also [CommentReplyList].
class CommentReplyListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CommentReplyList, List<ArticleCommentDTO>?> {
  /// See also [CommentReplyList].
  CommentReplyListProvider(
    int articleId,
    int commentId,
  ) : this._internal(
          () => CommentReplyList()
            ..articleId = articleId
            ..commentId = commentId,
          from: commentReplyListProvider,
          name: r'commentReplyListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentReplyListHash,
          dependencies: CommentReplyListFamily._dependencies,
          allTransitiveDependencies:
              CommentReplyListFamily._allTransitiveDependencies,
          articleId: articleId,
          commentId: commentId,
        );

  CommentReplyListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.articleId,
    required this.commentId,
  }) : super.internal();

  final int articleId;
  final int commentId;

  @override
  FutureOr<List<ArticleCommentDTO>?> runNotifierBuild(
    covariant CommentReplyList notifier,
  ) {
    return notifier.build(
      articleId,
      commentId,
    );
  }

  @override
  Override overrideWith(CommentReplyList Function() create) {
    return ProviderOverride(
      origin: this,
      override: CommentReplyListProvider._internal(
        () => create()
          ..articleId = articleId
          ..commentId = commentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        articleId: articleId,
        commentId: commentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CommentReplyList,
      List<ArticleCommentDTO>?> createElement() {
    return _CommentReplyListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentReplyListProvider &&
        other.articleId == articleId &&
        other.commentId == commentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, articleId.hashCode);
    hash = _SystemHash.combine(hash, commentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CommentReplyListRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArticleCommentDTO>?> {
  /// The parameter `articleId` of this provider.
  int get articleId;

  /// The parameter `commentId` of this provider.
  int get commentId;
}

class _CommentReplyListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CommentReplyList,
        List<ArticleCommentDTO>?> with CommentReplyListRef {
  _CommentReplyListProviderElement(super.provider);

  @override
  int get articleId => (origin as CommentReplyListProvider).articleId;
  @override
  int get commentId => (origin as CommentReplyListProvider).commentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
