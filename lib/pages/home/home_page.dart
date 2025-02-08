import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
