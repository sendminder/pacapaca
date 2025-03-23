import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_dto.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

// Request DTOs
@freezed
class RequestLogin with _$RequestLogin {
  const factory RequestLogin({
    @JsonKey(name: 'id_token') required String idToken,
    @JsonKey(name: 'push_token') required String pushToken,
    @JsonKey(name: 'auth_provider') required String authProvider,
  }) = _RequestLogin;

  factory RequestLogin.fromJson(Map<String, dynamic> json) =>
      _$RequestLoginFromJson(json);
}

@freezed
class RequestRefresh with _$RequestRefresh {
  const factory RequestRefresh({
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _RequestRefresh;

  factory RequestRefresh.fromJson(Map<String, dynamic> json) =>
      _$RequestRefreshFromJson(json);
}

@freezed
class RequestCheckNickname with _$RequestCheckNickname {
  const factory RequestCheckNickname({
    @JsonKey(name: 'nickname') required String nickname,
  }) = _RequestCheckNickname;

  factory RequestCheckNickname.fromJson(Map<String, dynamic> json) =>
      _$RequestCheckNicknameFromJson(json);
}

// Response DTOs
@freezed
class ResponseSignUp with _$ResponseSignUp {
  const factory ResponseSignUp({
    required UserDTO user,
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _ResponseSignUp;

  factory ResponseSignUp.fromJson(Map<String, dynamic> json) =>
      _$ResponseSignUpFromJson(json);
}

@freezed
class ResponseRefresh with _$ResponseRefresh {
  const factory ResponseRefresh({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _ResponseRefresh;

  factory ResponseRefresh.fromJson(Map<String, dynamic> json) =>
      _$ResponseRefreshFromJson(json);
}

@freezed
class ResponseGetMe with _$ResponseGetMe {
  const factory ResponseGetMe({
    required UserDTO user,
  }) = _ResponseGetMe;

  factory ResponseGetMe.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetMeFromJson(json);
}

@freezed
class ResponseCheckNickname with _$ResponseCheckNickname {
  const factory ResponseCheckNickname({
    @JsonKey(name: 'exists') required bool exists,
  }) = _ResponseCheckNickname;

  factory ResponseCheckNickname.fromJson(Map<String, dynamic> json) =>
      _$ResponseCheckNicknameFromJson(json);
}

@freezed
class RequestUpdateMe with _$RequestUpdateMe {
  const factory RequestUpdateMe({
    @JsonKey(name: 'nickname') String? nickname,
    @JsonKey(name: 'profile_type') String? profileType,
    @JsonKey(name: 'badge_type') String? badgeType,
    @JsonKey(name: 'notification_enabled') bool? notificationEnabled,
    @JsonKey(name: 'platform') String? platform,
  }) = _RequestUpdateMe;

  factory RequestUpdateMe.fromJson(Map<String, dynamic> json) =>
      _$RequestUpdateMeFromJson(json);
}
