import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/services/notification_manager_service.dart';

class NotificationPermissionPage extends ConsumerStatefulWidget {
  const NotificationPermissionPage({super.key});

  @override
  ConsumerState<NotificationPermissionPage> createState() =>
      _NotificationPermissionPageState();
}

class _NotificationPermissionPageState
    extends ConsumerState<NotificationPermissionPage> {
  final _notificationManager = GetIt.instance<NotificationManagerService>();
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
      final result =
          await _notificationManager.requestPermissionAndRegisterToken();

      if (!mounted) return;

      switch (result) {
        case NotificationPermissionResult.granted:
          // 알림 활성화 상태 설정
          ref
              .read(notificationEnabledProvider.notifier)
              .setNotificationEnabled(true);
          break;
        case NotificationPermissionResult.denied:
        case NotificationPermissionResult.error:
          // 알림이 거부되거나 오류가 발생한 경우 비활성화 상태로 설정
          ref
              .read(notificationEnabledProvider.notifier)
              .setNotificationEnabled(false);
          break;
      }

      // 설정 과정 완료 표시 (결과와 상관없이)
      ref
          .read(notificationSetupCompletedProvider.notifier)
          .setNotificationSetupCompleted(true);

      // 메인 페이지로 이동
      context.go('/articles');
    } catch (e, stackTrace) {
      _logger.e('알림 초기화 오류', error: e, stackTrace: stackTrace);

      if (!mounted) return;

      // 오류가 발생해도 설정 완료로 처리
      ref
          .read(notificationSetupCompletedProvider.notifier)
          .setNotificationSetupCompleted(true);
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

    // 설정 과정 완료 표시
    ref
        .read(notificationSetupCompletedProvider.notifier)
        .setNotificationSetupCompleted(true);

    // 알림 설정 건너뛰고 메인 페이지로 이동
    context.go('/articles');
  }
}
