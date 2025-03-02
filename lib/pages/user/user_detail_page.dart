import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/user_provider.dart';
import 'package:pacapaca/providers/block_provider.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/models/dto/user_dto.dart';

class UserDetailPage extends ConsumerWidget {
  final int userId;

  const UserDetailPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetail = ref.watch(userDetailProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: Text('user.detail_title'.tr()),
        backgroundColor: Theme.of(context).colorScheme.surface,
        scrolledUnderElevation: 0,
        surfaceTintColor: null,
        actions: [
          // 새로고침 버튼
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(userDetailProvider(userId).notifier).refreshUser();
            },
          ),
        ],
      ),
      body: userDetail.when(
        data: (user) {
          if (user == null) {
            return Center(
              child: Text(
                'user.not_found'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 프로필 정보 섹션
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // 프로필 이미지
                            if (user.displayUser.profileImageUrl != null &&
                                user.displayUser.profileImageUrl!.isNotEmpty)
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    user.displayUser.profileImageUrl!),
                              )
                            else
                              const CircleAvatar(
                                radius: 40,
                                child: Icon(Icons.person, size: 40),
                              ),
                            const SizedBox(width: 16),
                            // 사용자 기본 정보
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        user.displayUser.nickname,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      if (user.displayUser.isOfficial)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Icon(
                                            Icons.verified,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            size: 20,
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  if (user.displayUser.isBlocked)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).colorScheme.error,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        'user.blocked'.tr(),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onError,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  const SizedBox(height: 8),
                                  // 포인트 및 당근 정보
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'user.points'.tr(args: [
                                          user.displayUser.points.toString()
                                        ]),
                                      ),
                                      const SizedBox(width: 16),
                                      Icon(
                                        Icons.eco,
                                        color: Colors.orange,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'user.carrots'.tr(args: [
                                          user.displayUser.carrots.toString()
                                        ]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // 뱃지 정보
                        if (user.displayUser.badgeType != null &&
                            user.displayUser.badgeType!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                if (user.displayUser.badgeImageUrl != null &&
                                    user.displayUser.badgeImageUrl!.isNotEmpty)
                                  Image.network(
                                    user.displayUser.badgeImageUrl!,
                                    width: 24,
                                    height: 24,
                                  )
                                else
                                  const Icon(Icons.military_tech, size: 24),
                                const SizedBox(width: 8),
                                Text(
                                  'user.badge'
                                      .tr(args: [user.displayUser.badgeType!]),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // 차단 버튼
                if (!user.displayUser.isBlocked)
                  ElevatedButton.icon(
                    onPressed: () {
                      _showBlockDialog(context, ref, user);
                    },
                    icon: const Icon(Icons.block),
                    label: Text('user.block'.tr()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      foregroundColor: Theme.of(context).colorScheme.onError,
                    ),
                  ),

                // 가입 정보 섹션
                const SizedBox(height: 24),
                Text(
                  'user.join_info'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildInfoRow(
                          context,
                          'user.create_time'.tr(),
                          user.createTime != null
                              ? DateFormat('yyyy-MM-dd HH:mm')
                                  .format(DateTime.parse(user.createTime!))
                              : 'user.unknown'.tr(),
                        ),
                        const Divider(),
                        _buildInfoRow(
                          context,
                          'user.last_login'.tr(),
                          user.lastLoginTime != null
                              ? DateFormat('yyyy-MM-dd HH:mm')
                                  .format(DateTime.parse(user.lastLoginTime!))
                              : 'user.unknown'.tr(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: RotatingPacaLoader()),
        error: (error, stack) => Center(
          child: Text(
            'user.error_loading'.tr(args: [error.toString()]),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  void _showBlockDialog(BuildContext context, WidgetRef ref, UserDTO user) {
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('user.block_user'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('user.block_confirm'.tr(args: [user.displayUser.nickname])),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: 'user.block_reason'.tr(),
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('user.cancel'.tr()),
          ),
          TextButton(
            onPressed: () {
              if (reasonController.text.trim().isNotEmpty) {
                ref.read(blocksProvider.notifier).blockUser(
                      userId: user.id,
                      reason: reasonController.text.trim(),
                    );
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('user.blocked_success'.tr()),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                // 사용자 정보 새로고침
                ref.read(userDetailProvider(userId).notifier).refreshUser();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('user.reason_required'.tr()),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: Text(
              'user.block'.tr(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
