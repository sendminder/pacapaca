import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:pacapaca/services/app_info_service.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // 앱 버전 가져오기
      _appVersion = await AppInfoService.getAppVersion();

      final user = await ref.read(authProvider.notifier).getMe(_appVersion);

      if (!mounted) return;

      if (user != null) {
        if (user.displayUser.nickname.isEmpty) {
          context.go('/set-nickname');
        }

        context.go('/articles');
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
        child: RotatingPacaLoader(),
      ),
    );
  }
}
