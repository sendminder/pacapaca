import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final bool isDanger;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.cancelText,
    required this.confirmText,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          style: TextButton.styleFrom(
            foregroundColor:
                isDanger ? colorScheme.secondary : colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(cancelText),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          style: FilledButton.styleFrom(
            backgroundColor: isDanger ? colorScheme.error : colorScheme.primary,
            foregroundColor: isDanger ? Colors.white : colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(confirmText),
        ),
      ],
      actionsPadding: const EdgeInsets.all(16),
    );
  }
}
