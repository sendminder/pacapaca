import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserActivitySection extends StatelessWidget {
  final int userId;
  final bool isCurrentUser;

  const UserActivitySection({
    super.key,
    required this.userId,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            isCurrentUser ? 'profile.my_activity'.tr() : 'user.activity'.tr(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
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
            isCurrentUser ? 'profile.my_posts'.tr() : 'user.user_posts'.tr(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            context.push('/user-posts/$userId');
          },
        ),
        if (isCurrentUser)
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'profile.liked_posts'.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 18.sp,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              context.push('/liked-posts/$userId');
            },
          ),
      ],
    );
  }
}
