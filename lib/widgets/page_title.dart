import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const PageTitle({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
      actions: actions,
      centerTitle: false,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.onSurface.withAlpha(200),
      bottom: bottom,
      titleSpacing: 20,
    );
  }

  @override
  Size get preferredSize {
    // bottom이 null이 아닌 경우 해당 높이를 더하고, null인 경우 0.0을 사용
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    // toolbarHeight가 null이 아닌 경우 해당 값을 사용하고, null인 경우 kToolbarHeight 사용
    final appBarHeight = kToolbarHeight;

    return Size.fromHeight(appBarHeight + bottomHeight);
  }
}
