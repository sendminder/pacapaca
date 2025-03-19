import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:go_router/go_router.dart';

class CommunityGuidelinesPage extends ConsumerWidget {
  const CommunityGuidelinesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 가이드라인 확인 상태를 감시
    ref.listen<bool>(guidelinesConfirmedProvider, (previous, current) {
      if (current && context.mounted) {
        context.go('/articles');
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24.h),
              Text(
                'guidelines.title'.tr(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'guidelines.subtitle'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildGuidelineItem(
                          context,
                          'guidelines.rule1_title'.tr(),
                          'guidelines.rule1_content'.tr(),
                          Icons.favorite,
                          Theme.of(context).colorScheme.primary),
                      _buildGuidelineItem(
                        context,
                        'guidelines.rule2_title'.tr(),
                        'guidelines.rule2_content'.tr(),
                        Icons.chat_bubble,
                        Colors.lightBlue,
                      ),
                      _buildGuidelineItem(
                        context,
                        'guidelines.rule3_title'.tr(),
                        'guidelines.rule3_content'.tr(),
                        Icons.thumb_up,
                        Colors.green,
                      ),
                      _buildGuidelineItem(
                        context,
                        'guidelines.rule4_title'.tr(),
                        'guidelines.rule4_content'.tr(),
                        Icons.security,
                        Colors.brown,
                      ),
                      _buildGuidelineItem(
                        context,
                        'guidelines.rule5_title'.tr(),
                        'guidelines.rule5_content'.tr(),
                        Icons.flag,
                        Colors.deepOrange,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              FilledButton(
                onPressed: () async {
                  await ref
                      .read(guidelinesConfirmedProvider.notifier)
                      .setGuidelinesConfirmed();
                },
                child: Text('guidelines.confirm_button'.tr()),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuidelineItem(BuildContext context, String title, String content,
      IconData icon, Color iconColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
