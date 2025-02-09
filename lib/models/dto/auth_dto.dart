import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_dto.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

// Request DTOs
@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    @JsonKey(name: 'id_token') required String idToken,
    @JsonKey(name: 'push_token') required String pushToken,
    @JsonKey(name: 'auth_provider') required String authProvider,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class RefreshRequest with _$RefreshRequest {
  const factory RefreshRequest({
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _RefreshRequest;

  factory RefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestFromJson(json);
}

// Response DTOs
@freezed
class SignUpResponse with _$SignUpResponse {
  const factory SignUpResponse({
    required UserDTO user,
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _SignUpResponse;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@freezed
class RefreshResponse with _$RefreshResponse {
  const factory RefreshResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _RefreshResponse;

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
}

@freezed
class GetMeResponse with _$GetMeResponse {
  const factory GetMeResponse({
    required UserDTO user,
  }) = _GetMeResponse;

  factory GetMeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMeResponseFromJson(json);
}

@freezed
class UpdateMeRequest with _$UpdateMeRequest {
  const factory UpdateMeRequest({
    required String nickname,
  }) = _UpdateMeRequest;

  factory UpdateMeRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateMeRequestFromJson(json);
}
