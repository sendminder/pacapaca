import 'package:flutter/material.dart';

class AppTheme {
  // 색상 정의
  static const primaryColor = Color.fromARGB(255, 157, 121, 255); // 부드러운 보라색
  static const secondaryColor = Color(0xFFFF6B6B); // 귀여운 핑크레드
  static const backgroundColor = Color(0xFFF8F9FA);
  static const errorColor = Color(0xFFFF5252);

  // 다크모드 색상
  static const darkPrimaryColor = Color(0xFFB39DDB); // 더 밝은 보라색
  static const darkBackgroundColor = Color(0xFF121212); // 더 어두운 배경
  static const darkSurfaceColor = Color(0xFF1E1E1E); // 카드 등의 표면 색상
  static const darkTextColor = Color(0xFFE1E1E1); // 주 텍스트 색상
  static const darkTextSecondaryColor = Color(0xFFB0B0B0); // 보조 텍스트 색상

  // 라이트 테마
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Pretendard',
      brightness: Brightness.light,

      // 컬러 스킴
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
        surface: Colors.white,
        surfaceContainerLow: Colors.grey.shade100,
        background: backgroundColor,
        onBackground: Colors.black87,
      ),

      // AppBar 테마
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),

      // 버튼 테마
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
      ),

      // 카드 테마
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        shadowColor: primaryColor.withOpacity(0.1),
      ),

      // 입력 필드 테마
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[50],
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: primaryColor.withOpacity(0.5)),
        ),
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      ),

      // 스낵바 테마
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentTextStyle: const TextStyle(
          fontFamily: 'Pretendard',
        ),
      ),
    );
  }

  // 다크 테마
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      brightness: Brightness.dark,

      // 컬러 스킴
      colorScheme: ColorScheme.dark(
        primary: darkPrimaryColor,
        secondary: secondaryColor,
        error: errorColor,
        surface: darkSurfaceColor,
        surfaceContainerLow: Colors.grey.shade900,
        background: darkBackgroundColor,
        onBackground: darkTextColor,
        onSurface: darkTextColor,
        onPrimary: Colors.black, // 버튼 텍스트 등
        onSecondary: Colors.black,
      ),

      // AppBar 테마
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackgroundColor,
        foregroundColor: darkTextColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: darkTextColor,
        ),
      ),

      // 텍스트 테마 추가
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: darkTextColor),
        bodyMedium: TextStyle(color: darkTextColor),
        bodySmall: TextStyle(color: darkTextSecondaryColor),
        titleLarge: TextStyle(color: darkTextColor),
        titleMedium: TextStyle(color: darkTextColor),
        titleSmall: TextStyle(color: darkTextSecondaryColor),
      ),

      // 버튼 테마
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: darkPrimaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
      ),

      // 카드 테마
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: darkSurfaceColor,
        shadowColor: Colors.black26,
      ),

      // 입력 필드 테마
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurfaceColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: darkPrimaryColor.withOpacity(0.5)),
        ),
        hintStyle: TextStyle(
          color: darkTextSecondaryColor,
          fontSize: 14,
        ),
      ),

      // 스낵바 테마
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: darkSurfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentTextStyle: TextStyle(
          fontFamily: 'Pretendard',
          color: darkTextColor,
        ),
      ),
    );
  }
}
