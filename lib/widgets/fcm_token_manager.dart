import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/services/notification_manager_service.dart';

class FCMTokenManager extends ConsumerStatefulWidget {
  final Widget child;

  const FCMTokenManager({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<FCMTokenManager> createState() => _FCMTokenManagerState();
}

class _FCMTokenManagerState extends ConsumerState<FCMTokenManager> {
  final _notificationManager = GetIt.instance<NotificationManagerService>();
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // 초기화는 didChangeDependencies에서 수행
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _isInitialized = true;
      // 약간의 지연 후 초기화 (빌드 완료 후)
      Future.microtask(() => _setupMessageHandler());
    }
  }

  void _setupMessageHandler() {
    // 포그라운드 메시지 핸들러 설정
    _notificationManager.setupForegroundMessageHandler((message) {
      // 여기서 메시지 처리 (예: 로컬 알림 표시)
    });
  }

  @override
  Widget build(BuildContext context) {
    // 알림 설정 상태 변경 감지
    ref.listen<bool>(notificationEnabledProvider, (previous, current) {
      if (previous != current) {
        if (current) {
          // 알림이 활성화되면 토큰 리스너 설정
          _notificationManager.setupTokenRefreshListener();
        }
      }
    });

    return widget.child;
  }
}
