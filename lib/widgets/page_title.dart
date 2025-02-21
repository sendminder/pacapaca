import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? trailing;
  final Widget? bottom;
  final double height;
  final EdgeInsetsGeometry padding;

  const PageTitle({
    super.key,
    required this.title,
    this.trailing,
    this.bottom,
    this.height = 120,
    this.padding = const EdgeInsets.fromLTRB(20, 8, 20, 12),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      title: SizedBox(
        height: height,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: padding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    if (trailing != null) trailing!,
                  ],
                ),
              ),
            ),
            if (bottom != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: bottom!,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
