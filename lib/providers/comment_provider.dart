import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pacapaca/services/comment_service.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/enums/article_category.dart';
part 'comment_provider.g.dart';

// 댓글 목록 provider
@riverpod
class CommentList extends _$CommentList {
  final _commentService = GetIt.instance<CommentService>();

  int? _lastPagingKey; // 마지막으로 요청한 페이징 키 저장
  String _sort = 'ordest'; // 댓글 정렬 기준 저장
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

  Future<void> addComment(int articleId, String content, int? parentId) async {
    try {
      final request =
          RequestCreateComment(content: content, parentId: parentId);
      final newComment =
          await _commentService.createComment(articleId, request);

      if (newComment != null) {
        final currentComments = state.value ?? [];

        if (parentId != null && parentId != 0) {
          // 대댓글인 경우
          final updatedComments = currentComments.map((comment) {
            if (comment.id == parentId) {
              // 부모 댓글 찾기
              final currentReplies = comment.replies ?? [];
              final updatedReplies = _sort == 'latest'
                  ? [newComment, ...currentReplies] // 최신순
                  : [...currentReplies, newComment]; // 오래된순

              return comment.copyWith(
                replies: updatedReplies,
                replyCount: (comment.replyCount ?? 0) + 1,
                hasMore: (comment.replyCount ?? 0) >= 3,
              );
            }
            return comment;
          }).toList();

          state = AsyncData(updatedComments);
        } else {
          // 일반 댓글인 경우
          state = AsyncData(_sort == 'latest'
              ? [newComment, ...currentComments]
              : [...currentComments, newComment]);
        }
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> updateComment(
      int articleId, int commentId, String content) async {
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
          // 메인 댓글 확인
          if (comment.id == commentId) {
            return comment.copyWith(content: updatedComment.content);
          }

          // 대댓글 확인
          if (comment.replies != null && comment.replies!.isNotEmpty) {
            final updatedReplies = comment.replies!.map((reply) {
              return reply.id == commentId ? updatedComment : reply;
            }).toList();
            return comment.copyWith(replies: updatedReplies);
          }

          return comment;
        }).toList();
        state = AsyncData(updatedComments);
      }
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> deleteComment(int articleId, int commentId) async {
    try {
      await _commentService.deleteComment(articleId, commentId);

      final currentComments = state.value ?? [];
      final updatedComments = currentComments.map((comment) {
        if (comment.id == commentId) {
          return comment.copyWith(
            isDeleted: true,
          );
        }
        if (comment.replies != null && comment.replies!.isNotEmpty) {
          final updatedReplies = comment.replies!.map((reply) {
            return reply.id == commentId
                ? reply.copyWith(isDeleted: true)
                : reply;
          }).toList();
          return comment.copyWith(replies: updatedReplies);
        }
        return comment;
      }).toList();

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

  Future<void> toggleLike(int commentId) async {
    try {
      final response = await _commentService.toggleLikeComment(commentId);
      if (response == null) return;

      final currentComments = state.value ?? [];
      final updatedComments = currentComments.map((comment) {
        // 메인 댓글 확인
        if (comment.id == commentId) {
          return comment.copyWith(
            likeCount: response.likeCount,
            isLiked: response.isLiked,
          );
        }

        // 대댓글 확인
        if (comment.replies != null && comment.replies!.isNotEmpty) {
          final updatedReplies = comment.replies!.map((reply) {
            return reply.id == commentId
                ? reply.copyWith(
                    likeCount: response.likeCount,
                    isLiked: response.isLiked,
                  )
                : reply;
          }).toList();
          return comment.copyWith(replies: updatedReplies);
        }

        return comment;
      }).toList();

      state = AsyncData(updatedComments);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> updateToggleLike(
      int commentId, bool isLiked, int likeCount) async {
    try {
      final currentComments = state.value ?? [];
      final updatedComments = currentComments.map((comment) {
        // 메인 댓글 확인
        if (comment.id == commentId) {
          return comment.copyWith(
            likeCount: likeCount,
            isLiked: isLiked,
          );
        }

        // 대댓글 확인
        if (comment.replies != null && comment.replies!.isNotEmpty) {
          final updatedReplies = comment.replies!.map((reply) {
            return reply.id == commentId
                ? reply.copyWith(
                    likeCount: likeCount,
                    isLiked: isLiked,
                  )
                : reply;
          }).toList();
          return comment.copyWith(replies: updatedReplies);
        }

        return comment;
      }).toList();

      state = AsyncData(updatedComments);
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
