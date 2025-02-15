import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommentEditDialog extends StatefulWidget {
  final String initialContent;

  const CommentEditDialog({
    super.key,
    required this.initialContent,
  });

  @override
  State<CommentEditDialog> createState() => _CommentEditDialogState();
}

class _CommentEditDialogState extends State<CommentEditDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialContent);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('댓글 수정'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: '댓글을 입력하세요',
          border: OutlineInputBorder(),
        ),
        maxLines: null,
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text('취소'),
        ),
        TextButton(
          onPressed: () {
            final content = _controller.text.trim();
            if (content.isNotEmpty) {
              context.pop(content);
            }
          },
          child: const Text('수정'),
        ),
      ],
    );
  }
}
