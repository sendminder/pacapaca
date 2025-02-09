// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      idToken: json['id_token'] as String,
      pushToken: json['push_token'] as String,
      authProvider: json['auth_provider'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'id_token': instance.idToken,
      'push_token': instance.pushToken,
      'auth_provider': instance.authProvider,
    };

_$RefreshRequestImpl _$$RefreshRequestImplFromJson(Map<String, dynamic> json) =>
    _$RefreshRequestImpl(
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$$RefreshRequestImplToJson(
        _$RefreshRequestImpl instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
    };

_$SignUpResponseImpl _$$SignUpResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignUpResponseImpl(
      user: UserDTO.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$$SignUpResponseImplToJson(
        _$SignUpResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

_$RefreshResponseImpl _$$RefreshResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshResponseImpl(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$$RefreshResponseImplToJson(
        _$RefreshResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

_$GetMeResponseImpl _$$GetMeResponseImplFromJson(Map<String, dynamic> json) =>
    _$GetMeResponseImpl(
      user: UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetMeResponseImplToJson(_$GetMeResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

_$UpdateMeRequestImpl _$$UpdateMeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateMeRequestImpl(
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$$UpdateMeRequestImplToJson(
        _$UpdateMeRequestImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
    };
