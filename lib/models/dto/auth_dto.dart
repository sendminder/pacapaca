import 'user_dto.dart';

// Request DTOs
class LoginRequest {
  final String idToken;
  final String pushToken;
  final String authProvider;

  const LoginRequest({
    required this.idToken,
    required this.pushToken,
    required this.authProvider,
  });

  Map<String, dynamic> toJson() => {
        'id_token': idToken,
        'push_token': pushToken,
        'auth_provider': authProvider,
      };
}

// Response DTOs
class LoginResponse {
  final UserDTO user;
  final String accessToken;
  final String refreshToken;

  const LoginResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: UserDTO.fromJson(json['user']),
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'],
      );
}
