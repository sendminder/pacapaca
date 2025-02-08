import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

part 'auth_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService();
}

@riverpod
Stream<User?> authState(AuthStateRef ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
}

@riverpod
class Auth extends _$Auth {
  @override
  FutureOr<void> build() => null;

  Future<void> signInWithApple() async {
    state = const AsyncLoading();
    try {
      final authService = ref.read(authServiceProvider);
      await authService.signInWithApple();
      state = const AsyncData(null);
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
