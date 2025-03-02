import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:pacapaca/services/notification_service.dart';

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
  final _notificationService = GetIt.instance<NotificationService>();
  final _logger = GetIt.instance<Logger>();
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
      Future.microtask(() => _checkAndSetupFCM());
    }
  }

  @override
  void didUpdateWidget(covariant FCMTokenManager oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 위젯이 업데이트될 때마다 알림 설정 상태 확인
    _checkAndSetupFCM();
  }

  Future<void> _checkAndSetupFCM() async {
    final notificationEnabled = ref.read(notificationEnabledProvider);

    if (notificationEnabled) {
      _setupTokenRefreshListener();
    } else {
      // 알림이 비활성화된 경우 토큰 리스너 제거 (필요시)
      _logger.i('알림이 비활성화되어 FCM 토큰 관리를 중지합니다.');
    }
  }

  Future<void> _setupTokenRefreshListener() async {
    try {
      _logger.i('FCM 토큰 리스너 설정 중...');

      // 현재 토큰 확인 및 등록
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        _logger.i('현재 FCM 토큰: $token');
        await _notificationService.registerFCMToken(token);
      }

      // 토큰 갱신 리스너
      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
        _logger.i('FCM 토큰 갱신됨: $newToken');

        // 알림이 여전히 활성화되어 있는지 확인
        final stillEnabled = ref.read(notificationEnabledProvider);
        if (stillEnabled) {
          await _notificationService.registerFCMToken(newToken);
        }
      });

      // 포그라운드 메시지 핸들러
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _logger.i('포그라운드 메시지 수신: ${message.notification?.title}');
        // 여기서 로컬 알림 표시 또는 상태 업데이트 가능
      });
    } catch (e, stackTrace) {
      _logger.e('FCM 토큰 리스너 설정 오류', error: e, stackTrace: stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 알림 설정 상태 변경 감지
    final notificationEnabled = ref.watch(notificationEnabledProvider);

    // 상태가 변경되면 FCM 설정 확인
    if (notificationEnabled != ref.read(notificationEnabledProvider)) {
      _checkAndSetupFCM();
    }

    return widget.child;
  }
}
