import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
class RequestListNotifications with _$RequestListNotifications {
  const factory RequestListNotifications({
    required int limit,
    @JsonKey(name: 'paging_key') int? pagingKey,
  }) = _RequestListNotifications;

  factory RequestListNotifications.fromJson(Map<String, dynamic> json) =>
      _$RequestListNotificationsFromJson(json);
}

@freezed
class NotificationDTO with _$NotificationDTO {
  const factory NotificationDTO({
    required int id,
    required String title,
    required String body,
    required String type,
    @JsonKey(name: 'ref_id') int? refId,
    @JsonKey(name: 'sub_id') int? subId,
    @JsonKey(name: 'third_id') int? thirdId,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'create_time') required String createTime,
  }) = _NotificationDTO;

  factory NotificationDTO.fromJson(Map<String, dynamic> json) =>
      _$NotificationDTOFromJson(json);
}

@freezed
class ResponseNotification with _$ResponseNotification {
  const factory ResponseNotification({
    required NotificationDTO notification,
  }) = _ResponseNotification;

  factory ResponseNotification.fromJson(Map<String, dynamic> json) =>
      _$ResponseNotificationFromJson(json);
}

@freezed
class ResponseNotificationList with _$ResponseNotificationList {
  const factory ResponseNotificationList({
    List<NotificationDTO>? notifications,
    int? total,
  }) = _ResponseNotificationList;

  factory ResponseNotificationList.fromJson(Map<String, dynamic> json) =>
      _$ResponseNotificationListFromJson(json);
}

@freezed
class RequestRegisterFCMToken with _$RequestRegisterFCMToken {
  const factory RequestRegisterFCMToken({
    @JsonKey(name: 'fcm_token') required String fcmToken,
  }) = _RequestRegisterFCMToken;

  factory RequestRegisterFCMToken.fromJson(Map<String, dynamic> json) =>
      _$RequestRegisterFCMTokenFromJson(json);
}
