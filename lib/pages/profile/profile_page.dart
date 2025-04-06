import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/providers/carrot_provider.dart';
import 'package:pacapaca/providers/point_provider.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/widgets/shared/user_profile_card.dart';
import 'package:pacapaca/constants/theme.dart';
import 'package:pacapaca/widgets/shared/user_activity_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(authProvider.notifier).getMe(null));
  }

  @override
  Widget build(BuildContext context) {
    final asyncUser = ref.watch(authProvider);
    final carrotBalance = ref.watch(carrotBalanceProvider);
    final pointBalance = ref.watch(pointBalanceProvider);
    final divider = Divider(
      height: 1,
      color: Theme.of(context).colorScheme.onSurface.withAlpha(15),
    );

    return Scaffold(
      appBar: PageTitle(
        title: 'profile.title'.tr(),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
        hasBackButton: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: asyncUser.when(
        loading: () => const Center(
          child: RotatingPacaLoader(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            'profile.error_loading'.tr(),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
        data: (user) => ListView(
          children: [
            _buildProfileHeader(context, user),
            const SizedBox(height: 16),
            divider,
            const SizedBox(height: 16),
            _buildPointsSection(context, pointBalance),
            const SizedBox(height: 16),
            divider,
            const SizedBox(height: 16),
            _buildCarrotSection(context, carrotBalance),
            const SizedBox(height: 16),
            divider,
            const SizedBox(height: 16),
            _buildActivitySection(context, user),
            const SizedBox(height: 16),
            divider,
            const SizedBox(height: 16),
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

    return UserProfileCard(
      user: user,
      showStats: false,
      isCurrentUser: true,
      onRefresh: () {
        ref.read(authProvider.notifier).getMe(null);
        ref.invalidate(carrotBalanceProvider);
        ref.invalidate(pointBalanceProvider);
      },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'profile.my_points'.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                      ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.history,
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(150),
                    size: 20,
                  ),
                  onPressed: () => context.push('/point-history'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.workspace_premium,
                  color: Theme.of(context).colorScheme.primary,
                  size: 32.h,
                ),
                const SizedBox(width: 8),
                Text(
                  NumberFormat.compact().format(pointBalance ?? 0),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                      ),
                ),
                Text(
                  'profile.points'.tr(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'profile.my_carrots'.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                      ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.history,
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(150),
                    size: 20.h,
                  ),
                  onPressed: () => context.push('/carrot-history'),
                ),
                const Spacer(),
                // TODO: 상점 오픈
                // IconButton(
                //   icon: Icon(
                //     Icons.shopping_bag,
                //     color: AppTheme.carrotColor,
                //     size: 24,
                //   ),
                //   onPressed: () => context.push('/store'),
                //   tooltip: 'profile.go_to_store'.tr(),
                // ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Image.asset(
                  'assets/icon/carrot.png',
                  width: 32.w,
                  height: 32.h,
                ),
                const SizedBox(width: 8),
                Text(
                  NumberFormat.compact().format(carrotBalance ?? 0),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppTheme.carrotColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                      ),
                ),
                Text(
                  'profile.carrots'.tr(),
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
    return UserActivitySection(
      userId: user.id,
      isCurrentUser: true,
    );
  }
}
