import 'package:flutter/material.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/comment/comment_edit_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:easy_localization/easy_localization.dart';

class CommentItem extends StatelessWidget {
  final ArticleCommentDTO comment;
  final bool isOwner;
  final bool isWriter;
  final Future<void> Function(int commentId)? onDelete;
  final Future<void> Function(int commentId, String content)? onUpdate;

  const CommentItem({
    super.key,
    required this.comment,
    required this.isOwner,
    required this.isWriter,
    this.onDelete,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserAvatar(
          imageUrl: comment.profileImageUrl,
          fallbackText: comment.nickname,
          radius: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(25),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.only(
              left: 12,
              right: 0,
              top: 0,
              bottom: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.nickname,
                      style: isWriter
                          ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.primary,
                              )
                          : isOwner
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  )
                              : Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      timeago.format(
                        DateTime.parse(comment.createTime),
                        locale: 'ko',
                      ),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(128),
                          ),
                    ),
                    if (isOwner && (onDelete != null || onUpdate != null)) ...[
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          size: 18,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(128),
                        ),
                        onPressed: () => _showActionMenu(context),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ],
                ),
                Text(
                  comment.content,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSurface,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showActionMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onUpdate != null)
              ListTile(
                leading: const Icon(Icons.edit),
                title: Text('comment.edit'.tr()),
                onTap: () async {
                  Navigator.pop(context);
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
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: Text(
                  'comment.delete'.tr(),
                  style: const TextStyle(color: Colors.red),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('comment.delete_comment'.tr()),
                      content: Text('comment.delete_confirm'.tr()),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text('comment.cancel'.tr()),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
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
        ),
      ),
    );
  }
}
