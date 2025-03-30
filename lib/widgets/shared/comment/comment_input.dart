import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/services/word_filter_service.dart';

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
            onSubmitted: (_) async {
              final content = _controller.text.trim();
              if (content.isEmpty) return;

              // 부적절한 단어 자동 필터링
              final filteredContent =
                  WordFilterService.instance.filter(content).filteredText;
              _controller.clear();
              await widget.onSubmit(filteredContent);
            },
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () async {
            final content = _controller.text.trim();
            if (content.isEmpty) return;

            // 부적절한 단어 자동 필터링
            final filteredContent =
                WordFilterService.instance.filter(content).filteredText;
            _controller.clear();
            await widget.onSubmit(filteredContent);
          },
        ),
      ],
    );
  }
}
