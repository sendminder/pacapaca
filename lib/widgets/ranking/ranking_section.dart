import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'ranking_list_item.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pacapaca/widgets/shared/ranking_skeleton_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankingSection extends StatelessWidget {
  final String title;
  final List<RankingListItem> items;
  final VoidCallback onViewMore;
  final bool isLoading;
  final String? errorMessage;
  final IconData? icon;
  final String? imagePath;

  const RankingSection({
    super.key,
    required this.title,
    required this.items,
    required this.onViewMore,
    this.isLoading = false,
    this.errorMessage,
    this.icon,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              if (imagePath != null)
                Image.asset(
                  imagePath!,
                  width: 32.w,
                  height: 32.h,
                ),
              if (icon != null)
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                    ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: isLoading ? null : onViewMore,
                icon: Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                ),
                label: Text(
                  'ranking.view_more'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(100),
                        fontSize: 16.sp,
                      ),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        if (isLoading)
          Shimmer.fromColors(
            baseColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[800]!
                : Colors.grey[300]!,
            highlightColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[700]!
                : Colors.grey[100]!,
            period: const Duration(milliseconds: 1500),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: List.generate(
                  3,
                  (index) => const RankingSkeletonItem(),
                ),
              ),
            ),
          )
        else if (errorMessage != null)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(errorMessage!),
            ),
          )
        else
          ...items,
      ],
    );
  }
}
