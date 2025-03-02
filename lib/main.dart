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
import 'package:pacapaca/services/article_service.dart';
import 'package:pacapaca/services/dio_service.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:pacapaca/messages/ko_messages.dart';
import 'package:pacapaca/services/block_service.dart';
import 'package:pacapaca/services/report_service.dart';
import 'package:pacapaca/services/carrot_service.dart';
import 'package:pacapaca/services/point_service.dart';
import 'package:pacapaca/services/comment_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pacapaca/services/paca_helper_service.dart';
import 'package:pacapaca/services/payment_service.dart';
import 'package:pacapaca/services/product_service.dart';
import 'package:pacapaca/services/user_service.dart';
import 'package:pacapaca/services/in_app_purchase_service.dart';
import 'package:pacapaca/services/notification_service.dart';

void main() async {
  // 앱 초기화
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();

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

  // timeago 한국어 설정
  timeago.setLocaleMessages('ko', KoMessages());
  timeago.setDefaultLocale('ko');
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

  // 핵심 서비스는 즉시 초기화
  getIt.registerSingleton<StorageService>(StorageService());
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<UserService>(UserService());
  getIt.registerSingleton<DioService>(DioService());

  // 나머지 서비스는 필요할 때 초기화
  getIt.registerLazySingleton(() => ArticleService());
  getIt.registerLazySingleton(() => BlockService());
  getIt.registerLazySingleton(() => ReportService());
  getIt.registerLazySingleton(() => CarrotService());
  getIt.registerLazySingleton(() => PointService());
  getIt.registerLazySingleton(() => CommentService());
  getIt.registerLazySingleton(() => PacaHelperService());
  getIt.registerLazySingleton(() => PaymentService());
  getIt.registerLazySingleton(() => ProductService());
  getIt.registerLazySingleton(() => InAppPurchaseService());
  getIt.registerLazySingleton(() => NotificationService());
}
