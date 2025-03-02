import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/user_provider.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:pacapaca/widgets/shared/user_profile_card.dart';
import 'package:pacapaca/widgets/shared/join_info_card.dart';

class UserDetailPage extends ConsumerWidget {
  final int userId;

  const UserDetailPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetail = ref.watch(userDetailProvider(userId));
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('user.detail_title'.tr()),
        backgroundColor: colorScheme.surface,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: colorScheme.onSurface.withAlpha(128),
            ),
            onPressed: () {
              ref.read(userDetailProvider(userId).notifier).refreshUser();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: userDetail.when(
        data: (user) {
          if (user == null) {
            return Center(
              child: Text(
                'user.not_found'.tr(),
                style: textTheme.bodyLarge,
              ),
            );
          }

          return _buildUserDetailContent(context, ref, user);
        },
        loading: () => const Center(child: RotatingPacaLoader()),
        error: (error, stack) => Center(
          child: Text(
            'user.error_loading'.tr(args: [error.toString()]),
            style: TextStyle(color: colorScheme.error),
          ),
        ),
      ),
    );
  }

  Widget _buildUserDetailContent(
      BuildContext context, WidgetRef ref, UserDTO user) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 프로필 정보 카드
          _buildProfileCard(context, user),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, UserDTO user) {
    return UserProfileCard(
      user: user,
      showStats: true,
      showBadge: true,
    );
  }
}
