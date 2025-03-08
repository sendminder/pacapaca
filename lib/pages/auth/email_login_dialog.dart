import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailLoginDialog extends ConsumerStatefulWidget {
  const EmailLoginDialog({super.key});

  @override
  ConsumerState<EmailLoginDialog> createState() => _EmailLoginDialogState();
}

class _EmailLoginDialogState extends ConsumerState<EmailLoginDialog> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.r,
              offset: Offset(0, 5.r),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 제목
            Text(
              'login.email_login'.tr(),
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 24.h),

            // 폼
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 이메일 입력 필드
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'login.email'.tr(),
                      prefixIcon: Icon(Icons.email_outlined, size: 22.r),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 16.w,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'login.email_required'.tr();
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'login.invalid_email'.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),

                  // 비밀번호 입력 필드
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'login.password'.tr(),
                      prefixIcon: Icon(Icons.lock_outline, size: 22.r),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 22.r,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 16.w,
                      ),
                    ),
                    obscureText: !_isPasswordVisible,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'login.password_required'.tr();
                      }
                      if (value.length < 6) {
                        return 'login.password_too_short'.tr();
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // 취소 버튼
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                  ),
                  child: Text(
                    'common.cancel'.tr(),
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),

                // 로그인 버튼
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ref.read(authProvider.notifier).signInWithEmail(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'login.login'.tr(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
