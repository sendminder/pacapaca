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

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(authProvider.notifier).getMe());
  }

  @override
  Widget build(BuildContext context) {
    final asyncUser = ref.watch(authProvider);
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
      body: asyncUser.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            'profile.error_loading'.tr(),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
        data: (user) => ListView(
          children: [
            divider,
            _buildProfileHeader(context, user),
            divider,
            _buildPointsSection(context, pointBalance),
            divider,
            _buildCarrotSection(context, carrotBalance),
            divider,
            _buildActivitySection(context, user),
            divider,
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(
    BuildContext context,
    UserDTO? user,
  ) {
    if (user == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          UserAvatar(
            imageUrl: user.displayUser.profileImageUrl ?? '',
            profileType: user.displayUser.profileType,
            radius: 40,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.displayUser.nickname,
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
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {
              ref.read(authProvider.notifier).getMe();
              ref.invalidate(carrotBalanceProvider);
              ref.invalidate(pointBalanceProvider);
            },
            icon: Icon(
              Icons.refresh,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
            ),
          ),
        ],
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
    UserDTO? user,
  ) {
    if (user == null) {
      return const SizedBox.shrink();
    }
    return Column(
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
    );
  }
}
