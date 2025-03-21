import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/dto/block_dto.dart';
import 'package:pacapaca/providers/block_provider.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/widgets/shared/dialogs/confirmation_dialog.dart';
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
              final reportedUser = block.reportedUser;

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
                        builder: (context) => ConfirmationDialog(
                          title: 'block.unblock'.tr(),
                          content: 'block.unblock_confirm'.tr(),
                          cancelText: 'block.cancel'.tr(),
                          confirmText: 'block.unblock'.tr(),
                          isDanger: true,
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
                  leading: UserAvatar(
                    imageUrl: reportedUser!.profileImageUrl ?? '',
                    radius: 20,
                    userId: reportedUser.id,
                    profileType: reportedUser.profileType,
                  ),
                  title: Text(reportedUser.nickname),
                  subtitle: Text(block.reason),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    color: Theme.of(context).colorScheme.error,
                    onPressed: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => ConfirmationDialog(
                          title: 'block.unblock'.tr(),
                          content: 'block.unblock_confirm'.tr(),
                          cancelText: 'block.cancel'.tr(),
                          confirmText: 'block.unblock'.tr(),
                          isDanger: true,
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
