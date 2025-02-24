import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/models/dto/comment_dto.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:pacapaca/widgets/shared/comment_item.dart';
import 'package:easy_localization/easy_localization.dart';

class CommentListWidget extends ConsumerWidget {
  final List<ArticleCommentDTO> comments;
  final UserDTO? currentUser;
  final int articleUserId;
  final Function(int) onDelete;
  final Function(int, String) onUpdate;
  final Function(int) onLoadMoreReplies;
  final Function(int) onReply;

  const CommentListWidget({
    super.key,
    required this.comments,
    required this.currentUser,
    required this.articleUserId,
    required this.onDelete,
    required this.onUpdate,
    required this.onLoadMoreReplies,
    required this.onReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: comments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommentItem(
              comment: comment,
              isOwner: comment.userId == currentUser?.id,
              isWriter: articleUserId == comment.userId,
              onDelete: onDelete,
              onUpdate: onUpdate,
              onReply: onReply,
            ),
            if (comment.replies != null && comment.replies!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...comment.replies!.take(3).map((reply) => Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: CommentItem(
                            comment: reply,
                            isOwner: reply.userId == currentUser?.id,
                            isWriter: articleUserId == reply.userId,
                            isReply: true,
                            onDelete: onDelete,
                            onUpdate: onUpdate,
                          ),
                        )),
                    if (comment.hasMore == true)
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: TextButton(
                          onPressed: () => onLoadMoreReplies(comment.id),
                          child: Text(
                            'comment.show_more_replies'.tr(
                              args: [(comment.replyCount! - 3).toString()],
                            ),
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(128),
                                    ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
