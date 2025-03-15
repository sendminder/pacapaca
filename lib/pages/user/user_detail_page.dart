import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/providers/user_provider.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:pacapaca/widgets/shared/user_profile_card.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/widgets/shared/user_activity_section.dart';
import 'package:pacapaca/providers/auth_provider.dart';

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
    final currentUser = ref.read(authProvider).value;

    return Scaffold(
      appBar: PageTitle(
        title: 'user.detail_title'.tr(),
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
      backgroundColor: colorScheme.surface,
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

          return _buildUserDetailContent(context, ref, user, currentUser);
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
      BuildContext context, WidgetRef ref, UserDTO user, UserDTO? currentUser) {
    final divider = Divider(
      height: 1,
      color: Theme.of(context).colorScheme.onSurface.withAlpha(15),
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 프로필 정보 카드
          _buildProfileCard(context, user, currentUser),
          const SizedBox(height: 16),
          divider,
          const SizedBox(height: 16),
          // 사용자 활동 섹션 추가
          UserActivitySection(userId: user.id),
        ],
      ),
    );
  }

  Widget _buildProfileCard(
      BuildContext context, UserDTO user, UserDTO? currentUser) {
    return UserProfileCard(
      user: user,
      showStats: true,
      showBadge: true,
      isCurrentUser: currentUser?.id == user.id,
    );
  }
}
