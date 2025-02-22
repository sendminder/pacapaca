import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final user = await ref.read(authProvider.notifier).getMe();

      if (!mounted) return;

      if (user != null) {
        // 유저 존재하면 각종 체크
        // if (user.needsCheck) {
        //   // 예: 필수 공지 확인 필요
        //   context.go('/notice-check');
        // } else

        if (user.displayUser.nickname.isEmpty) {
          context.go('/set-nickname');
        } else {
          context.go('/articles');
        }
      } else {
        context.go('/login');
      }
    } catch (e) {
      if (!mounted) return;
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
