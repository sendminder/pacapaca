import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';
  static const String _themeKey = 'theme_mode';
  static const String _localeKey = 'locale';
  static const String _commentSortKey = 'comment_sort';
  static const String _articleSortKey = 'article_sort';
  static const String _articleCategoryKey = 'article_category';
  static const String _recentSearchesKey = 'recent_searches';
  static const String _notificationEnabledKey = 'notification_enabled';
  static const String _notificationSetupCompletedKey =
      'notification_setup_completed';
  static const String _firstRunKey = 'first_run_key';

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

  // 앱 설치 후 첫 실행 시 보안 저장소 데이터 초기화
  Future<void> checkFirstRun() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isFirstRun = prefs.getBool(_firstRunKey) ?? true;

      if (isFirstRun) {
        logger.d('앱 첫 실행 감지: 보안 저장소 데이터 초기화');
        await _storage.deleteAll();
        await prefs.setBool(_firstRunKey, false);
      }
    } catch (e, stackTrace) {
      logger.e('첫 실행 확인 중 오류 발생', error: e, stackTrace: stackTrace);
    }
  }

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

  // 테마 저장
  Future<void> saveTheme(ThemeMode theme) async {
    await _storage.write(key: _themeKey, value: theme.toString());
  }

  // 테마 가져오기
  Future<ThemeMode?> get theme async {
    final themeStr = await _storage.read(key: _themeKey);
    if (themeStr == null) return null;
    return ThemeMode.values.firstWhere((e) => e.toString() == themeStr,
        orElse: () => ThemeMode.system);
  }

  // 언어 저장
  Future<void> saveLocale(Locale locale) async {
    await _storage.write(key: _localeKey, value: locale.languageCode);
  }

  // 언어 가져오기
  Future<Locale?> get locale async {
    final localeStr = await _storage.read(key: _localeKey);
    if (localeStr == null) return null;
    return Locale(localeStr);
  }

  // 댓글 정렬 저장
  Future<void> saveCommentSort(String sort) async {
    await _storage.write(key: _commentSortKey, value: sort);
  }

  // 댓글 정렬 가져오기
  Future<String?> get commentSort async {
    return await _storage.read(key: _commentSortKey);
  }

  // 게시글 정렬 저장
  Future<void> saveArticleSort(String sort) async {
    await _storage.write(key: _articleSortKey, value: sort);
  }

  // 게시글 정렬 가져오기
  Future<String?> get articleSort async {
    return await _storage.read(key: _articleSortKey);
  }

  // 게시글 카테고리 저장
  Future<void> saveArticleCategory(ArticleCategory category) async {
    await _storage.write(key: _articleCategoryKey, value: category.toString());
  }

  // 게시글 카테고리 가져오기
  Future<ArticleCategory?> get articleCategory async {
    final categoryStr = await _storage.read(key: _articleCategoryKey);
    if (categoryStr == null) return null;
    return ArticleCategory.values.firstWhere(
      (e) => e.toString() == categoryStr,
      orElse: () => ArticleCategory.daily,
    );
  }

  // 최근 검색어 저장
  Future<void> saveRecentSearches(List<String> searches) async {
    await _storage.write(
      key: _recentSearchesKey,
      value: jsonEncode(searches),
    );
  }

  // 최근 검색어 가져오기
  Future<List<String>> getRecentSearches() async {
    final searchesStr = await _storage.read(key: _recentSearchesKey);
    if (searchesStr == null) return [];
    return List<String>.from(jsonDecode(searchesStr));
  }

  // 알림 설정 관련 메서드
  Future<bool?> get notificationEnabled async {
    final value = await _storage.read(key: _notificationEnabledKey);
    return value == 'true';
  }

  Future<void> saveNotificationEnabled(bool enabled) async {
    await _storage.write(
      key: _notificationEnabledKey,
      value: enabled.toString(),
    );
  }

  Future<bool?> get notificationSetupCompleted async {
    final value = await _storage.read(key: _notificationSetupCompletedKey);
    // return false;
    return value == 'true';
  }

  Future<void> saveNotificationSetupCompleted(bool completed) async {
    await _storage.write(
      key: _notificationSetupCompletedKey,
      value: completed.toString(),
    );
  }
}
