import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 페이지 임포트
import 'pages/auth/login_page.dart';
import 'pages/auth/splash_page.dart';
import 'pages/home/home_page.dart';
import 'pages/board/board_list_page.dart';
import 'pages/board/board_detail_page.dart';
import 'pages/settings/settings_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    // 스플래시
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),

    // 인증
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),

    // 메인 화면들
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),

    // 게시판
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

    // 설정
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],

  // 에러 페이지
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('페이지를 찾을 수 없습니다: ${state.error}'),
    ),
  ),
);
