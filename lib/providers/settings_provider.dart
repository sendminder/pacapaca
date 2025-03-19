import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/services/storage_service.dart';
import 'package:pacapaca/models/enums/article_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

final commentSortProvider =
    StateNotifierProvider<CommentSortNotifier, String>((ref) {
  return CommentSortNotifier();
});

final articleSortProvider =
    StateNotifierProvider<ArticleSortNotifier, String>((ref) {
  return ArticleSortNotifier();
});

final articleCategoryProvider =
    StateNotifierProvider<ArticleCategoryNotifier, ArticleCategory>((ref) {
  return ArticleCategoryNotifier();
});

final recentSearchesProvider =
    StateNotifierProvider<RecentSearchesNotifier, List<String>>((ref) {
  return RecentSearchesNotifier();
});

// 알림 설정 상태를 위한 provider
final notificationEnabledProvider =
    StateNotifierProvider<NotificationEnabledNotifier, bool>((ref) {
  return NotificationEnabledNotifier();
});

// 알림 설정 완료 상태를 위한 provider
final notificationSetupCompletedProvider =
    StateNotifierProvider<NotificationSetupCompletedNotifier, bool>((ref) {
  return NotificationSetupCompletedNotifier();
});

final guidelinesConfirmedProvider =
    StateNotifierProvider<GuidelinesConfirmedNotifier, bool>((ref) {
  return GuidelinesConfirmedNotifier();
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

// 댓글 정렬 상태를 위한 provider
class CommentSortNotifier extends StateNotifier<String> {
  CommentSortNotifier() : super('ordest') {
    _loadCommentSort();
  }
  final _storage = GetIt.instance<StorageService>();

  void setSort(String sort) {
    state = sort;
    _storage.saveCommentSort(sort);
  }

  Future<void> _loadCommentSort() async {
    final savedCommentSort = await _storage.commentSort;
    if (savedCommentSort != null) {
      state = savedCommentSort;
    } else {
      state = 'ordest';
    }
  }
}

// 게시글 정렬 상태를 위한 provider
class ArticleSortNotifier extends StateNotifier<String> {
  ArticleSortNotifier() : super('latest') {
    _loadArticleSort();
  }
  final _storage = GetIt.instance<StorageService>();

  void setSort(String sort) {
    state = sort;
    _storage.saveArticleSort(sort);
  }

  Future<void> _loadArticleSort() async {
    final savedArticleSort = await _storage.articleSort;
    if (savedArticleSort != null) {
      state = savedArticleSort;
    } else {
      state = 'latest';
    }
  }
}

class ArticleCategoryNotifier extends StateNotifier<ArticleCategory> {
  ArticleCategoryNotifier() : super(ArticleCategory.all);
  void setCategory(ArticleCategory category) {
    state = category;
  }
}

class RecentSearchesNotifier extends StateNotifier<List<String>> {
  final _storage = GetIt.instance<StorageService>();
  static const int maxSearches = 5;

  RecentSearchesNotifier() : super([]) {
    _loadRecentSearches();
  }

  Future<void> _loadRecentSearches() async {
    final searches = await _storage.getRecentSearches();
    state = searches;
  }

  Future<void> addSearch(String query) async {
    if (query.trim().isEmpty) return;

    final newState = [...state];
    // 이미 있는 검색어라면 제거
    newState.remove(query);
    // 최근 검색어를 앞에 추가
    newState.insert(0, query);
    // 최대 5개만 유지
    if (newState.length > maxSearches) {
      newState.removeLast();
    }

    state = newState;
    await _storage.saveRecentSearches(state);
  }

  Future<void> removeSearch(String query) async {
    final newState = [...state];
    newState.remove(query);
    state = newState;
    await _storage.saveRecentSearches(state);
  }

  Future<void> clearSearches() async {
    state = [];
    await _storage.saveRecentSearches([]);
  }
}

class NotificationEnabledNotifier extends StateNotifier<bool> {
  final _storage = GetIt.instance<StorageService>();

  NotificationEnabledNotifier() : super(false) {
    _loadNotificationEnabled();
  }

  Future<void> _loadNotificationEnabled() async {
    final enabled = await _storage.notificationEnabled;
    state = enabled ?? false;
  }

  Future<void> setNotificationEnabled(bool enabled) async {
    await _storage.saveNotificationEnabled(enabled);
    state = enabled;
  }
}

class NotificationSetupCompletedNotifier extends StateNotifier<bool> {
  final _storage = GetIt.instance<StorageService>();

  NotificationSetupCompletedNotifier() : super(false) {
    _loadNotificationSetupCompleted();
  }

  Future<void> _loadNotificationSetupCompleted() async {
    try {
      final completed = await _storage.notificationSetupCompleted;
      state = completed ?? false;
    } catch (e) {
      print('알림 설정 완료 상태 로드 중 오류 발생: $e');
      state = false; // 오류 발생 시 기본값으로 false 설정
    }
  }

  Future<bool> loadAndGetNotificationSetupCompleted() async {
    try {
      final completed = await _storage.notificationSetupCompleted;
      state = completed ?? false;
      return state;
    } catch (e) {
      print('알림 설정 완료 상태 로드 및 가져오기 중 오류 발생: $e');
      state = false; // 오류 발생 시 기본값으로 false 설정
      return false;
    }
  }

  Future<void> setNotificationSetupCompleted(bool completed) async {
    try {
      await _storage.saveNotificationSetupCompleted(completed);
      state = completed;
    } catch (e) {
      print('알림 설정 완료 상태 설정 중 오류 발생: $e');
      state = false; // 오류 발생 시 기본값으로 false 설정
    }
  }
}

class GuidelinesConfirmedNotifier extends StateNotifier<bool> {
  GuidelinesConfirmedNotifier() : super(false) {
    loadGuidelinesConfirmed();
  }
  final _storage = GetIt.instance<StorageService>();

  Future<void> setGuidelinesConfirmed() async {
    try {
      await _storage.saveGuidelinesConfirmed(true);
      state = true;
    } catch (e) {
      print('가이드라인 확인 상태 저장 중 오류 발생: $e');
    }
  }

  Future<void> loadGuidelinesConfirmed() async {
    try {
      final confirmed = await _storage.guidelinesConfirmed;
      state = confirmed ?? false;
    } catch (e) {
      print('가이드라인 확인 상태 로드 중 오류 발생: $e');
      state = false;
    }
  }
}
