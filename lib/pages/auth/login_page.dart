import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/icon/pacasplash.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 1),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        'app_name'.tr(),
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'app_description'.tr(),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),

                const Spacer(flex: 4),

                // 로그인 버튼들
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () =>
                          ref.read(authProvider.notifier).signInWithApple(),
                      child: Text(
                        '개인정보 처리방침',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontSize: 16.sp,
                          height: 1.5,
                        ),
                      ),
                    ),
                    // Apple 로그인 버튼 (Apple 가이드라인에 맞게 구현)
                    SignInWithAppleButton(
                      onPressed: () =>
                          ref.read(authProvider.notifier).signInWithApple(),
                      style: SignInWithAppleButtonStyle.black,
                      height: 50.h,
                    ),
                  ],
                ),

                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
