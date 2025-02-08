import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'providers/auth_provider.dart';

// 페이지 임포트
import 'pages/auth/login_page.dart';
import 'pages/auth/splash_page.dart';
import 'pages/home/home_page.dart';
import 'pages/board/board_list_page.dart';
import 'pages/board/board_detail_page.dart';
import 'pages/settings/settings_page.dart';

// 라우터 프로바이더 생성
final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: router, // 인증 상태 변경 감지
    redirect: router._redirectLogic, // 리다이렉트 로직
    routes: router._routes, // 라우트 설정
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('페이지를 찾을 수 없습니다: ${state.error}'),
      ),
    ),
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<User?>>(
      authStateProvider,
      (_, __) => notifyListeners(),
    );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final user = _ref.read(authStateProvider).value;
    final isLoggingIn = state.matchedLocation == '/login';

    // 스플래시 화면일 때는 리다이렉트하지 않음
    if (state.matchedLocation == '/splash') return null;

    // 로그인이 필요한 페이지 목록
    final needAuth = !state.matchedLocation.startsWith('/login') &&
        !state.matchedLocation.startsWith('/splash');

    // 로그인이 필요한 페이지인데 로그인이 안 되어있으면 로그인 페이지로
    if (needAuth && user == null) return '/login';

    // 이미 로그인되어 있는데 로그인 페이지에 접근하면 홈으로
    if (isLoggingIn && user != null) return '/home';

    return null;
  }

  List<RouteBase> get _routes => [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/board',
          builder: (context, state) => const BoardListPage(),
        ),
        GoRoute(
          path: '/board/:id',
          builder: (context, state) {
            final boardId = state.pathParameters['id']!;
            return BoardDetailPage(boardId: boardId);
          },
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
        ),
      ];
}
