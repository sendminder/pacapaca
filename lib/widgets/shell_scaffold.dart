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
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(index);
        },
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home), label: 'home.title'.tr()),
          NavigationDestination(
              icon: Icon(Icons.list), label: 'article.title'.tr()),
          NavigationDestination(
              icon: Icon(Icons.settings), label: 'settings.title'.tr()),
        ],
      ),
    );
  }
}
