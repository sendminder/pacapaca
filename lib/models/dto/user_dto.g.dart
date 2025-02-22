// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDTOImpl _$$UserDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserDTOImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      nickname: json['nickname'] as String,
      isActive: json['is_active'] as bool,
      isBlocked: json['is_blocked'] as bool,
      isOfficial: json['is_official'] as bool,
      profileImageUrl: json['profile_image_url'] as String?,
      profileType: json['profile_type'] as String?,
      badgeImageUrl: json['badge_image_url'] as String?,
      badgeType: json['badge_type'] as String?,
      points: (json['points'] as num?)?.toInt(),
      carrots: (json['carrots'] as num?)?.toInt(),
      createTime: json['create_time'] as String?,
      updateTime: json['update_time'] as String?,
      deleteTime: json['delete_time'] as String?,
      blockTime: json['block_time'] as String?,
    );

Map<String, dynamic> _$$UserDTOImplToJson(_$UserDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nickname': instance.nickname,
      'is_active': instance.isActive,
      'is_blocked': instance.isBlocked,
      'is_official': instance.isOfficial,
      'profile_image_url': instance.profileImageUrl,
      'profile_type': instance.profileType,
      'badge_image_url': instance.badgeImageUrl,
      'badge_type': instance.badgeType,
      'points': instance.points,
      'carrots': instance.carrots,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
      'delete_time': instance.deleteTime,
      'block_time': instance.blockTime,
    };
