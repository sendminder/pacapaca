import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class ShellScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ShellScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        height: 65,
        backgroundColor: Theme.of(context).colorScheme.surface,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: navigationShell.currentIndex,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (index) {
          navigationShell.goBranch(index);
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.article_outlined,
              size: 24,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[400]
                  : Colors.grey[600],
            ),
            selectedIcon: Icon(
              Icons.article,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'nav.articles'.tr(),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.calendar_today_outlined,
              size: 22,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[400]
                  : Colors.grey[600],
            ),
            selectedIcon: Icon(
              Icons.calendar_today_rounded,
              size: 22,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'nav.calendar'.tr(),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.chat_bubble_outline,
              size: 22,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[400]
                  : Colors.grey[600],
            ),
            selectedIcon: Icon(
              Icons.chat_bubble_rounded,
              size: 22,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'nav.chat'.tr(),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              size: 24,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[400]
                  : Colors.grey[600],
            ),
            selectedIcon: Icon(
              Icons.person,
              size: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'nav.profile'.tr(),
          ),
        ],
      ),
    );
  }
}
