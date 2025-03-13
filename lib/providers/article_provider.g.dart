// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$articleCacheHash() => r'7eb3e51493be34f26cbd9fcacdfb2f62abf66081';

/// See also [ArticleCache].
@ProviderFor(ArticleCache)
final articleCacheProvider =
    AutoDisposeNotifierProvider<ArticleCache, Map<int, ArticleDTO>>.internal(
  ArticleCache.new,
  name: r'articleCacheProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$articleCacheHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ArticleCache = AutoDisposeNotifier<Map<int, ArticleDTO>>;
String _$articleHash() => r'a107242ce9304f2b9f0f6a8afa88723e69fd3a19';

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

String _$articleListHash() => r'a602b357a70b6690b0b17493a2982b766519d095';

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

String _$articleEditorHash() => r'0e68118c4fb5e3cff8071e6dd99d9189632c5a72';

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
String _$articleSearchHash() => r'1a34adedbd4a7545e271a4dc0c31e50eee0f726a';

abstract class _$ArticleSearch
    extends BuildlessAutoDisposeAsyncNotifier<List<ArticleDTO>?> {
  late final String query;

  FutureOr<List<ArticleDTO>?> build(
    String query,
  );
}

/// See also [ArticleSearch].
@ProviderFor(ArticleSearch)
const articleSearchProvider = ArticleSearchFamily();

/// See also [ArticleSearch].
class ArticleSearchFamily extends Family<AsyncValue<List<ArticleDTO>?>> {
  /// See also [ArticleSearch].
  const ArticleSearchFamily();

  /// See also [ArticleSearch].
  ArticleSearchProvider call(
    String query,
  ) {
    return ArticleSearchProvider(
      query,
    );
  }

  @override
  ArticleSearchProvider getProviderOverride(
    covariant ArticleSearchProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'articleSearchProvider';
}

/// See also [ArticleSearch].
class ArticleSearchProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ArticleSearch, List<ArticleDTO>?> {
  /// See also [ArticleSearch].
  ArticleSearchProvider(
    String query,
  ) : this._internal(
          () => ArticleSearch()..query = query,
          from: articleSearchProvider,
          name: r'articleSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$articleSearchHash,
          dependencies: ArticleSearchFamily._dependencies,
          allTransitiveDependencies:
              ArticleSearchFamily._allTransitiveDependencies,
          query: query,
        );

  ArticleSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  FutureOr<List<ArticleDTO>?> runNotifierBuild(
    covariant ArticleSearch notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(ArticleSearch Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArticleSearchProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ArticleSearch, List<ArticleDTO>?>
      createElement() {
    return _ArticleSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArticleSearchRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArticleDTO>?> {
  /// The parameter `query` of this provider.
  String get query;
}

class _ArticleSearchProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArticleSearch,
        List<ArticleDTO>?> with ArticleSearchRef {
  _ArticleSearchProviderElement(super.provider);

  @override
  String get query => (origin as ArticleSearchProvider).query;
}

String _$userArticlesHash() => r'a8455c6ab7a08624ef7e6305582a0cd8699b954d';

abstract class _$UserArticles
    extends BuildlessAutoDisposeAsyncNotifier<List<ArticleDTO>?> {
  late final int userId;

  FutureOr<List<ArticleDTO>?> build(
    int userId,
  );
}

/// See also [UserArticles].
@ProviderFor(UserArticles)
const userArticlesProvider = UserArticlesFamily();

/// See also [UserArticles].
class UserArticlesFamily extends Family<AsyncValue<List<ArticleDTO>?>> {
  /// See also [UserArticles].
  const UserArticlesFamily();

  /// See also [UserArticles].
  UserArticlesProvider call(
    int userId,
  ) {
    return UserArticlesProvider(
      userId,
    );
  }

  @override
  UserArticlesProvider getProviderOverride(
    covariant UserArticlesProvider provider,
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
  String? get name => r'userArticlesProvider';
}

/// See also [UserArticles].
class UserArticlesProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserArticles, List<ArticleDTO>?> {
  /// See also [UserArticles].
  UserArticlesProvider(
    int userId,
  ) : this._internal(
          () => UserArticles()..userId = userId,
          from: userArticlesProvider,
          name: r'userArticlesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userArticlesHash,
          dependencies: UserArticlesFamily._dependencies,
          allTransitiveDependencies:
              UserArticlesFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserArticlesProvider._internal(
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
  FutureOr<List<ArticleDTO>?> runNotifierBuild(
    covariant UserArticles notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserArticles Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserArticlesProvider._internal(
        () => create()..userId = userId,
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
  AutoDisposeAsyncNotifierProviderElement<UserArticles, List<ArticleDTO>?>
      createElement() {
    return _UserArticlesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserArticlesProvider && other.userId == userId;
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
mixin UserArticlesRef
    on AutoDisposeAsyncNotifierProviderRef<List<ArticleDTO>?> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _UserArticlesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserArticles,
        List<ArticleDTO>?> with UserArticlesRef {
  _UserArticlesProviderElement(super.provider);

  @override
  int get userId => (origin as UserArticlesProvider).userId;
}

String _$likedPostsHash() => r'5980a955b7f4b6155fb0b4f57045614442f5f610';

abstract class _$LikedPosts
    extends BuildlessAutoDisposeAsyncNotifier<List<ArticleDTO>?> {
  late final int userId;

  FutureOr<List<ArticleDTO>?> build(
    int userId,
  );
}

/// See also [LikedPosts].
@ProviderFor(LikedPosts)
const likedPostsProvider = LikedPostsFamily();

/// See also [LikedPosts].
class LikedPostsFamily extends Family<AsyncValue<List<ArticleDTO>?>> {
  /// See also [LikedPosts].
  const LikedPostsFamily();

  /// See also [LikedPosts].
  LikedPostsProvider call(
    int userId,
  ) {
    return LikedPostsProvider(
      userId,
    );
  }

  @override
  LikedPostsProvider getProviderOverride(
    covariant LikedPostsProvider provider,
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
  String? get name => r'likedPostsProvider';
}

/// See also [LikedPosts].
class LikedPostsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    LikedPosts, List<ArticleDTO>?> {
  /// See also [LikedPosts].
  LikedPostsProvider(
    int userId,
  ) : this._internal(
          () => LikedPosts()..userId = userId,
          from: likedPostsProvider,
          name: r'likedPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likedPostsHash,
          dependencies: LikedPostsFamily._dependencies,
          allTransitiveDependencies:
              LikedPostsFamily._allTransitiveDependencies,
          userId: userId,
        );

  LikedPostsProvider._internal(
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
  FutureOr<List<ArticleDTO>?> runNotifierBuild(
    covariant LikedPosts notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(LikedPosts Function() create) {
    return ProviderOverride(
      origin: this,
      override: LikedPostsProvider._internal(
        () => create()..userId = userId,
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
  AutoDisposeAsyncNotifierProviderElement<LikedPosts, List<ArticleDTO>?>
      createElement() {
    return _LikedPostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikedPostsProvider && other.userId == userId;
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
mixin LikedPostsRef on AutoDisposeAsyncNotifierProviderRef<List<ArticleDTO>?> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _LikedPostsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<LikedPosts,
        List<ArticleDTO>?> with LikedPostsRef {
  _LikedPostsProviderElement(super.provider);

  @override
  int get userId => (origin as LikedPostsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
