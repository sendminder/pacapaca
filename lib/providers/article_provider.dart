import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/article_service.dart';
import '../models/dto/article_dto.dart';
import 'package:get_it/get_it.dart';

part 'article_provider.g.dart';

@riverpod
ArticleService articleService(ArticleServiceRef ref) {
  return GetIt.instance<ArticleService>();
}

// 게시글 목록 provider
@riverpod
class ArticleList extends _$ArticleList {
  @override
  FutureOr<List<ArticleDTO>?> build({
    required String sortBy,
    required int limit,
    int? pagingKey,
    String? category,
  }) async {
    final articleService = ref.watch(articleServiceProvider);
    return articleService.getArticles(
      sortBy: sortBy,
      limit: limit,
      pagingKey: pagingKey,
      category: category,
    );
  }

  Future<void> loadMore({
    required String sortBy,
    required int limit,
    required int pagingKey,
    String? category,
  }) async {
    state = const AsyncLoading();
    try {
      final articleService = ref.read(articleServiceProvider);
      final moreArticles = await articleService.getArticles(
        sortBy: sortBy,
        limit: limit,
        pagingKey: pagingKey,
        category: category,
      );

      // 기존 목록에 새로운 항목 추가
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
  @override
  FutureOr<List<ArticleCommentDTO>?> build(int articleId) async {
    final articleService = ref.watch(articleServiceProvider);
    return articleService.getComments(articleId);
  }

  Future<void> addComment(String content) async {
    state = const AsyncLoading();
    try {
      final articleService = ref.read(articleServiceProvider);
      final request = CreateCommentRequest(content: content);
      final newComment = await articleService.createComment(articleId, request);

      if (newComment != null) {
        final currentComments = state.value ?? [];
        state = AsyncData([newComment, ...currentComments]);
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
