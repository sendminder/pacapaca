import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';

class EmailLoginDialog extends ConsumerStatefulWidget {
  const EmailLoginDialog({super.key});

  @override
  ConsumerState<EmailLoginDialog> createState() => _EmailLoginDialogState();
}

class _EmailLoginDialogState extends ConsumerState<EmailLoginDialog> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('login.email_login'.tr()),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'login.email'.tr(),
              ),
              keyboardType: TextInputType.emailAddress,
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
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'login.password'.tr(),
              ),
              obscureText: true,
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
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('common.cancel'.tr()),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ref.read(authProvider.notifier).signInWithEmail(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
            }
          },
          child: Text('login.login'.tr()),
        ),
      ],
    );
  }
}
