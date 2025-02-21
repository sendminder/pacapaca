import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/auth_provider.dart';
import 'models/dto/user_dto.dart';
// 페이지 임포트
import 'pages/auth/login_page.dart';
import 'pages/auth/splash_page.dart';
import 'pages/article/article_detail_page.dart';
import 'pages/settings/settings_page.dart';
import 'pages/auth/set_nickname_page.dart';
import 'widgets/shell_scaffold.dart';
import 'pages/article/article_list_page.dart';
import 'pages/article/article_create_page.dart';
import 'pages/article/article_ai_helper_page.dart';
import 'pages/search/search_page.dart';
import 'pages/ranking/ranking_page.dart';
import 'pages/profile/profile_page.dart';
import 'pages/settings/blocked_users_page.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';

// 라우터 프로바이더 생성
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/splash',
    navigatorKey: _rootNavigatorKey,
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
  final logger = GetIt.instance<Logger>();
  AsyncValue<UserDTO?> _lastKnownState = const AsyncValue.loading();

  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<UserDTO?>>(
      authProvider,
      (previous, current) {
        logger.d('----> authStateProvider $previous -> $current');
        _lastKnownState = current; // 캐시된 상태 업데이트
        notifyListeners();
      },
    );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    return _lastKnownState.when(
      data: (user) {
        logger.d('Redirect logic with user: $user');

        if (state.matchedLocation == '/splash') return null;

        final isLoggingIn = state.matchedLocation == '/login';
        final isSettingNickname = state.matchedLocation == '/set-nickname';
        final needAuth = !state.matchedLocation.startsWith('/login') &&
            !state.matchedLocation.startsWith('/splash');

        if (needAuth && user == null) return '/login';

        if (isLoggingIn && user != null) {
          if (user.nickname.isEmpty) {
            return '/set-nickname';
          }
          return '/articles';
        }

        if (user != null && user.nickname.isEmpty && !isSettingNickname) {
          return '/set-nickname';
        }

        if (isSettingNickname && user != null && user.nickname.isNotEmpty) {
          return '/articles';
        }

        return null;
      },
      loading: () => null, // 로딩 중에는 리다이렉트하지 않음
      error: (_, __) => '/login', // 에러 발생 시 로그인 페이지로
    );
  }

  final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell/home');
  final _shellNavigatorBoardKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell/articles');
  final _shellNavigatorSearchKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell/search');
  final _shellNavigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell/profile');

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
          pageBuilder: (context, state) {
            // extra 데이터에서 title과 content 추출
            final Map<String, String>? extra =
                state.extra as Map<String, String>?;

            return CustomTransitionPage(
              key: state.pageKey,
              child: ArticleCreatePage(
                initialTitle: extra?['title'],
                initialContent: extra?['content'],
              ),
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
            );
          },
        ),
        GoRoute(
          path: '/articles/ai-helper',
          builder: (context, state) => const ArticleAiHelperPage(),
        ),
        GoRoute(
          path: '/settings',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: '/settings/blocked-users',
          builder: (context, state) => const BlockedUsersPage(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ShellScaffold(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorBoardKey,
              routes: [
                GoRoute(
                  path: '/articles',
                  builder: (context, state) => const ArticleListPage(),
                  routes: [
                    GoRoute(
                      path: ':id',
                      parentNavigatorKey: _rootNavigatorKey,
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
              navigatorKey: _shellNavigatorSearchKey,
              routes: [
                GoRoute(
                  path: '/search',
                  builder: (context, state) => const SearchPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorHomeKey,
              routes: [
                GoRoute(
                  path: '/ranking',
                  builder: (context, state) => const RankingPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorProfileKey,
              routes: [
                GoRoute(
                  path: '/profile',
                  builder: (context, state) => const ProfilePage(),
                ),
              ],
            ),
          ],
        ),
      ];
}
