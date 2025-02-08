import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/auth_service.dart';
import '../models/dto/user_dto.dart';

part 'auth_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService();
}

@riverpod
Stream<UserDTO?> authState(AuthStateRef ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
}

@riverpod
class Auth extends _$Auth {
  @override
  FutureOr<UserDTO?> build() {
    final authService = ref.watch(authServiceProvider);
    return authService.currentUser;
  }

  Future<void> signInWithApple() async {
    state = const AsyncLoading();
    try {
      final authService = ref.read(authServiceProvider);
      final user = await authService.signInWithApple();
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    try {
      final authService = ref.read(authServiceProvider);
      await authService.signOut();
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
