import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

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
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'comment.hint'.tr(),
              border: const OutlineInputBorder(),
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
