import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/providers/auth_provider.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/services/notification_manager_service.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pacapaca/constants/link.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pacapaca/widgets/shared/dialogs/confirmation_dialog.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);
    final notificationEnabled = ref.watch(notificationEnabledProvider);
    final notificationManager = GetIt.instance<NotificationManagerService>();
    final divider = Divider(
      color: Theme.of(context).colorScheme.onSurface.withAlpha(15),
      height: 1,
    );
    final appVersion = ref.watch(appVersionProvider);

    return Scaffold(
      appBar: PageTitle(
        title: 'settings.title'.tr(),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('settings.notifications'.tr()),
            trailing: Switch(
              value: notificationEnabled,
              onChanged: (value) async {
                if (value) {
                  // 알림 활성화
                  final result = await notificationManager
                      .requestPermissionAndRegisterToken();

                  switch (result) {
                    case NotificationPermissionResult.granted:
                      ref
                          .read(notificationEnabledProvider.notifier)
                          .setNotificationEnabled(true);
                      ref
                          .read(authProvider.notifier)
                          .updateNotificationEnabled(true);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('settings.notifications_enabled'.tr()),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                      break;
                    case NotificationPermissionResult.denied:
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'settings.notifications_permission_denied'
                                    .tr()),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                      break;
                    case NotificationPermissionResult.error:
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('settings.notifications_error'.tr()),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                      break;
                  }
                } else {
                  // 알림 비활성화
                  await notificationManager.disableNotifications();
                  ref
                      .read(notificationEnabledProvider.notifier)
                      .setNotificationEnabled(false);
                  ref
                      .read(authProvider.notifier)
                      .updateNotificationEnabled(false);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('settings.notifications_disabled'.tr()),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                }
              },
            ),
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
                  ref.read(authProvider.notifier).updateLanguage(newLocale);
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
          divider,
          ListTile(
            leading: const Icon(Icons.people_outline_rounded),
            title: Text('settings.community_guidelines'.tr()),
            onTap: () {
              context.push('/settings/guidelines');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_rounded),
            title: Text('settings.personal_info'.tr()),
            onTap: () {
              launchUrl(Uri.parse(PacapacaLink.personalInfoLink));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: Text('settings.terms_of_service'.tr()),
            onTap: () {
              launchUrl(Uri.parse(PacapacaLink.termsOfServiceLink));
            },
          ),
          divider,
          ListTile(
            leading: const Icon(Icons.block),
            title: Text('settings.blocked_users'.tr()),
            onTap: () {
              context.push('/settings/blocked-users');
            },
          ),
          ListTile(
            leading: const Icon(Icons.perm_device_information_rounded),
            title: Text('settings.app_version'.tr()),
            trailing: Text(
              appVersion,
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
              ),
            ),
          ),
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
                builder: (context) => ConfirmationDialog(
                  title: 'settings.logout'.tr(),
                  content: 'settings.logout_confirm'.tr(),
                  cancelText: 'settings.cancel'.tr(),
                  confirmText: 'settings.logout'.tr(),
                  isDanger: true,
                ),
              );

              if (confirmed == true) {
                // 로그아웃 처리
                await ref.read(authProvider.notifier).signOut();
                if (context.mounted) {
                  context.go('/login'); // 로그인 페이지로 이동
                }
              }
            },
          ),
          // 개발 모드에서만 보이는 리셋 버튼
          if (const bool.fromEnvironment('dart.vm.product') == false)
            ListTile(
              title: const Text('Reset All Settings (Dev only)'),
              leading: const Icon(Icons.restore),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                if (context.mounted) {
                  context.go('/splash');
                }
              },
            ),
        ],
      ),
    );
  }
}
