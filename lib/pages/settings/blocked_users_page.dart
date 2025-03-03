import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/block_provider.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/widgets/page_title.dart';

class BlockedUsersPage extends ConsumerWidget {
  const BlockedUsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockedUsers = ref.watch(blocksProvider);

    return Scaffold(
      appBar: PageTitle(
        title: 'block.list_title'.tr(),
        actions: [
          // 새로고침 버튼
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(blocksProvider.notifier).refreshBlocks();
            },
          ),
        ],
      ),
      body: blockedUsers.when(
        data: (users) {
          if (users.isEmpty) {
            return Center(
              child: Text(
                'block.no_blocks'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final block = users[index];
              return Dismissible(
                key: Key('block-${block.id}'),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Theme.of(context).colorScheme.error,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.onError,
                  ),
                ),
                confirmDismiss: (direction) async {
                  return await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('block.unblock'.tr()),
                          content: Text('block.unblock_confirm'.tr()),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text('block.cancel'.tr()),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text(
                                'block.unblock'.tr(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ) ??
                      false;
                },
                onDismissed: (direction) {
                  ref.read(blocksProvider.notifier).unblockUser(block.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('block.unblocked'.tr()),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: ListTile(
                  title: Text(block.reason),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd HH:mm')
                            .format(DateTime.parse(block.createTime)),
                      ),
                      if (block.articleId != null)
                        Text('block.from_article'
                            .tr(args: [block.articleId.toString()])),
                      if (block.commentId != null)
                        Text('block.from_comment'
                            .tr(args: [block.commentId.toString()])),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    color: Theme.of(context).colorScheme.error,
                    onPressed: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('block.unblock'.tr()),
                          content: Text('block.unblock_confirm'.tr()),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text('block.cancel'.tr()),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text(
                                'block.unblock'.tr(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );

                      if (confirmed == true) {
                        ref.read(blocksProvider.notifier).unblockUser(block.id);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('block.unblocked'.tr()),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: RotatingPacaLoader()),
        error: (error, stack) => Center(
          child: Text(
            'block.error_loading'.tr(args: [error.toString()]),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ),
    );
  }
}
