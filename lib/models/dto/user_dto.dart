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
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    int? points,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
