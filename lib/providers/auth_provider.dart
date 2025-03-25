import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pacapaca/services/auth_service.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/auth_dto.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'dart:io' show Platform;
part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  final _authService = GetIt.instance<AuthService>();
  @override
  FutureOr<UserDTO?> build() {
    return _authService.currentUser;
  }

  Future<UserDTO?> getMe(String? appVersion) async {
    state = const AsyncLoading();
    try {
      final user = await _authService.getMe(null, appVersion);
      state = AsyncData(user);
      return user;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }

  Future<UserDTO?> signInWithApple() async {
    state = const AsyncLoading();
    try {
      final user = await _authService.signInWithApple();
      state = AsyncData(user);
      return user;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    try {
      await _authService.signOut();
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<UserDTO?> updateNickname(String nickname) async {
    state = const AsyncLoading();
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';
      final language = ref.read(localeProvider).languageCode;
      final user = await _authService.updateMe(
        RequestUpdateMe(
          nickname: nickname,
          platform: platform,
          language: language,
        ),
      );
      state = AsyncData(user);
      return user;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }

  Future<UserDTO?> updateLanguage(String language) async {
    state = const AsyncLoading();
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';
      final user = await _authService.updateMe(
        RequestUpdateMe(language: language, platform: platform),
      );
      state = AsyncData(user);
      return user;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }

  /// 닉네임 중복 체크
  Future<bool> checkNicknameExists(String nickname) async {
    try {
      return await _authService.checkNicknameExists(nickname);
    } catch (e) {
      throw e;
    }
  }

  Future<UserDTO?> updateProfileType(String profileType) async {
    state = const AsyncLoading();
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';
      final user = await _authService.updateMe(
        RequestUpdateMe(profileType: profileType, platform: platform),
      );
      state = AsyncData(user);
      return user;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }

  Future<UserDTO?> updateBadgeType(String badgeType) async {
    state = const AsyncLoading();
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';
      final user = await _authService.updateMe(
        RequestUpdateMe(badgeType: badgeType, platform: platform),
      );
      state = AsyncData(user);
      return user;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }

  Future<UserDTO?> updateNotificationEnabled(bool enabled) async {
    state = const AsyncLoading();
    try {
      final platform = Platform.isAndroid ? 'android' : 'ios';
      final user = await _authService.updateMe(
        RequestUpdateMe(notificationEnabled: enabled, platform: platform),
      );
      state = AsyncData(user);
      return user;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }

  Future<UserDTO?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    try {
      final user = await _authService.signInWithEmail(
        email: email,
        password: password,
      );
      state = AsyncData(user);
      return user;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }
}
