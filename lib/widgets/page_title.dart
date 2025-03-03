import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool hasBackButton;

  const PageTitle({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
    this.hasBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    // 액션 버튼에 오른쪽 패딩 추가
    final List<Widget> wrappedActions = actions != null
        ? [
            ...actions!,
            // 오른쪽 여백 추가
            const SizedBox(width: 8),
          ]
        : [];

    final mainTextStyle = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
    final subTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
    );

    return AppBar(
      title: Text(
        title,
        style: hasBackButton ? subTextStyle : mainTextStyle,
      ),
      actions: wrappedActions,
      centerTitle: false,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.onSurface.withAlpha(200),
      bottom: bottom,
      titleSpacing: hasBackButton ? 0 : 20,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: hasBackButton,
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
