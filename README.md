# pacapaca

Sharing your stories.

## Libraries

### Core Libraries
- **get_it**: 의존성 주입(DI) 라이브러리. 서비스 로케이터 패턴을 사용하여 객체 인스턴스를 관리하고 주입합니다.
- **freezed**: 불변(immutable) 객체를 쉽게 생성할 수 있게 해주는 코드 생성 라이브러리. 데이터 클래스, union types 지원.
- **riverpod**: 안전하고 유연한 상태 관리 라이브러리. Provider 패턴을 사용하여 앱의 상태를 관리합니다.
- **go_router**: 선언적이고 강력한 라우팅 라이브러리. 딥링크 지원과 URL 기반 네비게이션을 제공합니다.

### Network & Storage
- **dio**: 강력한 HTTP 클라이언트 라이브러리. 인터셉터, 글로벌 설정, FormData 등을 지원합니다.
- **shared_preferences**: 간단한 키-값 데이터를 저장하기 위한 영구 저장소 라이브러리.
- **flutter_secure_storage**: 민감한 데이터를 안전하게 저장하기 위한 암호화 저장소 라이브러리.
- **hive**: 빠른 NoSQL 데이터베이스. 키-값 기반의 로컬 데이터 저장소로 복잡한 객체도 저장 가능합니다.
- **cached_network_image**: 네트워크 이미지 캐싱 라이브러리. 이미지 로딩 상태 처리와 에러 핸들링을 지원합니다.

### UI/UX
- **flutter_screenutil**: 반응형 UI를 쉽게 구현할 수 있게 해주는 라이브러리. 다양한 화면 크기에 대응합니다.
- **easy_localization**: 다국어 지원을 위한 라이브러리. JSON/YAML 기반의 번역 관리를 지원합니다.
- **flutter_svg**: SVG 파일을 렌더링하기 위한 라이브러리.
- **fluttertoast**: 간단한 토스트 메시지를 표시할 수 있는 라이브러리. 안드로이드/iOS 스타일을 지원합니다.
- **flutter_image_compress**: 이미지 압축 및 리사이징 라이브러리. 업로드 전 이미지 최적화와 썸네일 생성에 사용됩니다.

### Development
- **build_runner**: 코드 생성을 위한 빌드 시스템.
- **logger**: 개발 시 디버깅을 위한 로깅 라이브러리. 구조화된 로그 출력을 지원합니다.


## 프로젝트 구조

### 디렉토리 구조

```
lib/
├── constants/
│   ├── constants.dart      # 앱 전반의 상수들
│   └── theme.dart         # 앱 테마
│
├── models/                # 데이터 모델
│   ├── user.dart
│   └── post.dart
│
├── providers/            # Riverpod providers
│   ├── auth_provider.dart
│   ├── feed_provider.dart
│   └── settings_provider.dart
│
├── pages/               # 화면 구현
│   ├── auth/
│   │   ├── login_page.dart
│   │   └── splash_page.dart
│   ├── home/
│   │   └── home_page.dart
│   ├── article/
│   │   ├── article_list_page.dart
│   │   └── article_detail_page.dart
│   └── settings/
│       └── settings_page.dart
│
├── widgets/             # 재사용 위젯
│   ├── common/         # 공통 위젯
│   │   ├── custom_button.dart
│   │   └── loading_indicator.dart
│   ├── feed/          # 피드 관련 위젯
│   │   └── feed_card.dart
│   └── board/         # 게시판 관련 위젯
│       └── post_card.dart
│
├── services/           # API 호출 등 서비스
│   ├── api_service.dart
│   └── storage_service.dart
│
├── router.dart         # 라우팅 설정
├── app.dart
└── main.dart
```

## 빌드 및 실행

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

```bash
flutter pub run flutter_launcher_icons:main
```

```bash
flutter pub run flutter_native_splash:create
```

## android build
```bash
use key.properties, key.jks flutter build appbundle check ./build/app/outputs/bundle/release/app-release.aab
```

## android release
```
    // 서명 설정 추가
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
```

```bash
flutter build apk --release
```

## rename app
```bash
dart run rename_app:main android="파카파카" ios="파카파카"
dart run rename_app:main android="PacaPaca" ios="PacaPaca"
```

## generate splash images
```bash
flutter clean && flutter pub get && flutter pub run flutter_native_splash:create --path=/Users/andrew/03_side/pacapaca/pubspec.yaml
```