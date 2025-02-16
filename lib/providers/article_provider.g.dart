// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$articleServiceHash() => r'dbb26e28bafdb152280ac179e5e13ec8a7451628';

/// See also [articleService].
@ProviderFor(articleService)
final articleServiceProvider = AutoDisposeProvider<ArticleService>.internal(
  articleService,
  name: r'articleServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$articleServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArticleServiceRef = AutoDisposeProviderRef<ArticleService>;
String _$articleListHash() => r'efa386661b627ccec693ee73d9ec9cd4c7db1c92';

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

abstract class _$ArticleList
    extends BuildlessAutoDisposeAsyncNotifier<List<ArticleDTO>?> {
  late final String sortBy;
  late final int limit;
  late final int? pagingViewCount;
  late final int? pagingArticleId;
  late final ArticleCategory? category;

  FutureOr<List<ArticleDTO>?> build({
    required String sortBy,
    required int limit,
    int? pagingViewCount,
    int? pagingArticleId,
    ArticleCategory? category,
  });
}

/// See also [ArticleList].
@ProviderFor(ArticleList)
const articleListProvider = ArticleListFamily();

/// See also [ArticleList].
class ArticleListFamily extends Family<AsyncValue<List<ArticleDTO>?>> {
  /// See also [ArticleList].
  const ArticleListFamily();

  /// See also [ArticleList].
  ArticleListProvider call({
    required String sortBy,
    required int limit,
    int? pagingViewCount,
    int? pagingArticleId,
    ArticleCategory? category,
  }) {
    return ArticleListProvider(
      sortBy: sortBy,
      limit: limit,
      pagingViewCount: pagingViewCount,
      pagingArticleId: pagingArticleId,
      category: category,
    );
  }

  @override
  ArticleListProvider getProviderOverride(
    covariant ArticleListProvider provider,
  ) {
    return call(
      sortBy: provider.sortBy,
      limit: provider.limit,
      pagingViewCount: provider.pagingViewCount,
      pagingArticleId: provider.pagingArticleId,
      category: provider.category,
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
  String? get name => r'articleListProvider';
}

/// See also [ArticleList].
class ArticleListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ArticleList, List<ArticleDTO>?> {
  /// See also [ArticleList].
  ArticleListProvider({
    required String sortBy,
    required int limit,
    int? pagingViewCount,
    int? pagingArticleId,
    ArticleCategory? category,
  }) : this._internal(
          () => ArticleList()
            ..sortBy = sortBy
            ..limit = limit
            ..pagingViewCount = pagingViewCount
            ..pagingArticleId = pagingArticleId
            ..category = category,
          from: articleListProvider,
          name: r'articleListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$articleListHash,
          dependencies: ArticleListFamily._dependencies,
          allTransitiveDependencies:
              ArticleListFamily._allTransitiveDependencies,
          sortBy: sortBy,
          limit: limit,
          pagingViewCount: pagingViewCount,
          pagingArticleId: pagingArticleId,
          category: category,
        );

  ArticleListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sortBy,
    required this.limit,
    required this.pagingViewCount,
    required this.pagingArticleId,
    required this.category,
  }) : super.internal();

  final String sortBy;
  final int limit;
  final int? pagingViewCount;
  final int? pagingArticleId;
  final ArticleCategory? category;

  @override
  FutureOr<List<ArticleDTO>?> runNotifierBuild(
    covariant ArticleList notifier,
  ) {
    return notifier.build(
      sortBy: sortBy,
      limit: limit,
      pagingViewCount: pagingViewCount,
      pagingArticleId: pagingArticleId,
      category: category,
    );
  }

  @override
  Override overrideWith(ArticleList Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArticleListProvider._internal(
        () => create()
          ..sortBy = sortBy
          ..limit = limit
          ..pagingViewCount = pagingViewCount
          ..pagingArticleId = pagingArticleId
          ..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sortBy: sortBy,
        limit: limit,
        pagingViewCount: pagingViewCount,
        pagingArticleId: pagingArticleId,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ArticleList, List<ArticleDTO>?>
      createElement() {
    return _ArticleListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleListProvider &&
        other.sortBy == sortBy &&
        other.limit == limit &&
        other.pagingViewCount == pagingViewCount &&
        other.pagingArticleId == pagingArticleId &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, pagingViewCount.hashCode);
    hash = _SystemHash.combine(hash, pagingArticleId.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArticleListRef on AutoDisposeAsyncNotifierProviderRef<List<ArticleDTO>?> {
  /// The parameter `sortBy` of this provider.
  String get sortBy;

  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `pagingViewCount` of this provider.
  int? get pagingViewCount;

  /// The parameter `pagingArticleId` of this provider.
  int? get pagingArticleId;

  /// The parameter `category` of this provider.
  ArticleCategory? get category;
}

class _ArticleListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArticleList,
        List<ArticleDTO>?> with ArticleListRef {
  _ArticleListProviderElement(super.provider);

  @override
  String get sortBy => (origin as ArticleListProvider).sortBy;
  @override
  int get limit => (origin as ArticleListProvider).limit;
  @override
  int? get pagingViewCount => (origin as ArticleListProvider).pagingViewCount;
  @override
  int? get pagingArticleId => (origin as ArticleListProvider).pagingArticleId;
  @override
  ArticleCategory? get category => (origin as ArticleListProvider).category;
}

String _$articleHash() => r'259cf70eaa3cc100fa0fc7997072c4dbc0eac25e';

abstract class _$Article
    extends BuildlessAutoDisposeAsyncNotifier<ArticleDTO?> {
  late final int articleId;

  FutureOr<ArticleDTO?> build(
    int articleId,
  );
}

/// See also [Article].
@ProviderFor(Article)
const articleProvider = ArticleFamily();

/// See also [Article].
class ArticleFamily extends Family<AsyncValue<ArticleDTO?>> {
  /// See also [Article].
  const ArticleFamily();

  /// See also [Article].
  ArticleProvider call(
    int articleId,
  ) {
    return ArticleProvider(
      articleId,
    );
  }

  @override
  ArticleProvider getProviderOverride(
    covariant ArticleProvider provider,
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
  String? get name => r'articleProvider';
}

/// See also [Article].
class ArticleProvider
    extends AutoDisposeAsyncNotifierProviderImpl<Article, ArticleDTO?> {
  /// See also [Article].
  ArticleProvider(
    int articleId,
  ) : this._internal(
          () => Article()..articleId = articleId,
          from: articleProvider,
          name: r'articleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$articleHash,
          dependencies: ArticleFamily._dependencies,
          allTransitiveDependencies: ArticleFamily._allTransitiveDependencies,
          articleId: articleId,
        );

  ArticleProvider._internal(
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
  FutureOr<ArticleDTO?> runNotifierBuild(
    covariant Article notifier,
  ) {
    return notifier.build(
      articleId,
    );
  }

  @override
  Override overrideWith(Article Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArticleProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<Article, ArticleDTO?>
      createElement() {
    return _ArticleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleProvider && other.articleId == articleId;
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
mixin ArticleRef on AutoDisposeAsyncNotifierProviderRef<ArticleDTO?> {
  /// The parameter `articleId` of this provider.
  int get articleId;
}

class _ArticleProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<Article, ArticleDTO?>
    with ArticleRef {
  _ArticleProviderElement(super.provider);

  @override
  int get articleId => (origin as ArticleProvider).articleId;
}

String _$articleCommentsHash() => r'b9b3e42c8012ef5438f169075e67df4cb60d721b';

abstract class _$ArticleComments
    extends BuildlessAutoDisposeAsyncNotifier<List<ArticleCommentDTO>?> {
  late final int articleId;

  FutureOr<List<ArticleCommentDTO>?> build(
    int articleId,
  );
}

/// See also [ArticleComments].
@ProviderFor(ArticleComments)
const articleCommentsProvider = ArticleCommentsFamily();

/// See also [ArticleComments].
class ArticleCommentsFamily
    extends Family<AsyncValue<List<ArticleCommentDTO>?>> {
  /// See also [ArticleComments].
  const ArticleCommentsFamily();

  /// See also [ArticleComments].
  ArticleCommentsProvider call(
    int articleId,
  ) {
    return ArticleCommentsProvider(
      articleId,
    );
  }

  @override
  ArticleCommentsProvider getProviderOverride(
    covariant ArticleCommentsProvider provider,
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
  String? get name => r'articleCommentsProvider';
}

/// See also [ArticleComments].
class ArticleCommentsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ArticleComments, List<ArticleCommentDTO>?> {
  /// See also [ArticleComments].
  ArticleCommentsProvider(
    int articleId,
  ) : this._internal(
          () => ArticleComments()..articleId = articleId,
          from: articleCommentsProvider,
          name: r'articleCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$articleCommentsHash,
          dependencies: ArticleCommentsFamily._dependencies,
          allTransitiveDependencies:
              ArticleCommentsFamily._allTransitiveDependencies,
          articleId: articleId,
        );

  ArticleCommentsProvider._internal(
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
    covariant ArticleComments notifier,
  ) {
    return notifier.build(
      articleId,
    );
  }

  @override
  Override overrideWith(ArticleComments Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArticleCommentsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ArticleComments,
      List<ArticleCommentDTO>?> createElement() {
    return _ArticleCommentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleCommentsProvider && other.articleId == articleId;
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
mixin ArticleCommentsRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArticleCommentDTO>?> {
  /// The parameter `articleId` of this provider.
  int get articleId;
}

class _ArticleCommentsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArticleComments,
        List<ArticleCommentDTO>?> with ArticleCommentsRef {
  _ArticleCommentsProviderElement(super.provider);

  @override
  int get articleId => (origin as ArticleCommentsProvider).articleId;
}

String _$articleEditorHash() => r'747d259fca3c79daf6e7878736ed884929043ebe';

/// See also [ArticleEditor].
@ProviderFor(ArticleEditor)
final articleEditorProvider =
    AutoDisposeAsyncNotifierProvider<ArticleEditor, void>.internal(
  ArticleEditor.new,
  name: r'articleEditorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$articleEditorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ArticleEditor = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
