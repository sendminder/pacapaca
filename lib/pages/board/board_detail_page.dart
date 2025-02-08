import 'package:flutter/material.dart';

class BoardDetailPage extends StatelessWidget {
  final String boardId;

  const BoardDetailPage({
    super.key,
    required this.boardId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('게시글 상세')),
      body: Center(
        child: Text('게시글 ID: $boardId의 상세 내용'),
      ),
    );
  }
}
