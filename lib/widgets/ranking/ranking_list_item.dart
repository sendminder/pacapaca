import 'package:flutter/material.dart';
import 'package:pacapaca/widgets/shared/user_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankingListItem extends StatelessWidget {
  final int rank;
  final String nickname;
  final String? profileImageUrl;
  final String? profileType;
  final String score;
  final VoidCallback? onTap;
  final bool isTopRank;
  final int? userId;
  final String defaultProfilePath = "assets/profiles/pacappu.jpeg";

  const RankingListItem({
    super.key,
    required this.rank,
    required this.nickname,
    this.profileImageUrl,
    this.profileType,
    required this.score,
    this.onTap,
    this.isTopRank = false,
    this.userId,
  });

  String get _rankEmoji {
    switch (rank) {
      case 1:
        return '🥇';
      case 2:
        return '🥈';
      case 3:
        return '🥉';
      default:
        return '$rank';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: isTopRank
          ? BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context)
                      .colorScheme
                      .primary
                      .withAlpha((5 - rank) * 10),
                  Theme.of(context)
                      .colorScheme
                      .primary
                      .withAlpha((5 - rank) * 15),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withAlpha(20),
                width: 1,
              ),
            )
          : null,
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isTopRank ? const SizedBox.shrink() : const SizedBox(width: 8),
            Text(
              _rankEmoji,
              style: TextStyle(
                fontSize: isTopRank ? 28.sp : 20.sp,
                fontWeight: isTopRank ? FontWeight.w700 : FontWeight.w300,
              ),
            ),
            isTopRank ? const SizedBox(width: 8) : const SizedBox(width: 21),
            UserAvatar(
              imageUrl: profileImageUrl ?? '',
              profileType: profileType,
              radius: isTopRank ? 24 : 20,
              userId: userId,
            ),
          ],
        ),
        title: Text(
          nickname,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isTopRank ? FontWeight.w700 : FontWeight.w500,
                color: isTopRank ? Theme.of(context).colorScheme.primary : null,
                fontSize: 18.sp,
              ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isTopRank
                ? Theme.of(context).colorScheme.onSurface.withAlpha(5)
                : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            score,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: isTopRank ? FontWeight.w700 : FontWeight.w600,
                  color:
                      isTopRank ? Theme.of(context).colorScheme.primary : null,
                  fontSize: 18.sp,
                ),
          ),
        ),
      ),
    );
  }
}
