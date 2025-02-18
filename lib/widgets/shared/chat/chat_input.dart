import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onSubmit;
  final String hintText;
  final bool canSend;

  const ChatInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSubmit,
    required this.hintText,
    required this.canSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 36,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surface,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                maxLines: null,
                textInputAction: TextInputAction.send,
                onSubmitted: canSend ? (_) => onSubmit(controller.text) : null,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: canSend
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surface,
              ),
              child: IconButton(
                onPressed: canSend ? () => onSubmit(controller.text) : null,
                icon: const Icon(Icons.send_rounded),
                color: canSend
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
