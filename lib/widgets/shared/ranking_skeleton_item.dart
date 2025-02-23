import 'package:flutter/material.dart';

class RankingSkeletonItem extends StatelessWidget {
  const RankingSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          // 순위
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[700] : Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 16),
          // 프로필 이미지
          CircleAvatar(
            radius: 20,
            backgroundColor: isDark ? Colors.grey[700] : Colors.grey[200],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 닉네임
                Container(
                  width: 120,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[700] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          // 점수
          Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[700] : Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
