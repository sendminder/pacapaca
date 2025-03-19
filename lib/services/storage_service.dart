import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // 보안 저장소에 저장할 키 (민감 정보)
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';

  // 일반 저장소에 저장할 키 (환경설정)
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
  static const String _guidelinesConfirmedKey = 'guidelines_confirmed';

  static String nullValue = 'null';

  final logger = GetIt.instance<Logger>();

  // SharedPreferences 인스턴스
  final SharedPreferences _prefs;

  // FlutterSecureStorage 인스턴스 (민감 정보용)
  final _secureStorage = const FlutterSecureStorage(
    iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
        synchronizable: false),
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  // 생성자에서 SharedPreferences 인스턴스 주입받음
  StorageService() : _prefs = GetIt.instance<SharedPreferences>();

  // 앱 설치 후 첫 실행 시 보안 저장소 데이터 초기화
  Future<void> checkFirstRun() async {
    try {
      final isFirstRun = _prefs.getBool(_firstRunKey) ?? true;

      if (isFirstRun) {
        logger.d('앱 첫 실행 감지: 보안 저장소 데이터 초기화');
        await _secureStorage.deleteAll();
        await _prefs.setBool(_firstRunKey, false);
      }
    } catch (e, stackTrace) {
      logger.e('첫 실행 확인 중 오류 발생', error: e, stackTrace: stackTrace);
    }
  }

  // ==================== 민감 정보 관련 메서드 (SecureStorage 사용) ====================

  // 토큰 읽기
  Future<String?> get accessToken => _secureStorage.read(key: _accessTokenKey);
  Future<String?> get refreshToken =>
      _secureStorage.read(key: _refreshTokenKey);

  // 사용자 정보 저장
  Future<void> saveUser(UserDTO user) async {
    try {
      await _secureStorage.write(
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
      // 1. 새 토큰 저장
      await _secureStorage.write(key: _accessTokenKey, value: accessToken);
      await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);

      logger.d('Tokens saved successfully');
    } catch (e, stackTrace) {
      logger.e('save tokens', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // 토큰 삭제
  Future<void> deleteTokens() async {
    if (await _secureStorage.containsKey(key: _accessTokenKey)) {
      await _secureStorage.write(key: _accessTokenKey, value: nullValue);
      logger.d('access token deleted');
    }
    if (await _secureStorage.containsKey(key: _refreshTokenKey)) {
      await _secureStorage.write(key: _refreshTokenKey, value: nullValue);
      logger.d('refresh token deleted');
    }
  }

  // 저장된 사용자 정보 가져오기
  Future<UserDTO?> get userData async {
    final userStr = await _secureStorage.read(key: _userKey);
    if (userStr == null) return null;
    return UserDTO.fromJson(jsonDecode(userStr));
  }

  // 사용자 정보 삭제
  Future<void> deleteUser() async {
    if (await _secureStorage.containsKey(key: _userKey)) {
      await _secureStorage.write(key: _userKey, value: nullValue);
    }
  }

  // ==================== 일반 환경설정 관련 메서드 (SharedPreferences 사용) ====================

  // 테마 저장
  Future<void> saveTheme(ThemeMode theme) async {
    await _prefs.setString(_themeKey, theme.toString());
  }

  // 테마 가져오기
  Future<ThemeMode?> get theme async {
    final themeStr = _prefs.getString(_themeKey) ?? 'system';
    return ThemeMode.values.firstWhere((e) => e.toString() == themeStr,
        orElse: () => ThemeMode.system);
  }

  // 언어 저장
  Future<void> saveLocale(Locale locale) async {
    await _prefs.setString(_localeKey, locale.languageCode);
  }

  // 언어 가져오기
  Future<Locale?> get locale async {
    final localeStr = _prefs.getString(_localeKey) ?? 'ko';
    return Locale(localeStr);
  }

  // 댓글 정렬 저장
  Future<void> saveCommentSort(String sort) async {
    await _prefs.setString(_commentSortKey, sort);
  }

  // 댓글 정렬 가져오기
  Future<String?> get commentSort async {
    return _prefs.getString(_commentSortKey) ?? 'ordest';
  }

  // 게시글 정렬 저장
  Future<void> saveArticleSort(String sort) async {
    await _prefs.setString(_articleSortKey, sort);
  }

  // 게시글 정렬 가져오기
  Future<String?> get articleSort async {
    return _prefs.getString(_articleSortKey) ?? 'latest';
  }

  // 게시글 카테고리 저장
  Future<void> saveArticleCategory(ArticleCategory category) async {
    await _prefs.setString(_articleCategoryKey, category.toString());
  }

  // 게시글 카테고리 가져오기
  Future<ArticleCategory?> get articleCategory async {
    final categoryStr = _prefs.getString(_articleCategoryKey) ?? 'daily';
    return ArticleCategory.values.firstWhere(
      (e) => e.toString() == categoryStr,
      orElse: () => ArticleCategory.daily,
    );
  }

  // 최근 검색어 저장
  Future<void> saveRecentSearches(List<String> searches) async {
    await _prefs.setString(_recentSearchesKey, jsonEncode(searches));
  }

  // 최근 검색어 가져오기
  Future<List<String>> getRecentSearches() async {
    final searchesStr = _prefs.getString(_recentSearchesKey) ?? '[]';
    return List<String>.from(jsonDecode(searchesStr));
  }

  // 알림 설정 관련 메서드
  Future<bool?> get notificationEnabled async {
    return _prefs.getBool(_notificationEnabledKey) ?? false;
  }

  Future<void> saveNotificationEnabled(bool enabled) async {
    await _prefs.setBool(_notificationEnabledKey, enabled);
  }

  Future<bool?> get notificationSetupCompleted async {
    return _prefs.getBool(_notificationSetupCompletedKey) ?? false;
  }

  Future<void> saveNotificationSetupCompleted(bool completed) async {
    await _prefs.setBool(_notificationSetupCompletedKey, completed);
  }

  Future<bool?> get guidelinesConfirmed async {
    return _prefs.getBool(_guidelinesConfirmedKey) ?? false;
  }

  Future<void> saveGuidelinesConfirmed(bool confirmed) async {
    await _prefs.setBool(_guidelinesConfirmedKey, confirmed);
  }
}
