import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'constants/theme.dart';
import 'router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'app_name'.tr(),
      debugShowCheckedModeBanner: false,

      // 라우터 설정
      routerConfig: appRouter,

      // 테마 설정
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      // 다국어 설정
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
