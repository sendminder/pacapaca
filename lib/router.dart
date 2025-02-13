import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/auth_provider.dart';
import 'models/dto/user_dto.dart';
// 페이지 임포트
import 'pages/auth/login_page.dart';
import 'pages/auth/splash_page.dart';
import 'pages/home/home_page.dart';
import 'pages/article/article_detail_page.dart';
import 'pages/settings/settings_page.dart';
import 'pages/auth/set_nickname_page.dart';
import 'widgets/shell_scaffold.dart';
import 'pages/article/article_list_page.dart';
import 'pages/article/article_create_page.dart';

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
    _ref.listen<AsyncValue<UserDTO?>>(
      authStateProvider,
      (_, __) => notifyListeners(),
    );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final user = _ref.read(authStateProvider).value;
    final isLoggingIn = state.matchedLocation == '/login';
    final isSettingNickname = state.matchedLocation == '/set-nickname';

    // 스플래시 화면일 때는 리다이렉트하지 않음
    if (state.matchedLocation == '/splash') return null;

    // 로그인이 필요한 페이지 목록
    final needAuth = !state.matchedLocation.startsWith('/login') &&
        !state.matchedLocation.startsWith('/splash');

    // 로그인이 필요한 페이지인데 로그인이 안 되어있으면 로그인 페이지로
    if (needAuth && user == null) return '/login';

    // 이미 로그인되어 있는데 로그인 페이지에 접근하면 홈으로
    if (isLoggingIn && user != null) {
      // 닉네임이 없으면 닉네임 설정 페이지로
      if (user.nickname == null || user.nickname!.isEmpty) {
        return '/set-nickname';
      }
      return '/home';
    }

    // 닉네임이 없고 닉네임 설정 페이지가 아니면 닉네임 설정 페이지로
    if (user != null &&
        (user.nickname == null || user.nickname!.isEmpty) &&
        !isSettingNickname) {
      return '/set-nickname';
    }

    // 닉네임이 있는데 닉네임 설정 페이지에 접근하면 홈으로
    if (isSettingNickname &&
        user != null &&
        user.nickname != null &&
        user.nickname!.isNotEmpty) {
      return '/home';
    }

    return null;
  }

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell/home');
  final _shellNavigatorBoardKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell/articles');
  final _shellNavigatorSettingsKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell/settings');

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
          path: '/set-nickname',
          builder: (context, state) => const SetNicknamePage(),
        ),
        GoRoute(
          path: '/articles/new',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ArticleCreatePage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: child,
              );
            },
          ),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ShellScaffold(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorHomeKey,
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) => const HomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorBoardKey,
              routes: [
                GoRoute(
                  path: '/articles',
                  builder: (context, state) => const ArticleListPage(),
                  routes: [
                    GoRoute(
                      path: ':id',
                      parentNavigatorKey: _shellNavigatorBoardKey,
                      builder: (context, state) {
                        final articleId =
                            int.parse(state.pathParameters['id']!);
                        return ArticleDetailPage(articleId: articleId);
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorSettingsKey,
              routes: [
                GoRoute(
                  path: '/settings',
                  builder: (context, state) => const SettingsPage(),
                ),
              ],
            ),
          ],
        ),
      ];
}
