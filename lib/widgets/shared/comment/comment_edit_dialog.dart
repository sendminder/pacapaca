import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

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
      title: Text('comment.edit_comment'.tr()),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'comment.hint'.tr(),
          border: const OutlineInputBorder(),
        ),
        maxLines: null,
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text('comment.cancel'.tr()),
        ),
        TextButton(
          onPressed: () {
            final content = _controller.text.trim();
            if (content.isNotEmpty) {
              context.pop(content);
            }
          },
          child: Text('comment.edit'.tr()),
        ),
      ],
    );
  }
}
