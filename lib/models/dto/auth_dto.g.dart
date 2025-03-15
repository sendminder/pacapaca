// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestLoginImpl _$$RequestLoginImplFromJson(Map<String, dynamic> json) =>
    _$RequestLoginImpl(
      idToken: json['id_token'] as String,
      pushToken: json['push_token'] as String,
      authProvider: json['auth_provider'] as String,
    );

Map<String, dynamic> _$$RequestLoginImplToJson(_$RequestLoginImpl instance) =>
    <String, dynamic>{
      'id_token': instance.idToken,
      'push_token': instance.pushToken,
      'auth_provider': instance.authProvider,
    };

_$RequestRefreshImpl _$$RequestRefreshImplFromJson(Map<String, dynamic> json) =>
    _$RequestRefreshImpl(
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$$RequestRefreshImplToJson(
        _$RequestRefreshImpl instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
    };

_$ResponseSignUpImpl _$$ResponseSignUpImplFromJson(Map<String, dynamic> json) =>
    _$ResponseSignUpImpl(
      user: UserDTO.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$$ResponseSignUpImplToJson(
        _$ResponseSignUpImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

_$ResponseRefreshImpl _$$ResponseRefreshImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseRefreshImpl(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$$ResponseRefreshImplToJson(
        _$ResponseRefreshImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

_$ResponseGetMeImpl _$$ResponseGetMeImplFromJson(Map<String, dynamic> json) =>
    _$ResponseGetMeImpl(
      user: UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseGetMeImplToJson(_$ResponseGetMeImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

_$RequestUpdateMeImpl _$$RequestUpdateMeImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestUpdateMeImpl(
      nickname: json['nickname'] as String?,
      profileType: json['profile_type'] as String?,
      badgeType: json['badge_type'] as String?,
      notificationEnabled: json['notification_enabled'] as bool?,
    );

Map<String, dynamic> _$$RequestUpdateMeImplToJson(
        _$RequestUpdateMeImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'profile_type': instance.profileType,
      'badge_type': instance.badgeType,
      'notification_enabled': instance.notificationEnabled,
    };
