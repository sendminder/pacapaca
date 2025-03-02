import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/services/notification_service.dart';
import 'package:pacapaca/services/storage_service.dart';

class NotificationManagerService {
  final _notificationService = GetIt.instance<NotificationService>();
  final _storageService = GetIt.instance<StorageService>();
  final _logger = GetIt.instance<Logger>();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // 싱글톤 패턴
  static final NotificationManagerService _instance =
      NotificationManagerService._internal();
  factory NotificationManagerService() => _instance;
  NotificationManagerService._internal();

  // 알림 설정 상태 가져오기
  Future<bool> isNotificationEnabled() async {
    final enabled = await _storageService.notificationEnabled;
    return enabled ?? false;
  }

  // 알림 설정 상태 저장
  Future<void> setNotificationEnabled(bool enabled) async {
    await _storageService.saveNotificationEnabled(enabled);
  }

  // 알림 권한 요청 및 토큰 등록
  Future<NotificationPermissionResult>
      requestPermissionAndRegisterToken() async {
    try {
      // FCM 권한 요청
      final settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      _logger.i('FCM 권한 상태: ${settings.authorizationStatus}');

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        // 토큰 가져오기
        final token = await _firebaseMessaging.getToken();
        if (token != null) {
          _logger.i('FCM 토큰: $token');
          await _notificationService.registerFCMToken(token);
          await setNotificationEnabled(true);
          return NotificationPermissionResult.granted;
        }
        return NotificationPermissionResult.error;
      } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
        return NotificationPermissionResult.denied;
      } else {
        return NotificationPermissionResult.error;
      }
    } catch (e, stackTrace) {
      _logger.e('알림 권한 요청 오류', error: e, stackTrace: stackTrace);
      return NotificationPermissionResult.error;
    }
  }

  // 토큰 갱신 리스너 설정
  void setupTokenRefreshListener() {
    _firebaseMessaging.onTokenRefresh.listen((newToken) async {
      _logger.i('FCM 토큰 갱신됨: $newToken');

      // 알림이 활성화된 상태인지 확인
      final isEnabled = await isNotificationEnabled();
      if (isEnabled) {
        await _notificationService.registerFCMToken(newToken);
      }
    });
  }

  // 포그라운드 메시지 핸들러 설정
  void setupForegroundMessageHandler(
      Function(RemoteMessage) onMessageReceived) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _logger.i('포그라운드 메시지 수신: ${message.notification?.title}');
      onMessageReceived(message);
    });
  }

  // 알림 비활성화
  Future<void> disableNotifications() async {
    await setNotificationEnabled(false);
  }

  // 앱 시작 시 초기화
  Future<void> initialize() async {
    final isEnabled = await isNotificationEnabled();
    if (isEnabled) {
      setupTokenRefreshListener();

      // 현재 토큰 확인 및 등록
      final token = await _firebaseMessaging.getToken();
      if (token != null) {
        _logger.i('현재 FCM 토큰: $token');
        await _notificationService.registerFCMToken(token);
      }
    }
  }
}

// 알림 권한 요청 결과
enum NotificationPermissionResult {
  granted,
  denied,
  error,
}
