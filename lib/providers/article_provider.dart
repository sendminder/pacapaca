import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/article_service.dart';
import '../models/dto/article_dto.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:logger/logger.dart';
part 'article_provider.g.dart';

// 게시글 캐시 관리 provider - 중앙 집중식 상태 관리
@riverpod
class ArticleCache extends _$ArticleCache {
  final logger = GetIt.instance<Logger>();
  final _articleService = GetIt.instance<ArticleService>();

  @override
  Map<int, ArticleDTO> build() {
    return {};
  }

  // 게시글 단일 업데이트
  void updateArticle(ArticleDTO article) {
    logger.d(
        'ArticleCache: 게시글 업데이트 - id=${article.id}, isLiked=${article.isLiked}, likeCount=${article.likeCount}');
    final newState = Map<int, ArticleDTO>.from(state);
    newState[article.id] = article;
    state = newState;
  }

  // 게시글 목록 업데이트
  void updateArticles(List<ArticleDTO> articles) {
    final newState = Map<int, ArticleDTO>.from(state);
    for (final article in articles) {
      newState[article.id] = article;
    }
    state = newState;
  }

  // 좋아요 토글 (낙관적 UI 업데이트 + 서버 요청)
  Future<void> toggleLike(int articleId) async {
    final article = state[articleId];
    if (article == null) {
      logger.w('ArticleCache: 좋아요 토글 실패 - 캐시에 게시글 없음 (id=$articleId)');
      return;
    }

    // 낙관적 UI 업데이트
    final optimisticArticle = article.copyWith(
      isLiked: !article.isLiked,
      likeCount:
          article.isLiked ? article.likeCount - 1 : article.likeCount + 1,
    );

    logger.d(
        'ArticleCache: 좋아요 토글 (낙관적 업데이트) - id=$articleId, isLiked: ${article.isLiked} -> ${optimisticArticle.isLiked}, likeCount: ${article.likeCount} -> ${optimisticArticle.likeCount}');

    // 캐시 업데이트
    final newState = Map<int, ArticleDTO>.from(state);
    newState[articleId] = optimisticArticle;
    state = newState;

    try {
      // 서버 요청
      logger.d('ArticleCache: 서버에 좋아요 토글 요청 시작 - id=$articleId');
      final response = await _articleService.toggleArticleLike(articleId);
      logger.d(
          'ArticleCache: 서버 응답 받음 - id=$articleId, isLiked=${response?.isLiked}, likeCount=${response?.likeCount}');

      if (response != null) {
        // 서버 응답으로 최종 상태 업데이트
        final serverArticle = article.copyWith(
          isLiked: response.isLiked,
          likeCount: response.likeCount,
        );

        logger.d(
            'ArticleCache: 서버 응답으로 좋아요 업데이트 - id=$articleId, isLiked: ${article.isLiked} -> ${response.isLiked}, likeCount: ${article.likeCount} -> ${response.likeCount}');

        final finalState = Map<int, ArticleDTO>.from(state);
        finalState[articleId] = serverArticle;
        state = finalState;
      }
    } catch (e) {
      logger.e('ArticleCache: 좋아요 토글 중 오류 발생 - id=$articleId, error=$e');

      // 오류 발생 시 원래 상태로 복구
      final recoveryState = Map<int, ArticleDTO>.from(state);
      recoveryState[articleId] = article;
      state = recoveryState;
      rethrow;
    }
  }

  // 댓글 카운트 증가
  void incrementCommentCount(int articleId) {
    final article = state[articleId];
    if (article == null) return;

    final updatedArticle = article.copyWith(
      commentCount: article.commentCount + 1,
    );

    logger.d(
        'ArticleCache: 댓글 카운트 증가 - id=$articleId, commentCount: ${article.commentCount} -> ${updatedArticle.commentCount}');

    final newState = Map<int, ArticleDTO>.from(state);
    newState[articleId] = updatedArticle;
    state = newState;
  }

  // 조회수 증가
  void incrementViewCount(int articleId, int viewCount) {
    final article = state[articleId];
    if (article == null) return;

    final updatedArticle = article.copyWith(
      viewCount: viewCount,
    );

    logger.d(
        'ArticleCache: 조회수 증가 - id=$articleId, viewCount: ${article.viewCount} -> ${viewCount}');

    final newState = Map<int, ArticleDTO>.from(state);
    newState[articleId] = updatedArticle;
    state = newState;
  }
}

// 게시글 상세 provider
@riverpod
class Article extends _$Article {
  final _articleService = GetIt.instance<ArticleService>();
  final logger = GetIt.instance<Logger>();

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
    try {
      final article = await _articleService.getArticle(articleId);
      if (article != null) {
        // 캐시에 저장
        ref.read(articleCacheProvider.notifier).updateArticle(article);
      }
      return article;
    } catch (e) {
      logger.e('Article: 게시글 로드 중 오류 발생 - id=$articleId, error=$e');
      rethrow;
    }
  }
}

// 게시글 목록 provider
@riverpod
class ArticleList extends _$ArticleList {
  final _articleService = GetIt.instance<ArticleService>();
  final logger = GetIt.instance<Logger>();

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

      // 캐시의 최신 상태로 업데이트 (기존 순서 유지)
      final updatedArticles = state.value!.map((article) {
        return articleCache[article.id] ?? article;
      }).toList();

      return updatedArticles;
    }

    // 초기 데이터 로드
    try {
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
    } catch (e) {
      logger.e('ArticleList: 게시글 목록 로드 중 오류 발생 - error=$e');
      rethrow;
    }
  }

  // 더 많은 게시글 로드
  Future<void> loadMore({
    required String sortBy,
    required int limit,
    ArticleCategory? category,
  }) async {
    if (state.value == null || state.value!.isEmpty) return;

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

      if (moreArticles != null && moreArticles.isNotEmpty) {
        // 캐시에 저장
        ref.read(articleCacheProvider.notifier).updateArticles(moreArticles);

        // 현재 목록에 추가
        final currentArticles = state.value ?? [];
        state = AsyncData([...currentArticles, ...moreArticles]);
      }
    } catch (e) {
      logger.e('ArticleList: 더 많은 게시글 로드 중 오류 발생 - error=$e');
    }
  }

  // 새로고침
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
    } catch (e) {
      logger.e('ArticleList: 게시글 목록 새로고침 중 오류 발생 - error=$e');
      state = AsyncError(e, StackTrace.current);
    }
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

  Future<void> updateArticle(
      int articleId, RequestUpdateArticle request) async {
    try {
      await _articleService.updateArticle(articleId, request);
    } catch (e, stack) {
      logger.e('ArticleEditor updateArticle error $e $stack');
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
    // if (state.hasValue && state.value != null) {
    //   // 현재 목록의 ID 목록 추출
    //   final articleIds = state.value!.map((article) => article.id).toList();

    //   // 캐시에서 해당 ID의 게시글만 감시
    //   final articleCache = ref.watch(articleCacheProvider.select((cache) {
    //     return {
    //       for (final id in articleIds)
    //         if (cache.containsKey(id)) id: cache[id]!
    //     };
    //   }));

    //   // 캐시의 최신 상태로 업데이트
    //   return state.value!.map((article) {
    //     return articleCache[article.id] ?? article;
    //   }).toList();
    // }

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
    // // 이미 데이터가 있으면 캐시 반영
    // if (state.hasValue && state.value != null) {
    //   // 현재 목록의 ID 목록 추출
    //   final articleIds = state.value!.map((article) => article.id).toList();

    //   // 캐시에서 해당 ID의 게시글만 감시
    //   final articleCache = ref.watch(articleCacheProvider.select((cache) {
    //     return {
    //       for (final id in articleIds)
    //         if (cache.containsKey(id)) id: cache[id]!
    //     };
    //   }));

    //   // 캐시의 최신 상태로 업데이트
    //   return state.value!.map((article) {
    //     return articleCache[article.id] ?? article;
    //   }).toList();
    // }

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
