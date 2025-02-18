import 'package:flutter/material.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/comment/comment_edit_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/block_provider.dart';

class CommentItem extends ConsumerWidget {
  final ArticleCommentDTO comment;
  final bool isOwner;
  final bool isWriter;
  final Function(int) onDelete;
  final Function(int, String) onUpdate;

  const CommentItem({
    super.key,
    required this.comment,
    required this.isOwner,
    required this.isWriter,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    if (isOwner) ...[
                      const Spacer(),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('comment.edit'.tr()),
                            onTap: () async {
                              Navigator.pop(context);
                              final content = await showDialog<String>(
                                context: context,
                                builder: (context) => CommentEditDialog(
                                  initialContent: comment.content,
                                ),
                              );
                              if (content != null) {
                                onUpdate(comment.id, content);
                              }
                            },
                          ),
                          PopupMenuItem(
                            child: Text(
                              'comment.delete'.tr(),
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error),
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
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: Text('comment.cancel'.tr()),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: Text(
                                        'comment.delete'.tr(),
                                        style:
                                            const TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              );

                              if (confirmed == true) {
                                onDelete(comment.id);
                              }
                            },
                          ),
                        ],
                      ),
                    ] else ...[
                      const Spacer(),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text(
                              'comment.block_user'.tr(),
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error),
                            ),
                            onTap: () async {
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('comment.block_user'.tr()),
                                  content: Text('comment.block_confirm'.tr()),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: Text('comment.cancel'.tr()),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: Text(
                                        'comment.block'.tr(),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );

                              if (confirmed == true) {
                                await ref
                                    .read(blockStateProvider.notifier)
                                    .blockUser(
                                      userId: comment.userId,
                                      reason: 'comment.block_from_comment'
                                          .tr(args: [comment.id.toString()]),
                                      commentId: comment.id,
                                    );
                              }
                            },
                          ),
                        ],
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
}
