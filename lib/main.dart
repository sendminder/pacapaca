import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pacapaca/services/storage_service.dart';
import 'package:pacapaca/services/auth_service.dart';

void main() async {
  // 앱 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // 설정 초기화
  await _initializeSettings();

  // 앱 실행
  runApp(
    ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('en'), Locale('ko')],
        fallbackLocale: const Locale('ko'),
        useFallbackTranslations: true,
        child: ScreenUtilInit(
          designSize: const Size(393, 852), // iPhone 16 Pro 기준
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => const MyApp(),
        ),
      ),
    ),
  );
}

Future<void> _initializeSettings() async {
  // 환경 변수 로드
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 서비스 로케이터 설정
  _setupServiceLocator();

  // 다국어 지원 초기화
  await EasyLocalization.ensureInitialized();

  // 시간대 설정
  await setupTimeZone();
}

Future<void> setupTimeZone() async {
  tz.initializeTimeZones();
  String timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

void _setupServiceLocator() {
  final getIt = GetIt.instance;

  // 로거 등록
  getIt.registerSingleton<Logger>(
    Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
      ),
    ),
  );

  getIt.registerSingleton<StorageService>(StorageService());
  getIt.registerSingleton<AuthService>(AuthService());
}
