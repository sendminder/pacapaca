import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/services/notification_service.dart';
import 'package:pacapaca/services/storage_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';

class NotificationManagerService {
  final _notificationService = GetIt.instance<NotificationService>();
  final _storageService = GetIt.instance<StorageService>();
  final _logger = GetIt.instance<Logger>();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // 로컬 알림을 위한 플러그인 인스턴스
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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

  // 알림 설정 완료 상태 가져오기
  Future<bool> isNotificationSetupCompleted() async {
    final completed = await _storageService.notificationSetupCompleted;
    return completed ?? false;
  }

  // 알림 설정 완료 상태 저장
  Future<void> setNotificationSetupCompleted(bool completed) async {
    await _storageService.saveNotificationSetupCompleted(completed);
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

      // 인앱 푸시 알림 표시
      _showLocalNotification(message);

      // 기존 콜백 호출
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

      // 로컬 알림 초기화
      await _initializeLocalNotifications();
    }

    // 알림 설정 완료 상태 확인
    final isSetupCompleted = await isNotificationSetupCompleted();
    if (!isSetupCompleted) {
      _logger.i('알림 설정이 완료되지 않았습니다. 알림 설정 페이지로 이동합니다.');
    }
  }

  // 로컬 알림 초기화
  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // 알림 탭 시 처리 로직
        _handleNotificationTap(response);
      },
    );
  }

  // 알림 탭 처리
  void _handleNotificationTap(NotificationResponse response) {
    // 알림 페이로드에서 데이터 추출
    final payload = response.payload;
    if (payload != null) {
      try {
        final data = json.decode(payload);
        // 여기서 알림 타입에 따라 적절한 화면으로 이동하는 로직 구현
        _logger.i('알림 탭: $data');
        // 예: 네비게이션 처리
      } catch (e) {
        _logger.e('알림 페이로드 파싱 오류', error: e);
      }
    }
  }

  // 로컬 알림 표시
  Future<void> _showLocalNotification(RemoteMessage message) async {
    if (message.notification == null) return;

    final notification = message.notification!;
    final android = notification.android;
    final iOS = notification.apple;

    // 안드로이드 알림 채널 설정
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel',
      '중요 알림',
      channelDescription: '중요한 알림을 표시합니다',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    // iOS 알림 설정
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    // 플랫폼별 설정 통합
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    // 알림 데이터를 JSON으로 직렬화
    final payload = message.data.isNotEmpty ? json.encode(message.data) : null;

    // 로컬 알림 표시
    await _flutterLocalNotificationsPlugin.show(
      message.hashCode,
      notification.title,
      notification.body,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}

// 알림 권한 요청 결과
enum NotificationPermissionResult {
  granted,
  denied,
  error,
}
