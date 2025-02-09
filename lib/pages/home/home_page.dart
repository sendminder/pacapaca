import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              StatefulNavigationShell.of(context).goBranch(2);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, _) {
                final userAsyncValue = ref.watch(authStateProvider);

                return userAsyncValue.when(
                  data: (user) => user != null
                      ? Column(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              child: Icon(Icons.person, size: 40),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '안녕하세요, ${user.nickname ?? '사용자'}님!',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 32),
                          ],
                        )
                      : const Text('로그인이 필요합니다.'),
                  error: (error, _) => Text('오류가 발생했습니다: $error'),
                  loading: () => const CircularProgressIndicator(),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // StatefulNavigationShell을 찾아서 게시판 탭(인덱스 1)으로 이동
                StatefulNavigationShell.of(context).goBranch(1);
              },
              child: const Text('게시판으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
