import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/article_service.dart';
import '../models/dto/article_dto.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/models/enums/article_category.dart';

part 'article_provider.g.dart';

@riverpod
ArticleService articleService(ArticleServiceRef ref) {
  return GetIt.instance<ArticleService>();
}

// 게시글 목록 provider
@riverpod
class ArticleList extends _$ArticleList {
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
    final articleService = ref.watch(articleServiceProvider);
    final articles = await articleService.getArticles(
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

    final articleService = ref.read(articleServiceProvider);
    try {
      final articles = await articleService.getArticles(
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
    final lastArticle = state.value?.last;
    final pagingViewCount = lastArticle?.viewCount;
    final pagingArticleId = lastArticle?.id;
    // 이전과 같은 페이징 키면 요청하지 않음
    if (pagingViewCount == _lastPagingViewCount &&
        pagingArticleId == _lastPagingArticleId) {
      return;
    }

    try {
      _lastPagingViewCount = pagingViewCount; // 현재 페이징 키 저장
      _lastPagingArticleId = pagingArticleId; // 현재 페이징 키 저장
      final articleService = ref.read(articleServiceProvider);
      final moreArticles = await articleService.getArticles(
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

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// 게시글 상세 provider
@riverpod
class Article extends _$Article {
  @override
  FutureOr<ArticleDTO?> build(int articleId) async {
    final articleService = ref.watch(articleServiceProvider);
    return articleService.getArticle(articleId);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

// 댓글 목록 provider
@riverpod
class ArticleComments extends _$ArticleComments {
  int? _lastPagingKey; // 마지막으로 요청한 페이징 키 저장
  String? _sort; // 댓글 정렬 기준 저장

  @override
  FutureOr<List<ArticleCommentDTO>?> build(int articleId) async {
    _lastPagingKey = null; // 초기화
    _sort = ref.watch(commentSortProvider);
    final articleService = ref.watch(articleServiceProvider);
    return articleService.listComments(articleId, 20, 0, _sort);
  }

  Future<void> addComment(String content) async {
    state = const AsyncLoading();
    try {
      final articleService = ref.read(articleServiceProvider);
      final request = CreateCommentRequest(content: content);
      final newComment = await articleService.createComment(articleId, request);

      if (newComment != null) {
        final currentComments = state.value ?? [];
        if (_sort == 'latest') {
          state = AsyncData([
            newComment,
            ...currentComments,
          ]);
        } else {
          state = AsyncData([
            ...currentComments,
            newComment,
          ]);
        }
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> updateComment(int commentId, String content) async {
    state = const AsyncLoading();
    try {
      final articleService = ref.read(articleServiceProvider);
      final request = UpdateCommentRequest(content: content);
      final updatedComment = await articleService.updateComment(
        articleId,
        commentId,
        request,
      );

      if (updatedComment != null) {
        final currentComments = state.value ?? [];
        final updatedComments = currentComments.map((comment) {
          return comment.id == commentId ? updatedComment : comment;
        }).toList();
        state = AsyncData(updatedComments);
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> deleteComment(int commentId) async {
    state = const AsyncLoading();
    try {
      final articleService = ref.read(articleServiceProvider);
      await articleService.deleteComment(articleId, commentId);

      final currentComments = state.value ?? [];
      final updatedComments =
          currentComments.where((comment) => comment.id != commentId).toList();
      state = AsyncData(updatedComments);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> loadMore() async {
    final currentComments = state.value ?? [];
    if (currentComments.isEmpty) return;

    final lastComment = currentComments.last;
    // 이전과 같은 페이징 키면 요청하지 않음
    if (lastComment.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastComment.id; // 현재 페이징 키 저장
      final articleService = ref.read(articleServiceProvider);
      final newComments = await articleService.listComments(
        articleId,
        20,
        lastComment.id,
        _sort,
      );

      if (newComments == null || newComments.isEmpty) return;

      state = AsyncData([...currentComments, ...newComments]);
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
  @override
  FutureOr<void> build() {}

  Future<ArticleDTO?> createArticle(CreateArticleRequest request) async {
    state = const AsyncLoading();
    try {
      final articleService = ref.read(articleServiceProvider);
      final article = await articleService.createArticle(request);
      state = const AsyncData(null);
      return article;
    } catch (e, stack) {
      state = AsyncError(e, stack);
      return null;
    }
  }

  Future<ArticleDTO?> updateArticle(
    int articleId,
    UpdateArticleRequest request,
  ) async {
    state = const AsyncLoading();
    try {
      final articleService = ref.read(articleServiceProvider);
      final article = await articleService.updateArticle(articleId, request);
      state = const AsyncData(null);
      return article;
    } catch (e, stack) {
      state = AsyncError(e, stack);
      return null;
    }
  }

  Future<void> deleteArticle(int articleId) async {
    state = const AsyncLoading();
    try {
      final articleService = ref.read(articleServiceProvider);
      await articleService.deleteArticle(articleId);
      state = const AsyncData(null);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}

// 게시글 검색 provider
@riverpod
class ArticleSearch extends _$ArticleSearch {
  int? _lastPagingKey; // 마지막으로 요청한 페이징 키 저장

  @override
  FutureOr<List<ArticleDTO>?> build(String query) async {
    if (query.isEmpty) return null;

    _lastPagingKey = null; // 초기화
    final articleService = ref.watch(articleServiceProvider);
    return articleService.searchArticles(
      query: query,
      limit: 20,
    );
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
      final articleService = ref.read(articleServiceProvider);
      final moreArticles = await articleService.searchArticles(
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
