import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:pacapaca/services/comment_service.dart';

part 'comment_reply_provider.g.dart';

@riverpod
class CommentReplyList extends _$CommentReplyList {
  final _commentService = GetIt.instance<CommentService>();

  int? _lastPagingKey;

  @override
  FutureOr<List<ArticleCommentDTO>?> build(
    String sortBy,
    int articleId,
    int commentId,
  ) async {
    _lastPagingKey = null;

    final replies = await _commentService.listReplies(
      articleId,
      commentId,
      20,
      null,
      sortBy,
    );
    return replies;
  }

  Future<void> loadMore(
    String sortBy,
    int articleId,
    int commentId,
  ) async {
    final currentReplies = state.value ?? [];
    if (currentReplies.isEmpty) return;

    final lastReply = currentReplies.last;
    if (lastReply.id == _lastPagingKey) return;

    try {
      _lastPagingKey = lastReply.id;
      final newReplies = await _commentService.listReplies(
        articleId,
        commentId,
        20,
        lastReply.id,
        sortBy,
      );

      if (newReplies == null || newReplies.isEmpty) return;

      state = AsyncData([...currentReplies, ...newReplies]);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> delete(int articleId, int commentId) async {
    try {
      await _commentService.deleteComment(articleId, commentId);

      final currentReplies = state.value ?? [];
      final updatedReplies = currentReplies.map((reply) {
        if (reply.id == commentId) {
          return reply.copyWith(isDeleted: true);
        }
        return reply;
      }).toList();
      state = AsyncData(updatedReplies);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> addComment(
    String sortBy,
    int articleId,
    int commentId,
    String content,
  ) async {
    final comment = await _commentService.createComment(
      articleId,
      RequestCreateComment(
        content: content,
        parentId: commentId,
      ),
    );

    if (comment == null) return;

    if (sortBy == 'latest') {
      state = AsyncData([comment, ...state.value ?? []]);
    } else {
      state = AsyncData([...state.value ?? [], comment]);
    }
  }

  Future<void> toggleLike(int commentId) async {
    try {
      final response = await _commentService.toggleLikeComment(commentId);
      if (response == null) return;

      final currentReplies = state.value ?? [];
      final updatedReplies = currentReplies.map((reply) {
        return reply.id == commentId
            ? reply.copyWith(
                likeCount: response.likeCount,
                isLiked: response.isLiked,
              )
            : reply;
      }).toList();
      state = AsyncData(updatedReplies);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> updateComment(
    int articleId,
    int commentId,
    String content,
  ) async {
    final request = RequestUpdateComment(content: content);
    final updatedComment = await _commentService.updateComment(
      articleId,
      commentId,
      request,
    );

    if (updatedComment == null) return;

    final currentReplies = state.value ?? [];
    final updatedReplies = currentReplies.map((reply) {
      return reply.id == commentId ? updatedComment : reply;
    }).toList();
    state = AsyncData(updatedReplies);
  }
}
