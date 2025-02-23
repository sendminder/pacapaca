import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pacapaca/services/auth_service.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/auth_dto.dart';
import 'package:logger/logger.dart';
part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  final _authService = GetIt.instance<AuthService>();
  final logger = GetIt.instance<Logger>();
  @override
  FutureOr<UserDTO?> build() {
    return _authService.currentUser;
  }

  Future<UserDTO?> getMe() async {
    state = const AsyncLoading();
    try {
      final user = await _authService.getMe(null);
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
      final user = await _authService.updateMe(
        RequestUpdateMe(nickname: nickname),
      );
      state = AsyncData(user);
      return user;
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return null;
    }
  }

  Future<UserDTO?> updateProfileType(String profileType) async {
    state = const AsyncLoading();
    try {
      final user = await _authService.updateMe(
        RequestUpdateMe(profileType: profileType),
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
      final user = await _authService.updateMe(
        RequestUpdateMe(badgeType: badgeType),
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
