import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/article_service.dart';
import '../models/dto/article_dto.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:logger/logger.dart';
part 'article_provider.g.dart';

// 게시글 캐시 관리 provider
@riverpod
class ArticleCache extends _$ArticleCache {
  @override
  Map<int, ArticleDTO> build() {
    return {};
  }

  void updateArticle(ArticleDTO article) {
    state = {...state, article.id: article};
  }

  void updateArticles(List<ArticleDTO> articles) {
    final updates = {for (final article in articles) article.id: article};
    state = {...state, ...updates};
  }

  void updateArticleField(
    int articleId, {
    bool? isLiked,
    int? likeCount,
    int? viewCount,
    int? commentCount,
  }) {
    final article = state[articleId];
    if (article == null) return;

    final updatedArticle = article.copyWith(
      isLiked: isLiked ?? article.isLiked,
      likeCount: likeCount ?? article.likeCount,
      viewCount: viewCount ?? article.viewCount,
      commentCount: commentCount ?? article.commentCount,
    );

    // 올바른 방법으로 Map 업데이트 (스프레드 연산자와 함께 사용)
    final newState = Map<int, ArticleDTO>.from(state);
    newState[articleId] = updatedArticle;
    state = newState;
  }
}

// 게시글 상세 provider
@riverpod
class Article extends _$Article {
  final _articleService = GetIt.instance<ArticleService>();

  @override
  FutureOr<ArticleDTO?> build(int articleId) async {
    // 캐시에서 게시글 확인
    final cachedArticle =
        ref.watch(articleCacheProvider.select((cache) => cache[articleId]));

    // 캐시에 있으면 API 호출 없이 반환
    if (cachedArticle != null) {
      return cachedArticle;
    }

    // 캐시에 없으면 API 호출
    final article = await _articleService.getArticle(articleId);
    if (article != null) {
      // 캐시에 저장
      ref.read(articleCacheProvider.notifier).updateArticle(article);
    }
    return article;
  }

  Future<ResponseArticleLike?> toggleArticleLike(int articleId) async {
    final response = await _articleService.toggleArticleLike(articleId);

    if (response != null) {
      final currentArticle = state.value;
      if (currentArticle != null) {
        final updatedArticle = currentArticle.copyWith(
          isLiked: response.isLiked,
          likeCount: response.likeCount,
        );
        // 캐시 업데이트
        ref.read(articleCacheProvider.notifier).updateArticle(updatedArticle);
        // 현재 provider 상태 업데이트
        state = AsyncData(updatedArticle);
      }
    }

    return response;
  }

  Future<void> addCommentCount() async {
    final currentArticle = state.value;
    if (currentArticle == null) return;

    final updatedArticle = currentArticle.copyWith(
      commentCount: currentArticle.commentCount + 1,
    );
    // 캐시 업데이트
    ref.read(articleCacheProvider.notifier).updateArticle(updatedArticle);
    // 현재 provider 상태 업데이트
    state = AsyncData(updatedArticle);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  // 캐시 직접 업데이트를 위한 헬퍼 메서드
  void updateCache(ArticleDTO article) {
    ref.read(articleCacheProvider.notifier).updateArticle(article);
  }
}

// 게시글 목록 provider
@riverpod
class ArticleList extends _$ArticleList {
  final _articleService = GetIt.instance<ArticleService>();

  int? _lastPagingViewCount;
  int? _lastPagingArticleId;

  @override
  FutureOr<List<ArticleDTO>?> build({
    required String sortBy,
    required int limit,
    int? pagingViewCount,
    int? pagingArticleId,
    ArticleCategory? category,
  }) async {
    // 이미 데이터가 있으면 캐시 반영 (각 게시글의 ID 목록을 유지)
    if (state.hasValue && state.value != null) {
      // 현재 목록의 ID 목록 추출
      final articleIds = state.value!.map((article) => article.id).toList();

      // 캐시에서 해당 ID의 게시글만 감시 (전체 캐시를 감시하지 않음)
      // 이렇게 하면 목록에 있는 게시글만 변경 감지
      final articleCache = ref.watch(articleCacheProvider.select((cache) {
        // 현재 목록에 있는 게시글의 캐시 상태만 반환
        return {
          for (final id in articleIds)
            if (cache.containsKey(id)) id: cache[id]!
        };
      }));

      // 캐시의 최신 상태로 업데이트
      return state.value!.map((article) {
        return articleCache[article.id] ?? article;
      }).toList();
    }

    // 초기 데이터 로드
    final articles = await _articleService.getArticles(
      sortBy: sortBy,
      limit: limit,
      pagingViewCount: pagingViewCount,
      pagingArticleId: pagingArticleId,
      category: category,
    );

    if (articles != null) {
      // 캐시에 저장
      ref.read(articleCacheProvider.notifier).updateArticles(articles);
    }

    return articles;
  }

  // 명시적 새로고침을 위한 메서드
  Future<void> forceRefresh({
    required String sortBy,
    required int limit,
    ArticleCategory? category,
  }) async {
    state = const AsyncLoading();

    try {
      final articles = await _articleService.getArticles(
        sortBy: sortBy,
        limit: limit,
        category: category,
      );

      if (articles != null) {
        // 캐시에 저장
        ref.read(articleCacheProvider.notifier).updateArticles(articles);
      }

      state = AsyncData(articles);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> loadMore({
    required String sortBy,
    required int limit,
    ArticleCategory? category,
  }) async {
    if (state.value == null) return;
    final lastArticle = state.value!.last;
    final pagingViewCount = lastArticle.viewCount;
    final pagingArticleId = lastArticle.id;

    if (pagingViewCount == _lastPagingViewCount &&
        pagingArticleId == _lastPagingArticleId) {
      return;
    }

    try {
      _lastPagingViewCount = pagingViewCount;
      _lastPagingArticleId = pagingArticleId;
      final moreArticles = await _articleService.getArticles(
        sortBy: sortBy,
        limit: limit,
        pagingViewCount: pagingViewCount,
        pagingArticleId: pagingArticleId,
        category: category,
      );

      if (moreArticles != null) {
        // 캐시에 저장
        ref.read(articleCacheProvider.notifier).updateArticles(moreArticles);
      }

      final currentArticles = state.value ?? [];
      state = AsyncData([...currentArticles, ...moreArticles ?? []]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// 게시글 작성/수정 provider
@riverpod
class ArticleEditor extends _$ArticleEditor {
  final _articleService = GetIt.instance<ArticleService>();
  final logger = GetIt.instance<Logger>();

  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> createArticle(RequestCreateArticle request) async {
    try {
      await _articleService.createArticle(request);
    } catch (e, stack) {
      logger.e('ArticleEditor createArticle error $e $stack');
      rethrow;
    }
  }

  Future<void> deleteArticle(int articleId) async {
    try {
      await _articleService.deleteArticle(articleId);
    } catch (e, stack) {
      logger.e('ArticleEditor deleteArticle error $e $stack');
      rethrow;
    }
  }
}

// 게시글 검색 provider
@riverpod
class ArticleSearch extends _$ArticleSearch {
  final _articleService = GetIt.instance<ArticleService>();
  int? _lastPagingKey;

  @override
  FutureOr<List<ArticleDTO>?> build(String query) async {
    if (query.isEmpty) return null;

    // 이미 데이터가 있으면 캐시 반영
    if (state.hasValue && state.value != null) {
      // 현재 목록의 ID 목록 추출
      final articleIds = state.value!.map((article) => article.id).toList();

      // 캐시에서 해당 ID의 게시글만 감시
      final articleCache = ref.watch(articleCacheProvider.select((cache) {
        return {
          for (final id in articleIds)
            if (cache.containsKey(id)) id: cache[id]!
        };
      }));

      // 캐시의 최신 상태로 업데이트
      return state.value!.map((article) {
        return articleCache[article.id] ?? article;
      }).toList();
    }

    // 초기 데이터 로드
    _lastPagingKey = null;
    final articles = await _articleService.searchArticles(
      query: query,
      limit: 20,
    );

    if (articles != null) {
      // 캐시에 저장
      ref.read(articleCacheProvider.notifier).updateArticles(articles);
    }

    return articles;
  }

  Future<void> loadMore(String query) async {
    if (query.isEmpty) return;

    final currentArticles = state.value ?? [];
    if (currentArticles.isEmpty) return;

    final lastArticle = currentArticles.last;
    if (lastArticle.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastArticle.id;
      final moreArticles = await _articleService.searchArticles(
        query: query,
        limit: 20,
        pagingKey: lastArticle.id,
      );

      if (moreArticles != null) {
        // 캐시에 저장
        ref.read(articleCacheProvider.notifier).updateArticles(moreArticles);
      }

      if (moreArticles == null || moreArticles.isEmpty) return;
      state = AsyncData([...currentArticles, ...moreArticles]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh(String query) async {
    ref.invalidateSelf();
  }
}

// 유저 게시글 모아보기
@riverpod
class UserArticles extends _$UserArticles {
  final _articleService = GetIt.instance<ArticleService>();
  int? _lastPagingKey;

  @override
  FutureOr<List<ArticleDTO>?> build(int userId) async {
    // 이미 데이터가 있으면 캐시 반영
    if (state.hasValue && state.value != null) {
      // 현재 목록의 ID 목록 추출
      final articleIds = state.value!.map((article) => article.id).toList();

      // 캐시에서 해당 ID의 게시글만 감시
      final articleCache = ref.watch(articleCacheProvider.select((cache) {
        return {
          for (final id in articleIds)
            if (cache.containsKey(id)) id: cache[id]!
        };
      }));

      // 캐시의 최신 상태로 업데이트
      return state.value!.map((article) {
        return articleCache[article.id] ?? article;
      }).toList();
    }

    // 초기 데이터 로드
    _lastPagingKey = null;
    final articles = await _articleService.getUserArticles(
      userId: userId,
      limit: 20,
    );

    if (articles != null) {
      // 캐시에 저장
      ref.read(articleCacheProvider.notifier).updateArticles(articles);
    }

    return articles;
  }

  Future<void> loadMore(int userId) async {
    final currentArticles = state.value ?? [];
    if (currentArticles.isEmpty) return;

    final lastArticle = currentArticles.last;
    if (lastArticle.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastArticle.id;
      final moreArticles = await _articleService.getUserArticles(
        userId: userId,
        limit: 20,
        pagingKey: lastArticle.id,
      );

      if (moreArticles != null) {
        // 캐시에 저장
        ref.read(articleCacheProvider.notifier).updateArticles(moreArticles);
      }

      if (moreArticles == null || moreArticles.isEmpty) return;
      state = AsyncData([...currentArticles, ...moreArticles]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh(int userId) async {
    ref.invalidateSelf();
  }
}

// 좋아요한 게시글 모아보기
@riverpod
class LikedPosts extends _$LikedPosts {
  final _articleService = GetIt.instance<ArticleService>();
  int? _lastPagingKey;

  @override
  FutureOr<List<ArticleDTO>?> build(int userId) async {
    // 이미 데이터가 있으면 캐시 반영
    if (state.hasValue && state.value != null) {
      // 현재 목록의 ID 목록 추출
      final articleIds = state.value!.map((article) => article.id).toList();

      // 캐시에서 해당 ID의 게시글만 감시
      final articleCache = ref.watch(articleCacheProvider.select((cache) {
        return {
          for (final id in articleIds)
            if (cache.containsKey(id)) id: cache[id]!
        };
      }));

      // 캐시의 최신 상태로 업데이트
      return state.value!.map((article) {
        return articleCache[article.id] ?? article;
      }).toList();
    }

    // 초기 데이터 로드
    _lastPagingKey = null;
    final articles = await _articleService.getLikedArticles(
      userId: userId,
      limit: 20,
    );

    if (articles != null) {
      // 캐시에 저장
      ref.read(articleCacheProvider.notifier).updateArticles(articles);
    }

    return articles;
  }

  Future<void> loadMore(int userId) async {
    final currentArticles = state.value ?? [];
    if (currentArticles.isEmpty) return;

    final lastArticle = currentArticles.last;
    if (lastArticle.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastArticle.id;
      final moreArticles = await _articleService.getLikedArticles(
        userId: userId,
        limit: 20,
        pagingKey: lastArticle.id,
      );

      if (moreArticles != null) {
        // 캐시에 저장
        ref.read(articleCacheProvider.notifier).updateArticles(moreArticles);
      }

      if (moreArticles == null || moreArticles.isEmpty) return;
      state = AsyncData([...currentArticles, ...moreArticles]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
