import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'package:pacapaca/models/dto/notification_dto.dart';
import 'dart:convert';
import 'package:pacapaca/services/dio_service.dart';

class NotificationService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  /// 알림 목록 조회
  Future<ResponseNotificationList?> getNotifications({
    int limit = 20,
    int? pagingKey,
  }) async {
    try {
      RequestListNotifications request = RequestListNotifications(
        limit: limit,
        pagingKey: pagingKey,
      );
      final response = await _dio.get(
        '/v1/notifications',
        queryParameters: request.toJson(),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        return ResponseNotificationList.fromJson(responseRest.response!);
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get notifications', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// FCM 토큰 등록
  Future<void> registerFCMToken(String fcmToken) async {
    try {
      final request = RequestRegisterFCMToken(fcmToken: fcmToken);
      await _dio.post(
        '/v1/notifications/fcm-token',
        data: jsonEncode(request.toJson()),
      );
    } catch (e, stackTrace) {
      logger.e('register FCM token', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 알림 읽음 표시
  Future<void> markAsRead(int notificationId) async {
    try {
      await _dio.put('/v1/notifications/$notificationId/read');
    } catch (e, stackTrace) {
      logger.e('mark notification as read', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 모든 알림 읽음 표시
  Future<void> markAllAsRead() async {
    try {
      await _dio.put('/v1/notifications/read-all');
    } catch (e, stackTrace) {
      logger.e('mark all notifications as read',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 알림 삭제
  Future<void> deleteNotification(int notificationId) async {
    try {
      await _dio.delete('/v1/notifications/$notificationId');
    } catch (e, stackTrace) {
      logger.e('delete notification', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
