import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/services/storage_service.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final _storage = GetIt.instance<StorageService>();

  ThemeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final savedTheme = await _storage.theme;
    if (savedTheme != null) {
      state = savedTheme;
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    await _storage.saveTheme(mode);
    state = mode;
  }
}

class LocaleNotifier extends StateNotifier<Locale> {
  final _storage = GetIt.instance<StorageService>();

  LocaleNotifier() : super(const Locale('ko')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final savedLocale = await _storage.locale;
    if (savedLocale != null) {
      state = savedLocale;
    }
  }

  Future<void> setLocale(Locale locale) async {
    await _storage.saveLocale(locale);
    state = locale;
  }
}
