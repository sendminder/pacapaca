import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/services/notification_service.dart';
import 'package:pacapaca/services/storage_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/router.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/providers/comment_provider.dart';
import 'package:pacapaca/providers/notification_provider.dart';

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

  // Riverpod 컨테이너 참조 저장
  late ProviderContainer _container;

  // 컨테이너 설정 메서드 추가
  void setProviderContainer(ProviderContainer container) {
    _container = container;
  }

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

      // 알림 타입이 댓글 관련이면 게시글 정보 업데이트
      _updateArticleIfNeeded(message);

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

      // 앱이 종료된 상태에서 알림을 클릭하여 열린 경우 처리
      await _handleInitialMessage();

      // 백그라운드 메시지 핸들러 설정
      FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
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
        _handleNotificationTapForeground(response);
      },
    );
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

  // 초기 메시지 처리 (앱이 종료된 상태에서 알림 클릭)
  Future<void> _handleInitialMessage() async {
    final RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _logger.i('초기 메시지: ${initialMessage.notification?.title}');
      _handleNotificationTapBackground(initialMessage);
    }
  }

  // 백그라운드 메시지 처리 (앱이 백그라운드에 있을 때 알림 클릭)
  void _handleBackgroundMessage(RemoteMessage message) {
    _logger.i('백그라운드 메시지: ${message.notification?.title}');
    _handleNotificationTapBackground(message);
  }

  // 앱이 포그라운드 상태일때 알림 탭 처리
  void _handleNotificationTapForeground(NotificationResponse response) {
    // 알림 페이로드에서 데이터 추출
    final payload = response.payload;
    if (payload != null) {
      try {
        final data = json.decode(payload);
        final type = data['type'];
        final refId = int.parse(data['ref_id']);

        if (type == 'comment' || type == 'like') {
          // Riverpod 컨테이너를 통해 라우터에 접근
          final router = _container.read(routerProvider);
          final path = '/articles/${refId}?from=notification';
          _logger.i('알림 탭: $path');
          router.push(path);
        }

        if (type == 'reply') {
          // Riverpod 컨테이너를 통해 라우터에 접근
          final commentId = int.parse(data['sub_id']);
          final articleUserId = int.parse(data['third_id']);
          final router = _container.read(routerProvider);

          // 게시글 상세 페이지로 이동 (commentId를 쿼리 파라미터로 전달)
          final path =
              '/articles/${refId}/comment/$commentId/replies/$articleUserId';
          _logger.d('답글 알림 탭: $path');
          router.push(path);
        }

        _logger.i('알림 탭: $data');
      } catch (e) {
        _logger.e('알림 페이로드 파싱 오류', error: e);
      }
    }
  }

  // 메시지 기반 네비게이션 처리
  void _handleNotificationTapBackground(RemoteMessage message) {
    try {
      final data = message.data;
      _logger.d('메시지 데이터: $data');

      final type = data['type'];
      final refId = int.tryParse(data['ref_id']?.toString() ?? '') ?? 0;

      // 알림 타입이 댓글 관련이면 게시글 정보 업데이트
      _updateArticleIfNeeded(message);

      // 지연 실행으로 라우터가 초기화될 시간을 줌
      Future.delayed(const Duration(milliseconds: 500), () {
        try {
          final router = _container.read(routerProvider);

          if (type == 'reply') {
            // 답글 알림인 경우 commentId를 쿼리 파라미터로 전달
            final commentId =
                int.tryParse(data['sub_id']?.toString() ?? '') ?? 0;
            final articleUserId =
                int.tryParse(data['third_id']?.toString() ?? '') ?? 0;
            if (commentId > 0 && articleUserId > 0) {
              final path =
                  '/articles/${refId}/comment/$commentId/replies/$articleUserId';
              _logger.i('답글 알림 탭: $path');
              router.push(path);
              return;
            }
          }

          // 그 외 알림은 기본 경로로 이동
          final path = '/articles/${refId}?from=notification';
          _logger.i('알림 탭: $path');
          router.push(path);
        } catch (e) {
          _logger.e('라우팅 오류', error: e);
        }
      });
    } catch (e) {
      _logger.e('메시지 처리 오류', error: e);
    }
  }

  // 알림 타입에 따라 게시글 정보 업데이트
  void _updateArticleIfNeeded(RemoteMessage message) {
    try {
      final data = message.data;
      final type = data['type'];
      final refId = int.tryParse(data['ref_id']?.toString() ?? '') ?? 0;

      // 댓글 또는 답글 알림인 경우
      if (type == 'comment' || type == 'reply') {
        // 게시글 캐시 업데이트
        final articleCacheNotifier =
            _container.read(articleCacheProvider.notifier);

        // 현재 캐시에 있는 게시글 가져오기
        final currentArticle = _container.read(articleCacheProvider)[refId];

        if (currentArticle != null) {
          // 댓글 카운트 증가
          final updatedArticle = currentArticle.copyWith(
            commentCount: currentArticle.commentCount + 1,
          );

          // 캐시 업데이트
          articleCacheNotifier.updateArticle(updatedArticle);
          _logger.i(
              '알림으로 게시글 댓글 카운트 업데이트: articleId=$refId, commentCount=${updatedArticle.commentCount}');
        } else {
          // 캐시에 없는 경우 게시글 정보 새로고침
          _container.refresh(articleProvider(refId));
          _logger.i('알림으로 게시글 정보 새로고침: articleId=$refId');
        }

        // 댓글 목록도 새로고침
        _container.refresh(commentListProvider(refId));
      }
      // 알림 목록도 새로고침
      _container
          .read(unreadNotificationCountProvider.notifier)
          .addNotificationCount();
    } catch (e) {
      _logger.e('게시글 업데이트 오류', error: e);
    }
  }
}

// 알림 권한 요청 결과
enum NotificationPermissionResult {
  granted,
  denied,
  error,
}
