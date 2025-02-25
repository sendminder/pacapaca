import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/pages/auth/set_profile_type_page.dart';
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
import 'pages/ranking/ranking_detail_page.dart';
import 'pages/ranking/ranking_type.dart';
import 'package:pacapaca/pages/article/comment_replies_page.dart';

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
        if (_lastKnownState != current) {
          // 변경된 경우에만 캐시된 상태 업데이트
          _lastKnownState = current;
          notifyListeners();
        }
      },
    );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    return _lastKnownState.when(
      data: (user) {
        logger.d(
            'Redirect logic with user: $user, current location: ${state.matchedLocation}');

        // 스플래시 페이지는 항상 허용
        if (state.matchedLocation == '/splash') return null;

        // 로그인되지 않은 경우
        if (user == null) {
          return state.matchedLocation == '/login' ? null : '/login';
        }

        // 로그인된 경우의 리다이렉션 로직
        if (user.displayUser.nickname.isEmpty) {
          return state.matchedLocation == '/set-nickname'
              ? null
              : '/set-nickname';
        }

        if (user.displayUser.profileType == null) {
          return state.matchedLocation == '/set-profile-type'
              ? null
              : '/set-profile-type';
        }

        // 모든 정보가 설정된 경우
        if (state.matchedLocation == '/login' ||
            state.matchedLocation == '/set-nickname' ||
            state.matchedLocation == '/set-profile-type') {
          return '/articles';
        }

        // 그 외의 경우는 현재 위치 유지
        return null;
      },
      loading: () => null,
      error: (_, __) => '/login',
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
          path: '/set-profile-type',
          builder: (context, state) => SetProfileTypePage(),
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
                    GoRoute(
                      path: ':id/comment/:parentId/replies/:articleUserId',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (context, state) {
                        final articleId =
                            int.parse(state.pathParameters['id']!);
                        final commentId =
                            int.parse(state.pathParameters['parentId']!);
                        final articleUserId =
                            int.parse(state.pathParameters['articleUserId']!);
                        return CommentRepliesPage(
                          articleId: articleId,
                          commentId: commentId,
                          articleUserId: articleUserId,
                        );
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
                  routes: [
                    GoRoute(
                      path: ':type',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (context, state) => RankingDetailPage(
                        title: state.extra as String,
                        type: RankingType
                            .values[int.parse(state.pathParameters['type']!)],
                      ),
                    ),
                  ],
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
