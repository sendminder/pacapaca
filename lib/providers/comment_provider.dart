import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pacapaca/services/comment_service.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/models/enums/article_category.dart';
part 'comment_provider.g.dart';

// 댓글 목록 provider
@riverpod
class CommentList extends _$CommentList {
  final _commentService = GetIt.instance<CommentService>();

  int? _lastPagingKey; // 마지막으로 요청한 페이징 키 저장
  String _sort = 'latest'; // 댓글 정렬 기준 저장
  ArticleCategory _category = ArticleCategory.all;

  @override
  FutureOr<List<ArticleCommentDTO>?> build(int articleId) async {
    _lastPagingKey = null; // 초기화
    _sort = ref.watch(commentSortProvider);
    _category = ref.watch(articleCategoryProvider);

    final comments =
        await _commentService.listComments(articleId, 20, 0, _sort);
    return comments;
  }

  Future<ArticleCommentDTO?> addComment(int articleId, String content) async {
    state = const AsyncLoading();
    try {
      final request = RequestCreateComment(content: content);
      final newComment =
          await _commentService.createComment(articleId, request);

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

        // 댓글 수 업데이트
        ref.read(articleProvider(articleId).notifier).addCommentCount();

        // 활성화된 게시글 목록 업데이트
        ref
            .read(articleListProvider(
              limit: 20,
              sortBy: _sort,
              category: _category,
            ).notifier)
            .addCommentCount(articleId);
      }
      return newComment;
    } catch (e, stack) {
      state = AsyncError(e, stack);
      return null;
    }
  }

  Future<void> updateComment(
      int articleId, int commentId, String content) async {
    state = const AsyncLoading();
    try {
      final request = RequestUpdateComment(content: content);
      final updatedComment = await _commentService.updateComment(
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

  Future<void> deleteComment(int articleId, int commentId) async {
    state = const AsyncLoading();
    try {
      await _commentService.deleteComment(articleId, commentId);

      final currentComments = state.value ?? [];
      final updatedComments =
          currentComments.where((comment) => comment.id != commentId).toList();
      state = AsyncData(updatedComments);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> loadMore(int articleId) async {
    final currentComments = state.value ?? [];
    if (currentComments.isEmpty) return;

    final lastComment = currentComments.last;
    // 이전과 같은 페이징 키면 요청하지 않음
    if (lastComment.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastComment.id; // 현재 페이징 키 저장
      final newComments = await _commentService.listComments(
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
