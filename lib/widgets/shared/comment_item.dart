import 'package:flutter/material.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/comment/comment_edit_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/block_provider.dart';
import 'package:pacapaca/providers/report_provider.dart';
import 'package:pacapaca/widgets/shared/carrot/send_carrot_button.dart';
import 'package:pacapaca/models/dto/comment_dto.dart';

class CommentItem extends ConsumerWidget {
  final ArticleCommentDTO comment;
  final bool isOwner;
  final bool isWriter;
  final bool isReply;
  final Function(int) onDelete;
  final Function(int, String) onUpdate;
  final Function(int)? onReply;

  const CommentItem({
    super.key,
    required this.comment,
    required this.isOwner,
    required this.isWriter,
    this.isReply = false,
    required this.onDelete,
    required this.onUpdate,
    this.onReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserAvatar(
          imageUrl: comment.displayUser.profileImageUrl ?? '',
          profileType: comment.displayUser.profileType,
          radius: isReply ? 16 : 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: isReply
                  ? Theme.of(context)
                      .colorScheme
                      .surfaceVariant
                      .withOpacity(0.3)
                  : Theme.of(context).colorScheme.primary.withAlpha(25),
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
                      comment.displayUser.nickname,
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
                    if (!isReply && onReply != null) ...[
                      TextButton(
                        onPressed: () => onReply?.call(comment.id),
                        child: Text('comment.reply'.tr()),
                      ),
                    ],
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
                            child: Text('carrot.send'.tr()),
                            onTap: () async {
                              await SendCarrotButton(
                                receiverId: comment.userId,
                                receiverName: comment.displayUser.nickname,
                                commentId: comment.id,
                                description: 'carrot.for_comment'.tr(
                                  args: [comment.content],
                                ),
                              ).show(context, ref);
                            },
                          ),
                          PopupMenuItem(
                            child: Text(
                              'block.title'.tr(),
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error),
                            ),
                            onTap: () async {
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('block.title'.tr()),
                                  content: Text('block.confirm'.tr()),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: Text('block.cancel'.tr()),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: Text(
                                        'block.submit'.tr(),
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
                                    .read(blocksProvider.notifier)
                                    .blockUser(
                                      userId: comment.userId,
                                      reason: 'block.from_comment'
                                          .tr(args: [comment.id.toString()]),
                                      commentId: comment.id,
                                    );
                              }
                            },
                          ),
                          PopupMenuItem(
                            child: Text(
                              'report.title'.tr(),
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error),
                            ),
                            onTap: () async {
                              final reason = await showDialog<String>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('report.title'.tr()),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('report.reason'.tr()),
                                      const SizedBox(height: 16),
                                      TextField(
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          hintText: 'report.reason_hint'.tr(),
                                          border: const OutlineInputBorder(),
                                        ),
                                        onSubmitted: (value) =>
                                            Navigator.pop(context, value),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('report.cancel'.tr()),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        final textField = context
                                            .findRenderObject() as RenderBox?;
                                        if (textField != null) {
                                          Navigator.pop(
                                              context, textField.toString());
                                        }
                                      },
                                      child: Text(
                                        'report.submit'.tr(),
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

                              if (reason != null && reason.isNotEmpty) {
                                await ref
                                    .read(userReportProvider.notifier)
                                    .reportUser(
                                      userId: comment.userId,
                                      reason: reason,
                                      commentId: comment.id,
                                    );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('report.submitted'.tr()),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                }
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
                    fontSize: isReply ? 14 : 15,
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
