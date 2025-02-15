import 'package:flutter/material.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/comment/comment_edit_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class CommentItem extends StatelessWidget {
  final ArticleCommentDTO comment;
  final bool isOwner;
  final Future<void> Function(int commentId)? onDelete;
  final Future<void> Function(int commentId, String content)? onUpdate;

  const CommentItem({
    super.key,
    required this.comment,
    required this.isOwner,
    this.onDelete,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatar(
          imageUrl: comment.profileImageUrl,
          fallbackText: comment.nickname,
          radius: 16,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    comment.nickname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    timeago.format(
                      DateTime.parse(comment.createTime),
                      locale: 'ko',
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  if (isOwner && (onDelete != null || onUpdate != null)) ...[
                    const Spacer(),
                    _buildActionMenu(context),
                  ],
                ],
              ),
              const SizedBox(height: 4),
              Text(comment.content),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionMenu(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        if (onUpdate != null)
          PopupMenuItem(
            child: Text('comment.edit'.tr()),
            onTap: () async {
              final content = await showDialog<String>(
                context: context,
                builder: (context) => CommentEditDialog(
                  initialContent: comment.content,
                ),
              );
              if (content != null) {
                await onUpdate!(comment.id, content);
              }
            },
          ),
        if (onDelete != null)
          PopupMenuItem(
            child: Text(
              'comment.delete'.tr(),
              style: const TextStyle(color: Colors.red),
            ),
            onTap: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('comment.delete_comment'.tr()),
                  content: Text('comment.delete_confirm'.tr()),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(false),
                      child: Text('comment.cancel'.tr()),
                    ),
                    TextButton(
                      onPressed: () => context.pop(true),
                      child: Text(
                        'comment.delete'.tr(),
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                await onDelete!(comment.id);
              }
            },
          ),
      ],
    );
  }
}
