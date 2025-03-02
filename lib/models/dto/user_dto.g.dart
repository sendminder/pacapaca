// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisplayUserDTOImpl _$$DisplayUserDTOImplFromJson(Map<String, dynamic> json) =>
    _$DisplayUserDTOImpl(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      isActive: json['is_active'] as bool,
      isBlocked: json['is_blocked'] as bool,
      isOfficial: json['is_official'] as bool,
      profileType: json['profile_type'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      badgeType: json['badge_type'] as String?,
      badgeImageUrl: json['badge_image_url'] as String?,
      points: (json['points'] as num?)?.toInt(),
      carrots: (json['carrots'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DisplayUserDTOImplToJson(
        _$DisplayUserDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'is_active': instance.isActive,
      'is_blocked': instance.isBlocked,
      'is_official': instance.isOfficial,
      'profile_type': instance.profileType,
      'profile_image_url': instance.profileImageUrl,
      'badge_type': instance.badgeType,
      'badge_image_url': instance.badgeImageUrl,
      'points': instance.points,
      'carrots': instance.carrots,
    };

_$UserDTOImpl _$$UserDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserDTOImpl(
      id: (json['id'] as num).toInt(),
      createTime: json['create_time'] as String?,
      updateTime: json['update_time'] as String?,
      lastLoginTime: json['last_login_time'] as String?,
      blockTime: json['block_time'] as String?,
      deleteTime: json['delete_time'] as String?,
      displayUser:
          DisplayUserDTO.fromJson(json['display_user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserDTOImplToJson(_$UserDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
      'last_login_time': instance.lastLoginTime,
      'block_time': instance.blockTime,
      'delete_time': instance.deleteTime,
      'display_user': instance.displayUser,
    };

_$RequestGetUserByIDImpl _$$RequestGetUserByIDImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestGetUserByIDImpl(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$RequestGetUserByIDImplToJson(
        _$RequestGetUserByIDImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

_$ResponseGetUserByIDImpl _$$ResponseGetUserByIDImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseGetUserByIDImpl(
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseGetUserByIDImplToJson(
        _$ResponseGetUserByIDImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
