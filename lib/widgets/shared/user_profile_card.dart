import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:pacapaca/constants/theme.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pacapaca/widgets/shared/carrot/send_carrot_dialog.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:pacapaca/providers/carrot_provider.dart';
import 'package:pacapaca/models/dto/carrot_dto.dart';
import 'package:pacapaca/providers/user_provider.dart';

class UserProfileCard extends ConsumerWidget {
  final UserDTO user;
  final bool showStats;
  final bool showBadge;
  final bool showJoinInfo;
  final VoidCallback? onRefresh;
  final bool isCurrentUser;

  const UserProfileCard({
    super.key,
    required this.user,
    this.showStats = true,
    this.showBadge = true,
    this.showJoinInfo = true,
    this.onRefresh,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // 사용자 ID를 해시로 변환
    final String idHash = _generateShortHash(user.displayUser.id.toString());

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
                      const SizedBox(height: 2),
                      Text(
                        "#$idHash",
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withAlpha(150),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                // TODO: 상점 오픈
                // if (!isCurrentUser) ...[
                //   _buildSendCarrotButton(context, ref),
                // ],
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
            AppTheme.carrotColor,
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
        color: colorScheme.primaryContainer.withAlpha(30),
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
            CachedNetworkImage(
              imageUrl: user.displayUser.badgeImageUrl!,
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
                    .format(DateTime.parse(user.createTime!).toLocal())
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
                    .format(DateTime.parse(user.lastLoginTime!).toLocal())
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
              size: 24,
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
                  fontSize: 17,
                ),
          ),
          const Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: valueColor ?? colorScheme.onSurface,
                  fontSize: 17,
                ),
          ),
        ],
      ),
    );
  }

  String _generateShortHash(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString().substring(0, 8);
  }

  Widget _buildSendCarrotButton(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _showSendCarrotDialog(context, ref),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          'assets/icon/carrot.png',
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  // 당근 보내기 다이얼로그 표시
  void _showSendCarrotDialog(BuildContext context, WidgetRef ref) async {
    final amount = await showDialog<int>(
      context: context,
      builder: (context) => SendCarrotDialog(
        receiverId: user.displayUser.id,
        receiverName: user.displayUser.nickname,
      ),
    );

    // 결과 처리 (당근 개수가 반환됨)
    if (amount != null && amount > 0 && context.mounted) {
      try {
        final res = await ref.read(carrotSenderProvider.notifier).sendCarrots(
              RequestSendCarrots(
                receiverId: user.displayUser.id,
                amount: amount,
              ),
            );

        if (res != null && res.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: res.errorMessage!.contains('sent_max_limit_day')
                  ? Text('carrot.sent_max_limit_day'.tr(args: [
                      user.displayUser.nickname,
                    ]))
                  : Text('carrot.error'.tr()),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          return;
        }

        if (res != null && context.mounted) {
          ref.read(carrotBalanceProvider.notifier).updateBalance(res.balance);
          ref
              .read(userDetailProvider(user.displayUser.id).notifier)
              .refreshUser();
          // 당근 보내기 성공 메시지
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'carrot.send_success'.tr(
                  args: [
                    user.displayUser.nickname,
                    amount.toString(),
                  ],
                ),
              ),
              backgroundColor: AppTheme.carrotColor,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('carrot.send_error'.tr()),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}
