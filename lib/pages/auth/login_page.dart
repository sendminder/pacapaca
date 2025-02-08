import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final authState = ref.watch(authProvider);

            return authState.when(
              data: (_) => ElevatedButton(
                onPressed: () =>
                    ref.read(authProvider.notifier).signInWithApple(),
                child: const Text('Apple로 로그인'),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, _) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('로그인 실패: $error'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        ref.read(authProvider.notifier).signInWithApple(),
                    child: const Text('다시 시도'),
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
