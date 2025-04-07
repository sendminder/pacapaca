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
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final Dio _dio = DioService.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final StorageService _storageService = GetIt.instance<StorageService>();
  final HMACUtil _hmacUtil = HMACUtil(utf8.decode(
      base64Decode(dotenv.env['SENDMIND_SECRET_KEY'].toString()).toList()));
  final logger = GetIt.instance<Logger>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // 현재 유저 상태 스트림
  Stream<UserDTO?> get authStateChanges => _auth.authStateChanges().asyncMap(
        (user) async {
          if (user == null) return null;
          try {
            // 로컬 스토리지에 토큰이 있는지 확인
            final token = await _storageService.accessToken;
            if (token == null) {
              // 토큰이 없으면 Firebase에서도 로그아웃
              await _auth.signOut();
              return null;
            }

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
      // Firebase 인증 상태 확인
      final firebaseUser = _auth.currentUser;
      if (firebaseUser == null) {
        // Firebase 사용자가 없으면 로컬 데이터 삭제
        await Future.wait([
          _storageService.deleteTokens(),
          _storageService.deleteUser(),
        ]);
        return null;
      }

      // 0. 현재 저장된 유저 정보를 가져간다.
      final user = await _storageService.userData;
      if (user != null) return user;

      // 1. 현재 저장된 access token으로 me를 가져온다.
      final token = await _storageService.accessToken;
      if (token == null) return null;

      try {
        return await getMe(token, null);
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          final newToken = await refreshToken();
          if (newToken != null) {
            return await getMe(newToken, null);
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

  Future<UserDTO?> getMe(String? token, String? appVersion) async {
    try {
      var accessToken = token;
      if (token == null) {
        accessToken = await _storageService.accessToken;
      }

      if (accessToken == null) {
        return null;
      }

      Map<String, dynamic>? queryParameters;
      if (appVersion != null) {
        final request = RequestGetMe(appVersion: appVersion);
        queryParameters = request.toJson();
      }

      final response = await _dio.get(
        '/v1/me',
        queryParameters: queryParameters,
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
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
        ],
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      final userCredential = await _auth.signInWithCredential(oauthCredential);

      final loginRequest = RequestLogin(
        idToken: await userCredential.user?.getIdToken() ?? '',
        authProvider: 'apple',
        pushToken: '',
      );

      return await _serverLogin(loginRequest);
    } catch (e, stackTrace) {
      logger.e('sign in with apple', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  Future<UserDTO?> signInWithGoogle() async {
    try {
      final credential = await _googleSignIn.signIn();
      if (credential == null) return null;

      final authentication = await credential.authentication;
      final oauthCredential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      final userCredential = await _auth.signInWithCredential(oauthCredential);

      final loginRequest = RequestLogin(
        idToken: await userCredential.user?.getIdToken() ?? '',
        authProvider: 'google',
        pushToken: '',
      );

      return await _serverLogin(loginRequest);
    } catch (e, stackTrace) {
      logger.e('sign in with google', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  Future<bool> reAuthenticateWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
        ],
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      await _auth.currentUser?.reauthenticateWithCredential(oauthCredential);
      return true;
    } catch (e, stackTrace) {
      logger.e('reauthenticate with apple', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  Future<bool> reAuthenticateWithGoogle() async {
    try {
      final credential = await _googleSignIn.signIn();
      if (credential == null) return false;

      final authentication = await credential.authentication;
      final oauthCredential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      await _auth.currentUser?.reauthenticateWithCredential(oauthCredential);
      return true;
    } catch (e, stackTrace) {
      logger.e('reauthenticate with google', error: e, stackTrace: stackTrace);
      return false;
    }
  }

  Future<void> signOut({bool? isDelete = false}) async {
    try {
      // 1. Firebase에서 먼저 로그아웃 시도
      try {
        await _auth.signOut();
      } catch (e) {
        logger.e('Firebase sign out failed', error: e);
      }

      // 2. 서버에 로그아웃 요청 (토큰이 있는 경우)
      final token = await _storageService.accessToken;
      if (token != null && isDelete != true) {
        try {
          await _dio.post(
            '/v1/auth/logout',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          );
        } catch (e) {
          logger.e('Server logout request failed', error: e);
        }
      } else {
        logger.d('No access token found, skipping server logout');
      }

      // 3. 로컬 스토리지 데이터 삭제
      try {
        await _storageService.deleteTokens();
        await _storageService.deleteUser();
      } catch (e) {
        logger.e('Failed to delete local storage data', error: e);
      }

      // 4. 마지막으로 다시 한번 Firebase 로그아웃 시도 (이중 안전장치)
      try {
        if (_auth.currentUser != null) {
          await _auth.signOut();
        }
      } catch (e) {
        logger.e('Final Firebase sign out attempt failed', error: e);
      }
    } catch (e, stackTrace) {
      logger.e('Complete logout process failed',
          error: e, stackTrace: stackTrace);
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
      final response = await _dio.put(
        '/v1/me',
        data: jsonEncode(request.toJson()),
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
        pushToken: '',
      );

      return await _serverLogin(loginRequest);
    } catch (e, stackTrace) {
      logger.e('sign in with email', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 닉네임 중복 체크
  Future<bool> checkNicknameExists(String nickname) async {
    try {
      final request = RequestCheckNickname(nickname: nickname);
      String body = jsonEncode(request.toJson());
      final response = await _dio.post(
        '/v1/users/check-nickname',
        data: body,
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final result = ResponseCheckNickname.fromJson(responseRest.response!);
        return result.exists;
      }
      throw Exception(responseRest.message);
    } catch (e, stackTrace) {
      logger.e('check nickname exists', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> deleteMe() async {
    try {
      final response = await _dio.delete('/v1/me');
      if (response.statusCode == 200) {
        await signOut(isDelete: true);
      }
    } catch (e, stackTrace) {
      logger.e('delete me', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
