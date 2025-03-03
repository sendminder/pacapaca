import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';

class UserProfileCard extends StatelessWidget {
  final UserDTO user;
  final bool showStats;
  final bool showBadge;
  final bool showJoinInfo;
  final VoidCallback? onRefresh;

  const UserProfileCard({
    super.key,
    required this.user,
    this.showStats = true,
    this.showBadge = true,
    this.showJoinInfo = true,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // 프로필 이미지
                UserAvatar(
                  imageUrl: user.displayUser.profileImageUrl ?? '',
                  radius: 40,
                  profileType: user.displayUser.profileType,
                ),
                const SizedBox(width: 16),
                // 사용자 기본 정보
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              user.displayUser.nickname,
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (user.displayUser.isOfficial)
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.verified,
                                color: colorScheme.primary,
                                size: 20,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (onRefresh != null) ...[
                  IconButton(
                    onPressed: onRefresh,
                    icon: Icon(
                      Icons.refresh,
                      color: colorScheme.onSurface.withAlpha(100),
                    ),
                  ),
                ],
              ],
            ),
            // 뱃지 정보
            if (showBadge &&
                user.displayUser.badgeType != null &&
                user.displayUser.badgeType!.isNotEmpty)
              _buildBadgeInfo(context, user),

            // 활동점수와 보유당근 정보 (가입일 위로 이동)
            if (showStats) ...[
              const SizedBox(height: 16),
              _buildUserStats(context, user),
            ],

            // 가입 정보
            if (showJoinInfo) ...[
              const SizedBox(height: 16),
              _buildJoinInfo(context, user),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildUserStats(BuildContext context, UserDTO user) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface.withAlpha(15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 활동점수 행
          _buildInfoRow(
            context,
            'user.points'.tr(),
            user.displayUser.points.toString(),
            Icons.workspace_premium,
            null,
            Colors.deepPurpleAccent,
            null,
            Colors.deepPurpleAccent,
          ),
          const SizedBox(height: 12),
          // 보유당근 행
          _buildInfoRow(
            context,
            'user.carrots'.tr(),
            user.displayUser.carrots.toString(),
            null,
            Image.asset(
              'assets/icon/carrot.png',
              width: 20,
              height: 20,
            ),
            null,
            null,
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeInfo(BuildContext context, UserDTO user) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.primaryContainer,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (user.displayUser.badgeImageUrl != null &&
              user.displayUser.badgeImageUrl!.isNotEmpty)
            Image.network(
              user.displayUser.badgeImageUrl!,
              width: 24,
              height: 24,
            )
          else
            Icon(
              Icons.military_tech,
              size: 24,
              color: colorScheme.primary,
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'user.badge'.tr(args: [user.displayUser.badgeType!]),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJoinInfo(BuildContext context, UserDTO user) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface.withAlpha(15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(
            context,
            'user.create_time'.tr(),
            user.createTime != null
                ? DateFormat('yyyy-MM-dd')
                    .format(DateTime.parse(user.createTime!))
                : 'user.unknown'.tr(),
            Icons.calendar_today,
            null,
            Theme.of(context).colorScheme.onSurface.withAlpha(150),
            null,
            Theme.of(context).colorScheme.onSurface.withAlpha(150),
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            context,
            'user.last_login'.tr(),
            user.lastLoginTime != null
                ? DateFormat('yyyy-MM-dd')
                    .format(DateTime.parse(user.lastLoginTime!))
                : 'user.unknown'.tr(),
            Icons.access_time,
            null,
            Theme.of(context).colorScheme.onSurface.withAlpha(150),
            null,
            Theme.of(context).colorScheme.onSurface.withAlpha(150),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value,
      [IconData? icon,
      Widget? leadingWidget,
      Color? iconColor,
      Color? labelColor,
      Color? valueColor]) {
    final colorScheme = Theme.of(context).colorScheme;
    final defaultIconColor = colorScheme.onSurface.withAlpha(200);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 20,
              color: iconColor ?? defaultIconColor,
            ),
            const SizedBox(width: 8),
          ] else if (leadingWidget != null) ...[
            leadingWidget,
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: labelColor ?? colorScheme.onSurface.withAlpha(200),
                ),
          ),
          const Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: valueColor ?? colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}
