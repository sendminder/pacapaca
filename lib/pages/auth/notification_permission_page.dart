import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/services/notification_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/settings_provider.dart';

class NotificationPermissionPage extends ConsumerStatefulWidget {
  const NotificationPermissionPage({super.key});

  @override
  ConsumerState<NotificationPermissionPage> createState() =>
      _NotificationPermissionPageState();
}

class _NotificationPermissionPageState
    extends ConsumerState<NotificationPermissionPage> {
  final _notificationService = GetIt.instance<NotificationService>();
  final _logger = GetIt.instance<Logger>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notification.setup_title'.tr()),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.notifications_active,
              size: 80,
              color: Colors.amber,
            ),
            const SizedBox(height: 24),
            Text(
              'notification.permission_title'.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'notification.permission_description'.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _isLoading ? null : _enableNotifications,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : Text('notification.enable'.tr()),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _isLoading ? null : _skipNotifications,
              child: Text('notification.skip'.tr()),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _enableNotifications() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // FCM 권한 요청
      final settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      _logger.i('FCM 권한 상태: ${settings.authorizationStatus}');

      // 알림 설정 상태 업데이트
      await ref
          .read(notificationEnabledProvider.notifier)
          .setNotificationEnabled(true);

      // 토큰 가져오기
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        _logger.i('FCM 토큰: $token');
        await _notificationService.registerFCMToken(token);
      }

      if (!mounted) return;

      // 메인 페이지로 이동
      context.go('/articles');
    } catch (e, stackTrace) {
      _logger.e('FCM 초기화 오류', error: e, stackTrace: stackTrace);

      if (!mounted) return;

      // 오류가 발생해도 메인 페이지로 이동
      context.go('/articles');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _skipNotifications() {
    // 알림 설정 비활성화 상태로 저장
    ref
        .read(notificationEnabledProvider.notifier)
        .setNotificationEnabled(false);

    // 알림 설정 건너뛰고 메인 페이지로 이동
    context.go('/articles');
  }
}
