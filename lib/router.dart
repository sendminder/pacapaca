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
import 'pages/article/article_edit_page.dart';
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
import 'package:pacapaca/pages/store/store_page.dart';
import 'package:pacapaca/pages/payment/payment_history_page.dart';
import 'pages/user/user_detail_page.dart';
import 'pages/auth/notification_permission_page.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'pages/notification/notification_page.dart';
import 'pages/carrot/carrot_history_page.dart';
import 'pages/point/point_history_page.dart';
import 'pages/article/user_posts_page.dart';
import 'pages/article/liked_posts_page.dart';
import 'package:pacapaca/providers/article_provider.dart';
import 'package:pacapaca/providers/comment_provider.dart';
import 'pages/article/deleted_article_page.dart';
import 'package:pacapaca/services/article_service.dart';
import 'pages/guidelines/community_guidelines_page.dart';
import 'pages/auth/update_page.dart';
import 'pages/auth/force_update_page.dart';
import 'services/storage_service.dart';

// 라우터 프로바이더 생성
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/splash',
    navigatorKey: _rootNavigatorKey,
    refreshListenable: router,
    redirect: router._redirectLogic,
    routes: router._routes,
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
  final _articleService = GetIt.instance<ArticleService>();
  final _storageService = GetIt.instance<StorageService>();

  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<UserDTO?>>(
      authProvider,
      (previous, current) {
        if (_lastKnownState != current) {
          // 변경된 경우에만 캐시된 상태 업데이트
          _lastKnownState = current;
          notifyListeners();
        }
      },
    );
  }

  // 게시글 삭제 여부를 확인하는 함수
  Widget _checkArticleExists({
    required BuildContext context,
    required int articleId,
    required Widget Function() buildWidget,
  }) {
    return FutureBuilder(
      future: _articleService.getArticle(articleId),
      builder: (context, snapshot) {
        // 에러가 발생한 경우 또는 게시글이 없는 경우
        if (snapshot.connectionState != ConnectionState.waiting &&
            (snapshot.hasError || snapshot.data == null)) {
          return const DeletedArticlePage();
        }

        // 로딩 중이거나 게시글이 존재하는 경우 요청한 위젯 표시
        final widget = buildWidget();

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Stack(
            children: [
              widget,
            ],
          );
        }

        return widget;
      },
    );
  }

  Future<String?> _redirectLogic(
      BuildContext context, GoRouterState state) async {
    final bool isFirstLaunch = _storageService.isFirstLaunch;
    if (isFirstLaunch) {
      _storageService.saveIsFirstLaunch(false);
    }

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

        // 알림 설정 완료 여부 확인
        final notificationSetupCompleted =
            _ref.read(notificationSetupCompletedProvider);
        if (!notificationSetupCompleted) {
          return state.matchedLocation == '/notification-setup'
              ? null
              : '/notification-setup';
        }

        // 가이드라인 확인 여부 체크
        final guidelinesConfirmed = _ref.read(guidelinesConfirmedProvider);
        if (!guidelinesConfirmed) {
          return state.matchedLocation == '/guidelines' ? null : '/guidelines';
        }

        if (user.forceUpdated == true) {
          return '/force-update';
        }

        if (user.needUpdated == true) {
          // 앱 최초 실행 시에는 업데이트 페이지를 보여주지 않음
          if (!isFirstLaunch) {
            return '/update';
          }
        }

        // 모든 정보가 설정된 경우
        if (state.matchedLocation == '/login' ||
            state.matchedLocation == '/set-nickname' ||
            state.matchedLocation == '/set-profile-type' ||
            state.matchedLocation == '/notification-setup' ||
            state.matchedLocation == '/guidelines') {
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
          path: '/guidelines',
          builder: (context, state) => const CommunityGuidelinesPage(),
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
          path: '/notification-setup',
          builder: (context, state) => const NotificationPermissionPage(),
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
          path: '/articles/deleted',
          builder: (context, state) => const DeletedArticlePage(),
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
        GoRoute(
          path: '/settings/guidelines',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const CommunityGuidelinesPage(),
        ),
        GoRoute(
          path: '/store',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const StorePage(),
        ),
        GoRoute(
          path: '/payment-history',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const PaymentHistoryPage(),
        ),
        GoRoute(
          path: '/users/:userId',
          builder: (context, state) {
            final userId = int.parse(state.pathParameters['userId']!);
            return UserDetailPage(userId: userId);
          },
        ),
        GoRoute(
          path: '/notifications',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const NotificationPage(),
        ),
        GoRoute(
          path: '/carrot-history',
          builder: (context, state) => const CarrotHistoryPage(),
        ),
        GoRoute(
          path: '/point-history',
          builder: (context, state) => const PointHistoryPage(),
        ),
        GoRoute(
          path: '/tag-search',
          parentNavigatorKey: _rootNavigatorKey, // 루트 네비게이터 사용
          builder: (context, state) {
            final Map<String, dynamic>? extra =
                state.extra as Map<String, dynamic>?;
            final String? searchQuery = extra?['searchQuery'] as String?;

            return SearchPage(
              initialSearchQuery: searchQuery,
              isTagSearch: true,
            );
          },
        ),
        GoRoute(
          path: '/update',
          builder: (context, state) => UpdatePage(
            onSkip: () => context.go('/articles'),
          ),
        ),
        GoRoute(
          path: '/force-update',
          builder: (context, state) => const ForceUpdatePage(),
        ),
        GoRoute(
          path: '/user-posts/:userId',
          builder: (context, state) {
            final userId = int.parse(state.pathParameters['userId']!);
            return UserPostsPage(userId: userId);
          },
        ),
        GoRoute(
          path: '/liked-posts/:userId',
          builder: (context, state) {
            final userId = int.parse(state.pathParameters['userId']!);
            return LikedPostsPage(userId: userId);
          },
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
                        final id = int.parse(state.pathParameters['id']!);
                        final fromNotification =
                            state.uri.queryParameters['from'] == 'notification';

                        if (fromNotification) {
                          // 푸시 알림에서 왔을 때 데이터 새로고침
                          final container = ProviderScope.containerOf(context);
                          container.invalidate(articleProvider(id));
                          container.invalidate(commentListProvider(id));

                          return _checkArticleExists(
                            context: context,
                            articleId: id,
                            buildWidget: () => ArticleDetailPage(articleId: id),
                          );
                        }

                        return ArticleDetailPage(articleId: id);
                      },
                    ),
                    GoRoute(
                      path: ':id/edit',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (context, state) {
                        final id = int.parse(state.pathParameters['id']!);

                        return _checkArticleExists(
                          context: context,
                          articleId: id,
                          buildWidget: () => ArticleEditPage(articleId: id),
                        );
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

                        final fromNotification =
                            state.uri.queryParameters['from'] == 'notification';

                        if (fromNotification) {
                          return _checkArticleExists(
                            context: context,
                            articleId: articleId,
                            buildWidget: () {
                              return CommentRepliesPage(
                                articleId: articleId,
                                commentId: commentId,
                                articleUserId: articleUserId,
                              );
                            },
                          );
                        }

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
                  builder: (context, state) {
                    return SearchPage(
                      isTagSearch: false,
                    );
                  },
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
