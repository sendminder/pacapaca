import 'package:flutter/material.dart';

class RankingListItem extends StatelessWidget {
  final int rank;
  final String nickname;
  final String? profileImageUrl;
  final String score;
  final VoidCallback? onTap;
  final String defaultProfilePath = "assets/profiles/pacapoo.jpeg";

  const RankingListItem({
    super.key,
    required this.rank,
    required this.nickname,
    this.profileImageUrl,
    required this.score,
    this.onTap,
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
    return ListTile(
      onTap: onTap,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _rankEmoji,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundImage:
                profileImageUrl != null && profileImageUrl!.isNotEmpty
                    ? NetworkImage(profileImageUrl!)
                    : AssetImage(defaultProfilePath) as ImageProvider,
            child: profileImageUrl == null ? const Icon(Icons.person) : null,
          ),
        ],
      ),
      title: Text(nickname),
      trailing: Text(
        score,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
