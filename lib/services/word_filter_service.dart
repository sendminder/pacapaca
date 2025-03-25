import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:profanity_filter/profanity_filter.dart';

class WordFilterService {
  static WordFilterService? _instance;
  late Map<String, List<String>> _forbiddenWords;
  late ProfanityFilter _filter;
  bool _isInitialized = false;

  WordFilterService._();

  static WordFilterService get instance {
    _instance ??= WordFilterService._();
    return _instance!;
  }

  Future<void> initialize() async {
    if (_isInitialized) return;

    // profanity_filter 초기화
    _filter = ProfanityFilter();

    // 커스텀 금지어 로드
    final String jsonString =
        await rootBundle.loadString('assets/data/forbidden_words.json');
    _forbiddenWords = Map<String, List<String>>.from(
      json
          .decode(jsonString)
          .map((key, value) => MapEntry(key, List<String>.from(value))),
    );

    _isInitialized = true;
  }

  bool containsForbiddenWord(String text) {
    if (!_isInitialized) {
      throw Exception('WordFilterService가 초기화되지 않았습니다.');
    }

    // profanity_filter 체크
    if (_filter.hasProfanity(text)) {
      return true;
    }

    // 커스텀 금지어 체크
    final lowercaseText = text.toLowerCase();

    // 정규식을 사용한 패턴 매칭
    for (final wordList in _forbiddenWords.values) {
      for (final word in wordList) {
        final pattern = RegExp(
          word.toLowerCase(),
          unicode: true,
          caseSensitive: false,
        );
        if (pattern.hasMatch(lowercaseText)) {
          return true;
        }
      }
    }

    return false;
  }

  String? getForbiddenWordCategory(String text) {
    if (!_isInitialized) {
      throw Exception('WordFilterService가 초기화되지 않았습니다.');
    }

    // profanity_filter 체크
    if (_filter.hasProfanity(text)) {
      return 'profanity';
    }

    // 커스텀 금지어 체크
    final lowercaseText = text.toLowerCase();

    for (final entry in _forbiddenWords.entries) {
      for (final word in entry.value) {
        final pattern = RegExp(
          word.toLowerCase(),
          unicode: true,
          caseSensitive: false,
        );
        if (pattern.hasMatch(lowercaseText)) {
          return entry.key;
        }
      }
    }

    return null;
  }

  // 텍스트에서 부적절한 단어를 *로 치환
  String clean(String text) {
    if (!_isInitialized) {
      throw Exception('WordFilterService가 초기화되지 않았습니다.');
    }

    // profanity_filter로 먼저 치환
    var cleanedText = _filter.censor(text);

    // 커스텀 금지어 치환
    for (final wordList in _forbiddenWords.values) {
      for (final word in wordList) {
        final pattern = RegExp(
          word,
          unicode: true,
          caseSensitive: false,
        );
        cleanedText = cleanedText.replaceAll(
          pattern,
          '*' * word.length,
        );
      }
    }

    return cleanedText;
  }
}
