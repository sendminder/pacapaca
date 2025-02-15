import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentInput extends ConsumerStatefulWidget {
  final Future<void> Function(String content) onSubmit;

  const CommentInput({
    super.key,
    required this.onSubmit,
  });

  @override
  ConsumerState<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends ConsumerState<CommentInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: '댓글을 입력하세요',
              border: OutlineInputBorder(),
            ),
            maxLines: null,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () async {
            final content = _controller.text.trim();
            if (content.isEmpty) return;

            await widget.onSubmit(content);
            _controller.clear();
          },
        ),
      ],
    );
  }
}
