import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:pacapaca/services/comment_service.dart';

part 'comment_reply_provider.g.dart';

@riverpod
class CommentReplyList extends _$CommentReplyList {
  final _commentService = GetIt.instance<CommentService>();

  int? _lastPagingKey;
  late String _sortBy;

  @override
  FutureOr<List<ArticleCommentDTO>?> build(
    String sortBy,
    int articleId,
    int commentId,
  ) async {
    _lastPagingKey = null;
    _sortBy = sortBy;

    final replies = await _commentService.listReplies(
      articleId,
      commentId,
      20,
      null,
      _sortBy,
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
    await _commentService.deleteComment(articleId, commentId);
    state = AsyncData(
        state.value?.where((reply) => reply.id != commentId).toList());
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
}
