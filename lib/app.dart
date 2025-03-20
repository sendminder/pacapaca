import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'constants/theme.dart';
import 'router.dart';
import 'providers/settings_provider.dart';
import 'widgets/common/user_block_notice.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    // 현재 언어에 맞게 timeago 기본 언어 설정
    final currentLocale = context.locale.languageCode;
    if (['ko', 'en'].contains(currentLocale)) {
      timeago.setDefaultLocale(currentLocale);
    } else {
      timeago.setDefaultLocale('ko'); // 지원하지 않는 언어인 경우 기본값
    }

    return Stack(
      children: [
        MaterialApp.router(
          title: 'app_name'.tr(),
          debugShowCheckedModeBanner: false,

          // 라우터 설정
          routerConfig: router,

          // 테마 설정
          themeMode: themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,

          // 다국어 설정
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
        // 사용자 차단 상태에 따라 제재 메시지 표시
        const UserBlockNotice(),
      ],
    );
  }
}
