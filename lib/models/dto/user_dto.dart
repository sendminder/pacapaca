import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    required int id,
    required String email,
    required String nickname,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_blocked') required bool isBlocked,
    @JsonKey(name: 'is_official') required bool isOfficial,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'profile_type') String? profileType,
    @JsonKey(name: 'badge_image_url') String? badgeImageUrl,
    @JsonKey(name: 'badge_type') String? badgeType,
    int? points,
    int? carrots,
    @JsonKey(name: 'create_time') String? createTime,
    @JsonKey(name: 'update_time') String? updateTime,
    @JsonKey(name: 'delete_time') String? deleteTime,
    @JsonKey(name: 'block_time') String? blockTime,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
