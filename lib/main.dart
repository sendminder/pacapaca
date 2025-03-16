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
import 'package:pacapaca/messages/en_messages.dart';
import 'package:pacapaca/services/block_service.dart';
import 'package:pacapaca/services/report_service.dart';
import 'package:pacapaca/services/carrot_service.dart';
import 'package:pacapaca/services/point_service.dart';
import 'package:pacapaca/services/comment_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pacapaca/services/paca_helper_service.dart';
import 'package:pacapaca/services/payment_service.dart';
import 'package:pacapaca/services/user_service.dart';
import 'package:pacapaca/services/in_app_purchase_service.dart';
import 'package:pacapaca/services/notification_service.dart';
import 'package:pacapaca/widgets/fcm_token_manager.dart';
import 'package:pacapaca/services/notification_manager_service.dart';
import 'package:pacapaca/services/product_service.dart';
import 'package:pacapaca/providers/settings_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // 앱 초기화
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 설정 초기화
  await _initializeSettings();

  // ProviderContainer 생성
  final container = ProviderContainer();

  // 알림 설정 상태 미리 로드
  await container
      .read(notificationSetupCompletedProvider.notifier)
      .loadAndGetNotificationSetupCompleted();

  // 알림 관리자에 컨테이너 설정
  GetIt.instance<NotificationManagerService>().setProviderContainer(container);

  // 앱 실행
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('en'), Locale('ko')],
        fallbackLocale: const Locale('ko'),
        useFallbackTranslations: true,
        child: ScreenUtilInit(
          designSize: const Size(393, 852), // iPhone 16 Pro 기준
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => FCMTokenManager(
            child: const MyApp(),
          ),
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
  await _setupServiceLocator();

  // 스토리지 서비스 초기화
  final storageService = GetIt.instance<StorageService>();
  await storageService.checkFirstRun();

  // 인증 상태 확인 및 초기화
  await _checkAuthState();

  // 다국어 지원 초기화
  await EasyLocalization.ensureInitialized();

  // 시간대 설정
  await setupTimeZone();

  // 서비스 등록
  GetIt.instance.registerLazySingleton(() => NotificationService());
  GetIt.instance.registerSingleton<NotificationManagerService>(
      NotificationManagerService());

  // 알림 관리자 초기화
  try {
    await GetIt.instance<NotificationManagerService>().initialize();
  } catch (e) {
    print('알림 관리자 초기화 중 오류 발생: $e');
    // 오류가 발생해도 앱 실행은 계속 진행
  }
}

Future<void> setupTimeZone() async {
  tz.initializeTimeZones();
  String timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));

  // timeago 언어 설정 (메시지 등록)
  timeago.setLocaleMessages('ko', KoMessages());
  timeago.setLocaleMessages('en', EnMessages());

  // 기본 언어는 MyApp에서 context.locale을 통해 설정됨
}

Future<void> _setupServiceLocator() async {
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

  // SharedPreferences 인스턴스 등록
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

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
}

// 전역 변수로 GlobalKey 추가
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// 인증 상태 확인 및 초기화 함수 추가
Future<void> _checkAuthState() async {
  final logger = GetIt.instance<Logger>();
  final storageService = GetIt.instance<StorageService>();
  try {
    // Firebase 인증 상태 확인
    final firebaseUser = FirebaseAuth.instance.currentUser;

    // 로컬 스토리지의 토큰 확인
    final accessToken = await storageService.accessToken;
    final userData = await storageService.userData;

    // 불일치 상태 확인 및 처리
    if (firebaseUser != null && (accessToken == null || userData == null)) {
      await FirebaseAuth.instance.signOut();
    }

    if (firebaseUser == null && (accessToken != null || userData != null)) {
      await storageService.deleteTokens();
      await storageService.deleteUser();
    }
  } catch (e) {
    // 오류 발생 시 안전하게 로그아웃 처리
    try {
      await FirebaseAuth.instance.signOut();
      await storageService.deleteTokens();
      await storageService.deleteUser();
    } catch (e) {
      logger.e('Failed to force logout', error: e);
    }
  }
}
