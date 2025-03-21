import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/*
type UserDTO struct {
	ID            int64  `json:"id"`
	Email         string `json:"email"`
	CreateTime    string `json:"create_time,omitempty"`
	UpdateTime    string `json:"update_time,omitempty"`
	LastLoginTime string `json:"last_login_time,omitempty"`
	BlockTime     string `json:"block_time,omitempty"`
	DeleteTime    string `json:"delete_time,omitempty"`

	DisplayUser DisplayUserDTO `json:"display_user"`
}

type DisplayUserDTO struct {
	ID              int64  `json:"id"`
	Nickname        string `json:"nickname"`
	IsActive        bool   `json:"is_active"`
	IsBlocked       bool   `json:"is_blocked"`
	IsOfficial      bool   `json:"is_official"`
	ProfileType     string `json:"profile_type,omitempty"`
	ProfileImageURL string `json:"profile_image_url,omitempty"`
	BadgeType       string `json:"badge_type,omitempty"`
	BadgeImageURL   string `json:"badge_image_url,omitempty"`
	Points          int64  `json:"points,omitempty"`
	Carrots         int64  `json:"carrots,omitempty"`
}
*/

@freezed
class DisplayUserDTO with _$DisplayUserDTO {
  const factory DisplayUserDTO({
    required int id,
    required String nickname,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_blocked') required bool isBlocked,
    @JsonKey(name: 'is_official') required bool isOfficial,
    @JsonKey(name: 'profile_type') String? profileType,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'badge_type') String? badgeType,
    @JsonKey(name: 'badge_image_url') String? badgeImageUrl,
    int? points,
    int? carrots,
  }) = _DisplayUserDTO;

  factory DisplayUserDTO.fromJson(Map<String, dynamic> json) =>
      _$DisplayUserDTOFromJson(json);
}

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    required int id,
    @JsonKey(name: 'create_time') String? createTime,
    @JsonKey(name: 'update_time') String? updateTime,
    @JsonKey(name: 'last_login_time') String? lastLoginTime,
    @JsonKey(name: 'block_time') String? blockTime,
    @JsonKey(name: 'delete_time') String? deleteTime,
    @JsonKey(name: 'need_updated') bool? needUpdated,
    @JsonKey(name: 'force_updated') bool? forceUpdated,
    @JsonKey(name: 'display_user') required DisplayUserDTO displayUser,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}

@freezed
class RequestGetMe with _$RequestGetMe {
  const factory RequestGetMe({
    @JsonKey(name: 'app_version') String? appVersion,
  }) = _RequestGetMe;

  factory RequestGetMe.fromJson(Map<String, dynamic> json) =>
      _$RequestGetMeFromJson(json);
}

@freezed
class RequestGetUserByID with _$RequestGetUserByID {
  const factory RequestGetUserByID({
    required int id,
  }) = _RequestGetUserByID;

  factory RequestGetUserByID.fromJson(Map<String, dynamic> json) =>
      _$RequestGetUserByIDFromJson(json);
}

@freezed
class ResponseGetUserByID with _$ResponseGetUserByID {
  const factory ResponseGetUserByID({
    UserDTO? user,
  }) = _ResponseGetUserByID;

  factory ResponseGetUserByID.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetUserByIDFromJson(json);
}
