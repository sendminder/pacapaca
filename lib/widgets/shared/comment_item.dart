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
  final bool isCurrentUser;
  final bool isWriter;
  final bool isReply;
  final Function(int) onDelete;
  final Function(int, String) onUpdate;
  final Function(int)? onReply;
  final Function(int) onToggleLike;

  const CommentItem({
    super.key,
    required this.comment,
    required this.isCurrentUser,
    required this.isWriter,
    this.isReply = false,
    required this.onDelete,
    required this.onUpdate,
    required this.onToggleLike,
    this.onReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    final backgroundColor = _getBackgroundColor(context, isDark);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAvatar(),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCommentHeader(context, ref),
                _buildCommentContent(context),
                const SizedBox(height: 20),
                _buildActionButtons(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Color _getBackgroundColor(BuildContext context, bool isDark) {
    if (isReply) {
      return isDark
          ? Theme.of(context).colorScheme.onSurface.withAlpha(20)
          : Theme.of(context).colorScheme.onSurface.withAlpha(10);
    }
    return Theme.of(context).colorScheme.primary.withAlpha(25);
  }

  Widget _buildAvatar() {
    return UserAvatar(
      imageUrl: comment.displayUser.profileImageUrl ?? '',
      profileType: comment.displayUser.profileType,
      radius: isReply ? 16 : 18,
      userId: comment.userId,
    );
  }

  Widget _buildCommentHeader(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        _buildUserName(context),
        const SizedBox(width: 8),
        _buildTimeago(context),
        const Spacer(),
        _buildPopupMenu(context, ref),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 4),
        _buildLikeButton(context),
        const SizedBox(width: 20),
        if (!isReply && onReply != null) _buildReplyButton(context),
      ],
    );
  }

  // 공식 계정에는 뱃지 붙이기
  Widget _buildUserName(BuildContext context) {
    TextStyle? style;
    if (comment.displayUser.isOfficial) {
      // 공식 계정에는 뱃지 붙이기
      style = Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary,
          );
      return Row(
        children: [
          Text(comment.displayUser.nickname, style: style),
          const SizedBox(width: 4),
          Icon(
            Icons.verified_user_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 13,
          ),
        ],
      );
    } else if (isWriter) {
      style = Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
          );
      return Row(
        children: [
          Text(comment.displayUser.nickname, style: style),
          const SizedBox(width: 4),
          Icon(
            Icons.create_rounded,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
            size: 13,
          ),
        ],
      );
    } else if (isCurrentUser) {
      style = Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
          );
    } else {
      style = Theme.of(context).textTheme.bodyMedium;
    }
    return Text(comment.displayUser.nickname, style: style);
  }

  Widget _buildTimeago(BuildContext context) {
    final locale = context.locale;
    return Text(
      timeago.format(DateTime.parse(comment.createTime),
          locale: locale.countryCode),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
          ),
    );
  }

  Widget _buildReplyButton(BuildContext context) {
    return InkWell(
      onTap: () => onReply?.call(comment.id),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            size: 16,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
          ),
          const SizedBox(width: 4),
          Text(
            'comment.reply'.tr(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildLikeButton(BuildContext context) {
    return InkWell(
      onTap: () {
        onToggleLike(comment.id);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            comment.isLiked ? Icons.thumb_up_alt : Icons.thumb_up_outlined,
            size: 14,
            color: comment.isLiked
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface.withAlpha(128),
          ),
          if (comment.likeCount > 0) ...[
            const SizedBox(width: 4),
            Text(
              comment.likeCount.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(128),
                  ),
            ),
          ],
          if (comment.likeCount == 0) ...[
            const SizedBox(width: 4),
            Text(
              'comment.like'.tr(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(128),
                  ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCommentContent(BuildContext context) {
    return Text(
      comment.content,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.onSurface,
        height: 1.4,
      ),
    );
  }

  Widget _buildPopupMenu(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      itemBuilder: (context) => isCurrentUser
          ? _buildOwnerMenuItems(context)
          : _buildUserMenuItems(context, ref),
    );
  }

  List<PopupMenuItem> _buildOwnerMenuItems(BuildContext context) {
    return [
      _buildEditMenuItem(context),
      _buildDeleteMenuItem(context),
    ];
  }

  List<PopupMenuItem> _buildUserMenuItems(BuildContext context, WidgetRef ref) {
    return [
      _buildSendCarrotMenuItem(context, ref),
      _buildBlockMenuItem(context, ref),
      _buildReportMenuItem(context, ref),
    ];
  }

  PopupMenuItem _buildEditMenuItem(BuildContext context) {
    return PopupMenuItem(
      child: Text('comment.edit'.tr()),
      onTap: () async {
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
    );
  }

  PopupMenuItem _buildDeleteMenuItem(BuildContext context) {
    return PopupMenuItem(
      child: Text(
        'comment.delete'.tr(),
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
      onTap: () async {
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
          onDelete(comment.id);
        }
      },
    );
  }

  PopupMenuItem _buildSendCarrotMenuItem(BuildContext context, WidgetRef ref) {
    return PopupMenuItem(
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
    );
  }

  PopupMenuItem _buildBlockMenuItem(BuildContext context, WidgetRef ref) {
    return PopupMenuItem(
      child: Text(
        'block.title'.tr(),
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
      onTap: () async {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('block.title'.tr()),
            content: Text('block.confirm'.tr()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('block.cancel'.tr()),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  'block.submit'.tr(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
        );

        if (confirmed == true) {
          await ref.read(blocksProvider.notifier).blockUser(
                userId: comment.userId,
                reason: 'block.from_comment'.tr(args: [comment.id.toString()]),
                commentId: comment.id,
              );
        }
      },
    );
  }

  PopupMenuItem _buildReportMenuItem(BuildContext context, WidgetRef ref) {
    return PopupMenuItem(
      child: Text(
        'report.title'.tr(),
        style: TextStyle(color: Theme.of(context).colorScheme.error),
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
                  onSubmitted: (value) => Navigator.pop(context, value),
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
                  final textField = context.findRenderObject() as RenderBox?;
                  if (textField != null) {
                    Navigator.pop(context, textField.toString());
                  }
                },
                child: Text(
                  'report.submit'.tr(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
        );

        if (reason != null && reason.isNotEmpty) {
          await ref.read(userReportProvider.notifier).reportUser(
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
    );
  }
}
