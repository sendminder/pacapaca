import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/article_service.dart';
import '../models/dto/article_dto.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:logger/logger.dart';
part 'article_provider.g.dart';

// 게시글 상세 provider
@riverpod
class Article extends _$Article {
  final _articleService = GetIt.instance<ArticleService>();

  @override
  FutureOr<ArticleDTO?> build(int articleId) async {
    return _articleService.getArticle(articleId);
  }

  Future<ResponseArticleLike?> toggleArticleLike(int articleId) async {
    final article = await _articleService.toggleArticleLike(articleId);
    return article;
  }

  Future<void> updateArticleStatus(
      bool isLiked, int likeCount, int viewCount, int? commentCount) async {
    final currentArticle = state.value;
    if (currentArticle == null) return;
    final updatedArticle = currentArticle.copyWith(
      isLiked: isLiked,
      likeCount: likeCount,
      viewCount: viewCount,
      commentCount: commentCount ?? currentArticle.commentCount,
    );
    state = AsyncData(updatedArticle);
  }

  Future<void> addCommentCount() async {
    final currentArticle = state.value;
    if (currentArticle == null) return;
    final updatedArticle = currentArticle.copyWith(
      commentCount: currentArticle.commentCount + 1,
    );
    state = AsyncData(updatedArticle);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// 게시글 목록 provider
@riverpod
class ArticleList extends _$ArticleList {
  final _articleService = GetIt.instance<ArticleService>();

  int? _lastPagingViewCount; // 마지막으로 요청한 페이징 키 저장
  int? _lastPagingArticleId; // 마지막으로 요청한 페이징 키 저장
  DateTime? _lastFetchTime;
  static const _cacheValidDuration = Duration(minutes: 5);

  @override
  FutureOr<List<ArticleDTO>?> build({
    required String sortBy,
    required int limit,
    int? pagingViewCount,
    int? pagingArticleId,
    ArticleCategory? category,
  }) async {
    // 이미 데이터가 있고 캐시가 유효한 경우 기존 데이터 반환
    if (state.hasValue &&
        state.value != null &&
        _lastFetchTime != null &&
        DateTime.now().difference(_lastFetchTime!) < _cacheValidDuration) {
      return state.value;
    }

    _lastPagingViewCount = null; // 초기화
    _lastPagingArticleId = null; // 초기화
    final articles = await _articleService.getArticles(
      sortBy: sortBy,
      limit: limit,
      pagingViewCount: pagingViewCount,
      pagingArticleId: pagingArticleId,
      category: category,
    );

    _lastFetchTime = DateTime.now(); // 데이터 fetch 시간 업데이트
    return articles;
  }

  // 명시적 새로고침을 위한 메서드
  Future<void> forceRefresh({
    required String sortBy,
    required int limit,
    ArticleCategory? category,
  }) async {
    state = const AsyncLoading();
    _lastFetchTime = null; // 캐시 무효화

    try {
      final articles = await _articleService.getArticles(
        sortBy: sortBy,
        limit: limit,
        category: category,
      );
      _lastFetchTime = DateTime.now();
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
    // 이전과 같은 페이징 키면 요청하지 않음
    if (pagingViewCount == _lastPagingViewCount &&
        pagingArticleId == _lastPagingArticleId) {
      return;
    }

    try {
      _lastPagingViewCount = pagingViewCount; // 현재 페이징 키 저장
      _lastPagingArticleId = pagingArticleId; // 현재 페이징 키 저장
      final moreArticles = await _articleService.getArticles(
        sortBy: sortBy,
        limit: limit,
        pagingViewCount: pagingViewCount,
        pagingArticleId: pagingArticleId,
        category: category,
      );

      // 기존 목록에 새로운 항목 추가
      final currentArticles = state.value ?? [];
      state = AsyncData([...currentArticles, ...moreArticles ?? []]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  void updateArticleStatus({
    required int articleId,
    bool? isLiked,
    int? likeCount,
    int? viewCount,
  }) {
    final currentArticles = state.value ?? [];
    final updatedArticles = currentArticles.map((article) {
      if (article.id == articleId) {
        final updatedViewCount = viewCount ?? article.viewCount;
        final updatedIsLiked = isLiked ?? article.isLiked;
        final updatedLikeCount = likeCount ?? article.likeCount;
        return article.copyWith(
          isLiked: updatedIsLiked,
          likeCount: updatedLikeCount,
          viewCount: updatedViewCount,
        );
      }
      return article;
    }).toList();

    state = AsyncData(updatedArticles);
  }

  Future<void> addCommentCount(int articleId) async {
    final currentArticles = state.value;
    if (currentArticles == null) return;
    final updatedArticles = currentArticles.map((article) {
      if (article.id == articleId) {
        return article.copyWith(
          commentCount: article.commentCount + 1,
        );
      }
      return article;
    }).toList();
    state = AsyncData(updatedArticles);
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

  Future<void> updateArticle(
    int articleId,
    RequestUpdateArticle request,
  ) async {
    try {
      await _articleService.updateArticle(articleId, request);
    } catch (e, stack) {
      logger.e('ArticleEditor updateArticle error $e $stack');
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

  int? _lastPagingKey; // 마지막으로 요청한 페이징 키 저장

  @override
  FutureOr<List<ArticleDTO>?> build(String query) async {
    if (query.isEmpty) return null;
    _lastPagingKey = null; // 초기화
    final articles = await _articleService.searchArticles(
      query: query,
      limit: 20,
    );
    return articles;
  }

  Future<void> loadMore(String query) async {
    if (query.isEmpty) return;

    final currentArticles = state.value ?? [];
    if (currentArticles.isEmpty) return;

    final lastArticle = currentArticles.last;
    // 이전과 같은 페이징 키면 요청하지 않음
    if (lastArticle.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastArticle.id; // 현재 페이징 키 저장
      final moreArticles = await _articleService.searchArticles(
        query: query,
        limit: 20,
        pagingKey: lastArticle.id,
      );

      if (moreArticles == null || moreArticles.isEmpty) return;

      // 기존 목록에 새로운 항목 추가
      state = AsyncData([...currentArticles, ...moreArticles]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh(String query) async {
    ref.invalidateSelf();
  }

  void updateArticleStatus({
    required int articleId,
    bool? isLiked,
    int? likeCount,
  }) {
    final currentArticles = state.value ?? [];
    final updatedArticles = currentArticles.map((article) {
      if (article.id == articleId) {
        return article.copyWith(
          isLiked: isLiked ?? article.isLiked,
          likeCount: likeCount ?? article.likeCount,
        );
      }
      return article;
    }).toList();

    state = AsyncData(updatedArticles);
  }
}

// 유저 게시글 모아보기
@riverpod
class UserArticles extends _$UserArticles {
  final _articleService = GetIt.instance<ArticleService>();

  int? _lastPagingKey; // 마지막으로 요청한 페이징 키 저장

  @override
  FutureOr<List<ArticleDTO>?> build(int userId) async {
    _lastPagingKey = null; // 초기화
    final articles = await _articleService.getUserArticles(
      userId: userId,
      limit: 20,
    );
    return articles;
  }

  Future<void> loadMore(int userId) async {
    final currentArticles = state.value ?? [];
    if (currentArticles.isEmpty) return;

    final lastArticle = currentArticles.last;
    // 이전과 같은 페이징 키면 요청하지 않음
    if (lastArticle.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastArticle.id; // 현재 페이징 키 저장
      final moreArticles = await _articleService.getUserArticles(
        userId: userId,
        limit: 20,
        pagingKey: lastArticle.id,
      );

      if (moreArticles == null || moreArticles.isEmpty) return;

      // 기존 목록에 새로운 항목 추가
      state = AsyncData([...currentArticles, ...moreArticles]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh(int userId) async {
    ref.invalidateSelf();
  }

  void updateArticleStatus({
    required int articleId,
    bool? isLiked,
    int? likeCount,
    int? viewCount,
    int? commentCount,
  }) {
    final currentArticles = state.value ?? [];
    final updatedArticles = currentArticles.map((article) {
      if (article.id == articleId) {
        return article.copyWith(
          isLiked: isLiked ?? article.isLiked,
          likeCount: likeCount ?? article.likeCount,
          viewCount: viewCount ?? article.viewCount,
          commentCount: commentCount ?? article.commentCount,
        );
      }
      return article;
    }).toList();

    state = AsyncData(updatedArticles);
  }

  Future<void> addCommentCount(int articleId) async {
    final currentArticles = state.value;
    if (currentArticles == null) return;
    final updatedArticles = currentArticles.map((article) {
      if (article.id == articleId) {
        return article.copyWith(
          commentCount: article.commentCount + 1,
        );
      }
      return article;
    }).toList();
    state = AsyncData(updatedArticles);
  }
}

// 좋아요한 게시글 모아보기
@riverpod
class LikedPosts extends _$LikedPosts {
  final _articleService = GetIt.instance<ArticleService>();

  int? _lastPagingKey; // 마지막으로 요청한 페이징 키 저장

  @override
  FutureOr<List<ArticleDTO>?> build(int userId) async {
    _lastPagingKey = null; // 초기화
    final articles = await _articleService.getLikedArticles(
      userId: userId,
      limit: 20,
    );
    return articles;
  }

  Future<void> loadMore(int userId) async {
    final currentArticles = state.value ?? [];
    if (currentArticles.isEmpty) return;

    final lastArticle = currentArticles.last;
    // 이전과 같은 페이징 키면 요청하지 않음
    if (lastArticle.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastArticle.id; // 현재 페이징 키 저장
      final moreArticles = await _articleService.getLikedArticles(
        userId: userId,
        limit: 20,
        pagingKey: lastArticle.id,
      );

      if (moreArticles == null || moreArticles.isEmpty) return;

      // 기존 목록에 새로운 항목 추가
      state = AsyncData([...currentArticles, ...moreArticles]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  void updateArticleStatus({
    required int articleId,
    bool? isLiked,
    int? likeCount,
    int? viewCount,
    int? commentCount,
  }) {
    final currentArticles = state.value ?? [];
    final updatedArticles = currentArticles.map((article) {
      if (article.id == articleId) {
        return article.copyWith(
          isLiked: isLiked ?? article.isLiked,
          likeCount: likeCount ?? article.likeCount,
          viewCount: viewCount ?? article.viewCount,
          commentCount: commentCount ?? article.commentCount,
        );
      }
      return article;
    }).toList();

    state = AsyncData(updatedArticles);
  }

  Future<void> addCommentCount(int articleId) async {
    final currentArticles = state.value;
    if (currentArticles == null) return;
    final updatedArticles = currentArticles.map((article) {
      if (article.id == articleId) {
        return article.copyWith(
          commentCount: article.commentCount + 1,
        );
      }
      return article;
    }).toList();
    state = AsyncData(updatedArticles);
  }
}
