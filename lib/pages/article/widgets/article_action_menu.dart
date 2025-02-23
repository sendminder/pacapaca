import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/dto/article_dto.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/providers/block_provider.dart';
import 'package:pacapaca/providers/report_provider.dart';
import 'package:pacapaca/widgets/shared/carrot/send_carrot_button.dart';

class ArticleActionMenu extends ConsumerWidget {
  final ArticleDTO article;
  final UserDTO? currentUser;

  const ArticleActionMenu({
    super.key,
    required this.article,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (article.userId != currentUser?.id)
          IconButton(
            icon: Image.asset(
              'assets/icon/carrot.png',
              width: 24,
              height: 24,
            ),
            onPressed: () => _sendCarrot(context, ref),
          ),
        PopupMenuButton(
          itemBuilder: (context) => article.userId == currentUser?.id
              ? _buildOwnerMenu(context, ref)
              : _buildVisitorMenu(context, ref),
        ),
      ],
    );
  }

  List<PopupMenuEntry> _buildOwnerMenu(BuildContext context, WidgetRef ref) {
    return [
      PopupMenuItem(
        child: Text('article.edit'.tr()),
        onTap: () => context.push('/articles/${article.id}/edit'),
      ),
      PopupMenuItem(
        child: Text(
          'article.delete'.tr(),
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
        onTap: () => _showDeleteConfirmDialog(context, ref),
      ),
    ];
  }

  List<PopupMenuEntry> _buildVisitorMenu(BuildContext context, WidgetRef ref) {
    return [
      PopupMenuItem(
        child: Text(
          'block.title'.tr(),
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
        onTap: () => _showBlockConfirmDialog(context, ref),
      ),
      PopupMenuItem(
        child: Text(
          'report.title'.tr(),
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
        onTap: () => _showReportDialog(context, ref),
      ),
    ];
  }

  Future<void> _showDeleteConfirmDialog(
      BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('article.delete_confirm'.tr()),
        content: Text('article.delete_confirm_desc'.tr()),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: Text('article.cancel'.tr()),
          ),
          TextButton(
            onPressed: () => context.pop(true),
            child: Text(
              'article.delete'.tr(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(articleEditorProvider.notifier).deleteArticle(article.id);
      if (context.mounted) context.pop();
    }
  }

  Future<void> _sendCarrot(BuildContext context, WidgetRef ref) async {
    await SendCarrotButton(
      receiverId: article.userId,
      receiverName: article.displayUser.nickname,
      articleId: article.id,
      description: 'carrot.for_article'.tr(args: [article.title]),
    ).show(context, ref);
  }

  Future<void> _showBlockConfirmDialog(
      BuildContext context, WidgetRef ref) async {
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
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(blocksProvider.notifier).blockUser(
            userId: article.userId,
            reason: 'block.from_article'.tr(args: [article.id.toString()]),
            articleId: article.id,
          );
      if (context.mounted) context.pop();
    }
  }

  Future<void> _showReportDialog(BuildContext context, WidgetRef ref) async {
    final reason = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('report.title'.tr()),
        content: _ReportDialogContent(),
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
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );

    if (reason != null && reason.isNotEmpty) {
      await ref.read(userReportProvider.notifier).reportUser(
            userId: article.userId,
            reason: reason,
            articleId: article.id,
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
  }
}

class _ReportDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
