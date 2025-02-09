import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'dart:convert';

class StorageService {
  final _storage = const FlutterSecureStorage();

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _userKey = 'user_data';

  // 토큰 읽기
  Future<String?> get accessToken => _storage.read(key: _accessTokenKey);
  Future<String?> get refreshToken => _storage.read(key: _refreshTokenKey);

  // 토큰 저장
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  // 토큰 삭제
  Future<void> deleteTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
  }

  // 사용자 정보 저장
  Future<void> saveUser(UserDTO user) async {
    await _storage.write(
      key: _userKey,
      value: jsonEncode(user),
    );
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
