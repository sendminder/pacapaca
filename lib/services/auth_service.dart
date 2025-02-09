import 'package:firebase_auth/firebase_auth.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:dio/dio.dart';
import 'package:pacapaca/models/dto/auth_dto.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pacapaca/services/hmac_service.dart';
import 'dart:convert';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'package:pacapaca/services/storage_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StorageService _storageService = GetIt.instance<StorageService>();

  final HMACUtil _hmacUtil = HMACUtil(utf8.decode(
      base64Decode(dotenv.env['SENDMIND_SECRET_KEY'].toString()).toList()));

  final Dio _dio = Dio(BaseOptions(
    baseUrl: dotenv.get('SENDMIND_API_URL'),
    headers: {
      'Content-Type': 'application/json',
    },
  ));
  final logger = GetIt.instance<Logger>();

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
  /*
  1. 현재 저장된 access token으로 me를 가져온다.
  2. 만료되었으면 refresh token으로 토큰 갱신
  3. 토큰 갱신 실패시 로그아웃
  4. 토큰 갱신 성공시 다시 me를 가져온다.
  5. 성공시 유저 정보를 반환하고, home 화면으로 redirect
  6. 실패시 로그아웃 후 null 반환, login 화면으로 redirect
  */
  Future<UserDTO?> get currentUser async {
    try {
      return await _getWithAuth('/v1/me');
    } catch (e) {
      logger.e('get current user: $e');
      return null;
    }
  }

  Future<T?> _getWithAuth<T>(String path,
      {T Function(dynamic)? fromJson}) async {
    try {
      final token = await _storageService.accessToken;
      if (token == null) return null;

      try {
        final response = await _dio.get(
          path,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        final responseRest = ResponseRest.fromJson(response.data);
        if (responseRest.statusCode == 200 || responseRest.statusCode == 201) {
          return fromJson != null
              ? fromJson(responseRest.response)
              : responseRest.response;
        }
        throw Exception(responseRest.message);
      } on DioException catch (e) {
        // 401 에러일 경우 토큰 갱신 시도
        if (e.response?.statusCode == 401) {
          final newAccessToken = await _refreshToken();
          if (newAccessToken != null) {
            // 새로운 토큰으로 재시도
            final retryResponse = await _dio.get(
              path,
              options: Options(
                headers: {
                  'Authorization': 'Bearer $newAccessToken',
                },
              ),
            );

            final responseRest = ResponseRest.fromJson(retryResponse.data);
            if (responseRest.statusCode == 200 ||
                responseRest.statusCode == 201) {
              return fromJson != null
                  ? fromJson(responseRest.response)
                  : responseRest.response;
            }
          }
          // 토큰 갱신 실패시 로그아웃
          await signOut();
        }
        rethrow;
      }
    } catch (e) {
      logger.e('API request failed: $e');
      rethrow;
    }
  }

  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await _storageService.refreshToken;
      if (refreshToken == null) return null;

      String timestamp = DateTime.now().toUtc().toIso8601String();
      String body = jsonEncode({
        'refresh_token': refreshToken,
      });

      String signature = _hmacUtil.generateHMACSignature(body, timestamp);

      final response = await _dio.post(
        '/v1/auth/refresh',
        data: body,
        options: Options(
          headers: {
            'X-Signature': signature,
            'X-Timestamp': timestamp,
            'Content-Type': 'application/json',
          },
        ),
      );

      final responseRest = ResponseRest.fromJson(response.data);
      if (responseRest.statusCode == 200 || responseRest.statusCode == 201) {
        final loginResponse = LoginResponse.fromJson(responseRest.response);
        await _storageService.saveTokens(
          accessToken: loginResponse.accessToken,
          refreshToken: loginResponse.refreshToken,
        );
        return loginResponse.accessToken;
      }
      return null;
    } catch (e) {
      logger.e('Token refresh failed: $e');
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
      _storageService.deleteTokens(),
      _storageService.deleteUser(),
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

      final responseRest = ResponseRest.fromJson(response.data);
      logger.d(responseRest);
      if (responseRest.statusCode == 200 || responseRest.statusCode == 201) {
        final loginResponse = LoginResponse.fromJson(responseRest.response);
        // 토큰과 함께 사용자 정보도 저장
        await Future.wait([
          _storageService.saveTokens(
            accessToken: loginResponse.accessToken,
            refreshToken: loginResponse.refreshToken,
          ),
          _storageService.saveUser(loginResponse.user),
        ]);
        return loginResponse.user;
      }

      return null;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<void> updateNickname(String nickname) async {
    try {
      final token = await _storageService.accessToken;
      if (token == null) return;

      final response = await _dio.put(
        '/v1/me',
        data: jsonEncode({
          'nickname': nickname,
        }),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      final responseRest = ResponseRest.fromJson(response.data);
      if (responseRest.statusCode == 200 || responseRest.statusCode == 201) {
        // 닉네임 업데이트 성공 시 저장된 사용자 정보도 업데이트
        final currentUser = await _storageService.userData;
        if (currentUser != null) {
          await _storageService.saveUser(
            currentUser.copyWith(nickname: nickname),
          );
        }
        return;
      }
      throw Exception(responseRest.message);
    } catch (e) {
      logger.e('Failed to update nickname: $e');
      rethrow;
    }
  }
}
