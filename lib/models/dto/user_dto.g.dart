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
      profileImageUrl: json['profile_image_url'] as String?,
      points: (json['points'] as num?)?.toInt(),
      carrots: (json['carrots'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserDTOImplToJson(_$UserDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nickname': instance.nickname,
      'is_active': instance.isActive,
      'is_blocked': instance.isBlocked,
      'profile_image_url': instance.profileImageUrl,
      'points': instance.points,
      'carrots': instance.carrots,
    };
