import 'package:firebase_auth/firebase_auth.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:dio/dio.dart';
import 'package:pacapaca/models/dto/auth_dto.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pacapaca/services/hmac_service.dart';
import 'dart:convert';
import 'package:pacapaca/models/dto/common_dto.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final HMACUtil _hmacUtil = HMACUtil(utf8.decode(
      base64Decode(dotenv.env['SENDMIND_SECRET_KEY'].toString()).toList()));

  final Dio _dio = Dio(BaseOptions(
    baseUrl: dotenv.get('SENDMIND_API_URL'),
    headers: {
      'Content-Type': 'application/json',
    },
  ));
  final logger = GetIt.instance<Logger>();
  final _storage = const FlutterSecureStorage();

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  Future<String?> get accessToken => _storage.read(key: _accessTokenKey);
  Future<String?> get refreshToken => _storage.read(key: _refreshTokenKey);

  // 현재 유저 상태 스트림
  Stream<UserDTO?> get authStateChanges => _auth.authStateChanges().asyncMap(
        (user) async {
          if (user == null) return null;
          try {
            return await _serverLogin(
              idToken: await user.getIdToken() ?? '',
              authProvider: 'apple',
            );
          } catch (e) {
            logger.e('Failed to get user data: $e');
            return null;
          }
        },
      );

  // 현재 유저 가져오기
  Future<UserDTO?> get currentUser async {
    final token = await accessToken;
    if (token == null) return null;

    try {
      final response = await _dio.get(
        '/v1/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final responseRest = ResponseRest.fromJson(response.data);
      if (responseRest.statusCode == 200 || responseRest.statusCode == 201) {
        return UserDTO.fromJson(responseRest.response);
      }
      return null;
    } catch (e) {
      logger.e('Failed to get current user: $e');
      return null;
    }
  }

  Future<UserDTO?> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
        ],
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final userCredential = await _auth.signInWithCredential(oauthCredential);

      return await _serverLogin(
        idToken: await userCredential.user?.getIdToken() ?? '',
        authProvider: 'apple',
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> signOut() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
      _auth.signOut(),
    ]);
  }

  Future<UserDTO?> _serverLogin({
    required String idToken,
    required String authProvider,
    String? pushToken,
  }) async {
    try {
      String timestamp = DateTime.now().toUtc().toIso8601String();
      String body = jsonEncode({
        'id_token': idToken,
        'auth_provider': authProvider,
        'push_token': pushToken,
      });

      String signature = _hmacUtil.generateHMACSignature(body, timestamp);

      final response = await _dio.post(
        '/v1/auth/login',
        data: body,
        options: Options(
          headers: {
            'X-Signature': signature,
            'X-Timestamp': timestamp,
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final loginResponse = LoginResponse.fromJson(response.data);
        // 토큰을 안전하게 저장
        await Future.wait([
          _storage.write(
              key: _accessTokenKey, value: loginResponse.accessToken),
          _storage.write(
              key: _refreshTokenKey, value: loginResponse.refreshToken),
        ]);
        return loginResponse.user;
      }

      return null;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
