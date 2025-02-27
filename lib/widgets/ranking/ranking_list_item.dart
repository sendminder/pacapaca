import 'package:flutter/material.dart';
import 'package:pacapaca/models/enums/profile_type.dart';

class RankingListItem extends StatelessWidget {
  final int rank;
  final String nickname;
  final String? profileImageUrl;
  final String? profileType;
  final String score;
  final VoidCallback? onTap;
  final bool isTopRank;
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
                  Theme.of(context).colorScheme.primary.withAlpha(10),
                  Theme.of(context).colorScheme.surface,
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
            Text(
              _rankEmoji,
              style: TextStyle(
                fontSize: isTopRank ? 28 : 24,
              ),
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: isTopRank ? 24 : 20,
              backgroundImage: getProfileImage(profileImageUrl, profileType),
            ),
          ],
        ),
        title: Text(
          nickname,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isTopRank ? FontWeight.w700 : FontWeight.w600,
                color: isTopRank ? Theme.of(context).colorScheme.primary : null,
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
                ),
          ),
        ),
      ),
    );
  }

  ImageProvider getProfileImage(String? profileImageUrl, String? profileType) {
    if (profileImageUrl != null && profileImageUrl.isNotEmpty) {
      return NetworkImage(profileImageUrl);
    }
    if (profileType == PacapacaProfileType.pacappi.value) {
      return AssetImage('assets/profiles/pacappi.jpeg') as ImageProvider;
    }
    if (profileType == PacapacaProfileType.pacappu.value) {
      return AssetImage('assets/profiles/pacappu.jpeg') as ImageProvider;
    }
    if (profileType == PacapacaProfileType.pacappiface.value) {
      return AssetImage('assets/profiles/pacappiface.png') as ImageProvider;
    }
    if (profileType == PacapacaProfileType.pacappuface.value) {
      return AssetImage('assets/profiles/pacappuface.png') as ImageProvider;
    }
    return AssetImage(defaultProfilePath) as ImageProvider;
  }
}
