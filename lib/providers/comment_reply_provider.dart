import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:pacapaca/services/comment_service.dart';
import 'package:pacapaca/providers/settings_provider.dart';

part 'comment_reply_provider.g.dart';

@riverpod
class CommentReplyList extends _$CommentReplyList {
  final _commentService = GetIt.instance<CommentService>();

  int? _lastPagingKey;
  String _sort = 'latest';

  @override
  FutureOr<List<ArticleCommentDTO>?> build(
    int articleId,
    int commentId,
  ) async {
    _lastPagingKey = null;
    _sort = ref.watch(commentSortProvider);

    final replies = await _commentService.listReplies(
      articleId,
      commentId,
      20,
      null,
      _sort,
    );
    return replies;
  }

  Future<void> loadMore(int articleId, int commentId) async {
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
        _sort,
      );

      if (newReplies == null || newReplies.isEmpty) return;

      if (_sort == 'latest') {
        state = AsyncData([...currentReplies, ...newReplies]);
      } else {
        state = AsyncData([...newReplies, ...currentReplies]);
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> delete(int articleId, int commentId) async {
    await _commentService.deleteComment(articleId, commentId);
    state = AsyncData(
        state.value?.where((reply) => reply.id != commentId).toList());
  }
}
