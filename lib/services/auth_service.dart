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
import 'package:pacapaca/services/dio_service.dart';

class AuthService {
  final Dio _dio = DioService.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StorageService _storageService = GetIt.instance<StorageService>();
  final HMACUtil _hmacUtil = HMACUtil(utf8.decode(
      base64Decode(dotenv.env['SENDMIND_SECRET_KEY'].toString()).toList()));
  final logger = GetIt.instance<Logger>();

  // 현재 유저 상태 스트림
  Stream<UserDTO?> get authStateChanges => _auth.authStateChanges().asyncMap(
        (user) async {
          if (user == null) return null;
          try {
            // 서버에 저장된 현재 사용자 정보를 가져옴
            return await currentUser;
          } catch (e, stackTrace) {
            logger.e('auth state changes', error: e, stackTrace: stackTrace);
            return null;
          }
        },
      );

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
      // 0. 현재 저장된 유저 정보를 가져간다.
      final user = await _storageService.userData;
      if (user != null) return user;

      // 1. 현재 저장된 access token으로 me를 가져온다.
      final token = await _storageService.accessToken;
      if (token == null) return null;

      try {
        return await getMe(token);
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          final newToken = await refreshToken();
          if (newToken != null) {
            return await getMe(newToken);
          }
          await signOut();
        }
        rethrow;
      }
    } catch (e, stackTrace) {
      logger.e('get current user', error: e, stackTrace: stackTrace);
      await signOut();
      return null;
    }
  }

  Future<UserDTO?> getMe(String? token) async {
    try {
      var accessToken = token;
      if (token == null) {
        accessToken = await _storageService.accessToken;
      }

      final response = await _dio.get(
        '/v1/me',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final getMeResponse = ResponseGetMe.fromJson(responseRest.response!);
        await _storageService.saveUser(getMeResponse.user);
        return getMeResponse.user;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get me', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<String?> refreshToken() async {
    try {
      final refreshToken = await _storageService.refreshToken;
      if (refreshToken == null) return null;

      String timestamp = DateTime.now().toUtc().toIso8601String();
      final refreshRequest = RequestRefresh(refreshToken: refreshToken);
      final body = jsonEncode(refreshRequest.toJson());
      String signature = _hmacUtil.generateHMACSignature(body, timestamp);

      final response = await _dio.post(
        '/v1/auth/refresh',
        data: body,
        options: Options(
          headers: {
            'X-Signature': signature,
            'X-Timestamp': timestamp,
          },
        ),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final refreshResponse =
            ResponseRefresh.fromJson(responseRest.response!);
        await _storageService.saveTokens(
          accessToken: refreshResponse.accessToken,
          refreshToken: refreshResponse.refreshToken,
        );
        return refreshResponse.accessToken;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('refresh token', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  Future<UserDTO?> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email],
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final userCredential = await _auth.signInWithCredential(oauthCredential);

      final loginRequest = RequestLogin(
        idToken: await userCredential.user?.getIdToken() ?? '',
        authProvider: 'apple',
        pushToken: '', // TODO: 푸시 토큰 추가
      );

      return await _serverLogin(loginRequest);
    } catch (e, stackTrace) {
      logger.e('sign in with apple', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      final token = await _storageService.accessToken;
      if (token == null) return;

      final response = await _dio.post(
        '/v1/auth/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        await Future.wait([
          _storageService.deleteTokens(),
          _storageService.deleteUser(),
          _auth.signOut(),
        ]);
      }
    } catch (e, stackTrace) {
      logger.e('sign out', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<UserDTO?> _serverLogin(RequestLogin request) async {
    try {
      String timestamp = DateTime.now().toUtc().toIso8601String();
      String body = jsonEncode(request.toJson());
      String signature = _hmacUtil.generateHMACSignature(body, timestamp);

      final response = await _dio.post(
        '/v1/auth/login',
        data: body,
        options: Options(
          headers: {
            'X-Signature': signature,
            'X-Timestamp': timestamp,
          },
        ),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final signUpResponse = ResponseSignUp.fromJson(responseRest.response!);
        await Future.wait([
          _storageService.saveTokens(
            accessToken: signUpResponse.accessToken,
            refreshToken: signUpResponse.refreshToken,
          ),
          _storageService.saveUser(signUpResponse.user),
        ]);
        return signUpResponse.user;
      }

      return null;
    } catch (e, stackTrace) {
      logger.e('server login error', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<UserDTO?> updateMe(RequestUpdateMe request) async {
    try {
      final token = await _storageService.accessToken;
      if (token == null) return null;

      final response = await _dio.put(
        '/v1/me',
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final getMeResponse = ResponseGetMe.fromJson(responseRest.response!);
        await _storageService.saveUser(getMeResponse.user);
        return getMeResponse.user;
      }
      throw Exception(responseRest.message);
    } catch (e, stackTrace) {
      logger.e('update nickname', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<UserDTO?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final loginRequest = RequestLogin(
        idToken: await userCredential.user?.getIdToken() ?? '',
        authProvider: 'email',
        pushToken: '', // TODO: 푸시 토큰 추가
      );

      return await _serverLogin(loginRequest);
    } catch (e, stackTrace) {
      logger.e('sign in with email', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
