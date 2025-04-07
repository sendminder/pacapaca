import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pacapaca/constants/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:pacapaca/pages/auth/email_login_dialog.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium?.copyWith(
      color: Colors.black.withAlpha(200),
      fontSize: 11.sp,
    );
    final platform = Theme.of(context).platform;

    // 컨트롤러 추가
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'app_description'.tr(),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.black,
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
                    SizedBox(height: 16.h),
                    // Apple 로그인 버튼 (Apple 가이드라인에 맞게 구현)
                    if (platform == TargetPlatform.iOS) ...[
                      SignInWithAppleButton(
                        onPressed: () =>
                            ref.read(authProvider.notifier).signInWithApple(),
                        style: SignInWithAppleButtonStyle.black,
                        height: 50.h,
                      ),
                      SizedBox(height: 16.h),
                    ],

                    // 구글 로그인 버튼
                    ElevatedButton(
                      onPressed: () =>
                          ref.read(authProvider.notifier).signInWithGoogle(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        elevation: 1,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.black12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/google.webp',
                            height: 24.h,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'login.google_login'.tr(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // 이메일 로그인 버튼
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const EmailLoginDialog(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        elevation: 1,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email_outlined, size: 24.h),
                          SizedBox(width: 12.w),
                          Text(
                            'login.email_login'.tr(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: textStyle,
                        children: [
                          TextSpan(text: 'login.check_agreement_prefix'.tr()),
                          TextSpan(
                            text: 'settings.personal_info'.tr(),
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => launchUrl(
                                    Uri.parse(PacapacaLink.personalInfoLink),
                                  ),
                          ),
                          TextSpan(
                            text: 'login.check_agreement_link_suffix'.tr(),
                          ),
                          TextSpan(
                            text: 'settings.terms_of_service'.tr(),
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => launchUrl(
                                    Uri.parse(PacapacaLink.termsOfServiceLink),
                                  ),
                          ),
                          TextSpan(text: 'login.check_agreement_suffix'.tr()),
                        ],
                      ),
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
