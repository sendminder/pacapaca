import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/services/notification_manager_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    // 알림 설정 완료 상태를 감시
    ref.listen<bool>(notificationSetupCompletedProvider, (previous, current) {
      if (current && context.mounted) {
        context.go('/articles');
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.notifications_active,
                size: 80,
                color: Colors.amber,
              ),
              const SizedBox(height: 16),
              Text(
                'notification.setup_title'.tr(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'notification.permission_description'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _enableNotifications,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'notification.enable'.tr(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _skipNotifications,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withAlpha(30),
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'notification.skip'.tr(),
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
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
          await ref
              .read(notificationEnabledProvider.notifier)
              .setNotificationEnabled(true);
          break;
        case NotificationPermissionResult.denied:
        case NotificationPermissionResult.error:
          // 알림이 거부되거나 오류가 발생한 경우 비활성화 상태로 설정
          await ref
              .read(notificationEnabledProvider.notifier)
              .setNotificationEnabled(false);
          break;
      }

      // 설정 과정 완료 표시 (결과와 상관없이)
      await ref
          .read(notificationSetupCompletedProvider.notifier)
          .setNotificationSetupCompleted(true);
    } catch (e, stackTrace) {
      _logger.e('알림 초기화 오류', error: e, stackTrace: stackTrace);

      if (!mounted) return;

      // 오류가 발생해도 설정 완료로 처리
      await ref
          .read(notificationSetupCompletedProvider.notifier)
          .setNotificationSetupCompleted(true);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _skipNotifications() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 알림 설정 비활성화 상태로 저장
      await ref
          .read(notificationEnabledProvider.notifier)
          .setNotificationEnabled(false);

      // 설정 과정 완료 표시
      await ref
          .read(notificationSetupCompletedProvider.notifier)
          .setNotificationSetupCompleted(true);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
