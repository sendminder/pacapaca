import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  GetIt.I.registerSingleton<Logger>(Logger());

  runApp(
    ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('en'), Locale('ko')],
        fallbackLocale: const Locale('ko'),
        useFallbackTranslations: true,
        child: const MyApp(),
      ),
    ),
  );
}
