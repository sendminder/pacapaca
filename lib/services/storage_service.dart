import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class StorageService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';
  final logger = GetIt.instance<Logger>();

  final _storage = const FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
      synchronizable: false,
    ),
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  // 토큰 읽기
  Future<String?> get accessToken => _storage.read(key: _accessTokenKey);
  Future<String?> get refreshToken => _storage.read(key: _refreshTokenKey);

  // 사용자 정보 저장
  Future<void> saveUser(UserDTO user) async {
    try {
      // 기존 데이터 삭제 후 저장
      if (await _storage.containsKey(key: _userKey)) {
        await _storage.delete(key: _userKey);
      }
      await _storage.write(
        key: _userKey,
        value: jsonEncode(user.toJson()),
      );
    } catch (e, stackTrace) {
      logger.e('save user data', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 토큰 저장
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      // 1. 기존 토큰이 있는지 확인 후 삭제
      if (await _storage.containsKey(key: _accessTokenKey)) {
        await _storage.delete(key: _accessTokenKey);
      }
      if (await _storage.containsKey(key: _refreshTokenKey)) {
        await _storage.delete(key: _refreshTokenKey);
      }

      // 2. 새 토큰 저장
      await _storage.write(key: _accessTokenKey, value: accessToken);
      await _storage.write(key: _refreshTokenKey, value: refreshToken);

      logger.d('Tokens saved successfully');
    } catch (e, stackTrace) {
      logger.e('save tokens', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 토큰 삭제
  Future<void> deleteTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
  }

  // 저장된 사용자 정보 가져오기
  Future<UserDTO?> get userData async {
    final userStr = await _storage.read(key: _userKey);
    if (userStr == null) return null;
    return UserDTO.fromJson(jsonDecode(userStr));
  }

  // 사용자 정보 삭제
  Future<void> deleteUser() async {
    await _storage.delete(key: _userKey);
  }
}
