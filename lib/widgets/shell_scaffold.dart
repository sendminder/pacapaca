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
              size: 28,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[400]
                  : Colors.grey[600],
            ),
            selectedIcon: Icon(
              Icons.article,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'nav.articles'.tr(),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search_outlined,
              size: 28,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[400]
                  : Colors.grey[600],
            ),
            selectedIcon: Icon(
              Icons.search,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'nav.search'.tr(),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.emoji_events_outlined,
              size: 28,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[400]
                  : Colors.grey[600],
            ),
            selectedIcon: Icon(
              Icons.emoji_events,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'nav.ranking'.tr(),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              size: 28,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[400]
                  : Colors.grey[600],
            ),
            selectedIcon: Icon(
              Icons.person,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: 'nav.profile'.tr(),
          ),
        ],
      ),
    );
  }
}
