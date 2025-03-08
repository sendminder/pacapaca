// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestListNotificationsImpl _$$RequestListNotificationsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListNotificationsImpl(
      limit: (json['limit'] as num).toInt(),
      pagingKey: (json['paging_key'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestListNotificationsImplToJson(
        _$RequestListNotificationsImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'paging_key': instance.pagingKey,
    };

_$NotificationDTOImpl _$$NotificationDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDTOImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String,
      refId: (json['ref_id'] as num?)?.toInt(),
      subId: (json['sub_id'] as num?)?.toInt(),
      thirdId: (json['third_id'] as num?)?.toInt(),
      isRead: json['is_read'] as bool,
      createTime: json['create_time'] as String,
    );

Map<String, dynamic> _$$NotificationDTOImplToJson(
        _$NotificationDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'ref_id': instance.refId,
      'sub_id': instance.subId,
      'third_id': instance.thirdId,
      'is_read': instance.isRead,
      'create_time': instance.createTime,
    };

_$ResponseNotificationImpl _$$ResponseNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseNotificationImpl(
      notification: NotificationDTO.fromJson(
          json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseNotificationImplToJson(
        _$ResponseNotificationImpl instance) =>
    <String, dynamic>{
      'notification': instance.notification,
    };

_$ResponseNotificationListImpl _$$ResponseNotificationListImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseNotificationListImpl(
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => NotificationDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ResponseNotificationListImplToJson(
        _$ResponseNotificationListImpl instance) =>
    <String, dynamic>{
      'notifications': instance.notifications,
      'total': instance.total,
    };

_$RequestRegisterFCMTokenImpl _$$RequestRegisterFCMTokenImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestRegisterFCMTokenImpl(
      fcmToken: json['fcm_token'] as String,
    );

Map<String, dynamic> _$$RequestRegisterFCMTokenImplToJson(
        _$RequestRegisterFCMTokenImpl instance) =>
    <String, dynamic>{
      'fcm_token': instance.fcmToken,
    };
