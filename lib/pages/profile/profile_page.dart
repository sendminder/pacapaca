import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/providers/carrot_provider.dart';
import 'package:pacapaca/providers/point_provider.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:pacapaca/models/dto/carrot_dto.dart';
import 'package:pacapaca/models/dto/point_dto.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final carrotBalance = ref.watch(carrotBalanceProvider);
    final pointBalance = ref.watch(pointBalanceProvider);
    final divider = Divider(
      height: 30,
      color: Theme.of(context).colorScheme.primary.withAlpha(50),
    );

    return Scaffold(
      appBar: PageTitle(
        title: 'profile.title'.tr(),
        trailing: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => context.push('/settings'),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          divider,

          // 프로필 헤더
          _buildProfileHeader(context, user),

          divider,

          // 포인트 정보
          _buildPointsSection(context, pointBalance),

          divider,

          // 당근 정보
          _buildCarrotSection(context, carrotBalance),

          divider,

          // 내 활동
          _buildActivitySection(context, user),

          divider,
        ],
      ),
    );
  }

  Widget _buildProfileHeader(
    BuildContext context,
    AsyncValue<UserDTO?> asyncUser,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: asyncUser.when(
        data: (user) => Row(
          children: [
            UserAvatar(
              imageUrl: user?.displayUser.profileImageUrl ?? '',
              profileType: user?.displayUser.profileType,
              radius: 40,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.displayUser.nickname ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'profile.member_since'.tr(args: ['2024.03']),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        error: (error, _) => const SizedBox.shrink(),
        loading: () => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildPointsSection(
    BuildContext context,
    AsyncValue<int?> asyncPointBalance,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: asyncPointBalance.when(
        data: (pointBalance) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'profile.my_points'.tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.workspace_premium,
                  color: Theme.of(context).colorScheme.primary,
                  size: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  NumberFormat.compact().format(pointBalance ?? 0),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  ' points',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
        error: (error, _) => const SizedBox.shrink(),
        loading: () => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildCarrotSection(
    BuildContext context,
    AsyncValue<int?> asyncCarrotBalance,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: asyncCarrotBalance.when(
        data: (carrotBalance) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'profile.my_carrots'.tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Image.asset(
                  'assets/icon/carrot.png',
                  width: 32,
                  height: 32,
                ),
                const SizedBox(width: 8),
                Text(
                  NumberFormat.compact().format(carrotBalance ?? 0),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  ' carrots',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
        error: (error, _) => const SizedBox.shrink(),
        loading: () => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildActivitySection(
    BuildContext context,
    AsyncValue<UserDTO?> asyncUser,
  ) {
    return asyncUser.when(
      data: (user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'profile.my_activity'.tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(
              Icons.article,
              color: Colors.grey,
            ),
            title: Text(
              'profile.my_posts'.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: 내가 쓴 게시글 목록으로 이동
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'profile.liked_posts'.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: 좋아요한 게시글 목록으로 이동
            },
          ),
        ],
      ),
      error: (error, _) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
