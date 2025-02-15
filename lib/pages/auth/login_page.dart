import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login.login'.tr()),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);

            return authState.when(
              data: (_) => ElevatedButton(
                onPressed: () =>
                    ref.read(authProvider.notifier).signInWithApple(),
                child: Text('login.login_with_apple'.tr()),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, _) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('login.login_failed'.tr(args: [error.toString()])),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        ref.read(authProvider.notifier).signInWithApple(),
                    child: Text('login.try_again'.tr()),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
