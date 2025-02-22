import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).value;

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
          // 프로필 헤더
          _buildProfileHeader(context, user?.nickname ?? ''),

          const Divider(height: 32),

          // 포인트 정보
          _buildPointsSection(context),

          const Divider(height: 32),

          // 내 활동
          _buildActivitySection(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, String nickname) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          UserAvatar(
            imageUrl: '', // TODO: 사용자 이미지 URL 추가
            fallbackText: nickname.isEmpty ? '?' : nickname,
            radius: 40,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nickname,
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
    );
  }

  Widget _buildPointsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'profile.my_points'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
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
                '1,234',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
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
    );
  }

  Widget _buildActivitySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'profile.my_activity'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          leading: const Icon(Icons.article),
          title: Text('profile.my_posts'.tr()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: 내가 쓴 게시글 목록으로 이동
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: Text('profile.liked_posts'.tr()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: 좋아요한 게시글 목록으로 이동
          },
        ),
      ],
    );
  }
}
