import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title'.tr()),
        backgroundColor: Theme.of(context).colorScheme.surface,
        scrolledUnderElevation: 0,
        surfaceTintColor: null,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('settings.profile'.tr()),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('settings.notifications'.tr()),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text('settings.language'.tr()),
            trailing: DropdownButton<String>(
              value: locale.languageCode,
              items: const [
                DropdownMenuItem(
                  value: 'ko',
                  child: Text('한국어'),
                ),
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
              ],
              onChanged: (String? newLocale) {
                if (newLocale != null) {
                  context.setLocale(Locale(newLocale));
                  ref
                      .read(localeProvider.notifier)
                      .setLocale(Locale(newLocale));
                }
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: Text('settings.theme'.tr()),
            trailing: DropdownButton<ThemeMode>(
              value: themeMode,
              items: [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('settings.system'.tr()),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('settings.light'.tr()),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('settings.dark'.tr()),
                ),
              ],
              onChanged: (ThemeMode? newTheme) {
                if (newTheme != null) {
                  ref.read(themeProvider.notifier).setTheme(newTheme);
                }
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              'settings.logout'.tr(),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('settings.logout'.tr()),
                  content: Text('settings.logout_confirm'.tr()),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text('settings.cancel'.tr()),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(
                        'settings.logout'.tr(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                // 로그아웃 처리
                await ref.read(authServiceProvider).signOut();
                if (context.mounted) {
                  context.go('/login'); // 로그인 페이지로 이동
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
