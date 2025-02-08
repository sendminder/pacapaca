import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoardListPage extends StatelessWidget {
  const BoardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('게시판')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('게시글 ${index + 1}'),
            onTap: () => context.go('/board/$index'),
          );
        },
      ),
    );
  }
}
