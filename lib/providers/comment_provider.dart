import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pacapaca/services/comment_service.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:get_it/get_it.dart';

part 'comment_provider.g.dart';

// 댓글 목록 provider
@riverpod
class CommentList extends _$CommentList {
  final _commentService = GetIt.instance<CommentService>();

  int? _lastPagingKey; // 마지막으로 요청한 페이징 키 저장
  String? _sort; // 댓글 정렬 기준 저장

  @override
  FutureOr<List<ArticleCommentDTO>?> build(int articleId) async {
    _lastPagingKey = null; // 초기화
    _sort = ref.watch(commentSortProvider);
    final comments =
        await _commentService.listComments(articleId, 20, 0, _sort);
    return comments;
  }

  Future<void> addComment(int articleId, String content) async {
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
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
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
