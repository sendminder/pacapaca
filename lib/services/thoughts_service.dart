import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pacapaca/models/dto/thought_dto.dart';
import 'package:uuid/uuid.dart';

class ThoughtsService {
  static const String _thoughtsKey = 'daily_thoughts';
  static const String _responsesKey = 'user_responses';

  final SharedPreferences _prefs;
  final logger = GetIt.instance<Logger>();
  final _uuid = const Uuid();

  // 미리 정의된 따뜻한 한마디 목록
  final List<String> _predefinedThoughts = [
    '오늘 하루도 힘내세요. 당신의 작은 노력이 큰 변화를 만듭니다.',
    '실패는 성공을 향한 첫 걸음입니다. 포기하지 마세요.',
    '당신의 미소가 누군가에게 큰 힘이 됩니다.',
    '지금 이 순간을 소중히 여기세요. 다시 오지 않을 순간입니다.',
    '자신을 믿으세요. 당신은 생각보다 더 강합니다.',
    '오늘의 작은 성취를 축하하세요. 모든 위대한 일은 작은 시작에서 비롯됩니다.',
    '어려움이 있을 때 가장 빛나는 법입니다.',
    '매일 한 가지 감사할 일을 찾아보세요. 행복은 그런 작은 것에서 시작됩니다.',
    '당신의 꿈을 위한 작은 한 걸음을 오늘 내딛어 보세요.',
    '스스로에게 친절하세요. 당신도 성장 중입니다.',
    '가장 어두운 밤이 지나면 새벽이 옵니다.',
    '오늘 하루 당신에게 새로운 기회가 열립니다.',
    '누군가에게 작은 친절을 베풀어 보세요. 당신의 하루가 더 빛날 거예요.',
    '자신의 페이스대로 나아가세요. 인생은 경쟁이 아닙니다.',
    '당신이 바꿀 수 없는 것에 집중하지 말고, 바꿀 수 있는 것에 집중하세요.',
    '지금 당신이 하고 있는 일에 자부심을 가지세요.',
    '한 번에 한 걸음씩 나아가세요. 그것이 가장 확실한 방법입니다.',
    '모든 끝은 새로운 시작을 의미합니다.',
    '당신의 이야기는 소중합니다. 누군가에게 영감이 될 수 있어요.',
    '오늘 하루를 살아내는 것만으로도 당신은 충분히 잘하고 있습니다.',
    '작은 변화가 큰 차이를 만들 수 있습니다.',
    '지금 이 순간을 즐기세요. 내일을 걱정하며 오늘을 낭비하지 마세요.',
    '당신의 한계는 당신이 정한 것에 불과합니다.',
    '당신의 존재 자체로 누군가에게 힘이 됩니다.',
    '하루를 마무리하며 스스로를 칭찬해 주세요.',
    '당신이 있어 세상이 더 아름답습니다.',
    '실패는 끝이 아니라 성장의 기회입니다.',
    '모든 것이 완벽할 필요는 없습니다. 진정성이 더 중요합니다.',
    '당신의 감정은 모두 유효합니다. 스스로를 받아들이세요.',
    '인생에서 가장 아름다운 순간은 종종 가장 단순한 순간에서 찾을 수 있습니다.',
  ];

  ThoughtsService() : _prefs = GetIt.instance<SharedPreferences>();

  // 오늘의 따뜻한 한마디 가져오기
  Future<ThoughtDTO> getTodayThought() async {
    final now = DateTime.now();
    final today =
        DateTime(now.year, now.month, now.day).toIso8601String().split('T')[0];

    // 저장된 생각들 가져오기
    final thoughts = await _getThoughts();

    // 오늘 날짜에 해당하는 생각 찾기
    final todayThought = thoughts.firstWhere(
      (thought) => thought.date == today,
      orElse: () {
        // 없으면 새로 생성
        final newThought = ThoughtDTO(
          id: _uuid.v4(),
          message: _getRandomThought(),
          date: today,
        );

        // 저장
        _saveThought(newThought);

        return newThought;
      },
    );

    return todayThought;
  }

  // 특정 날짜의 생각 가져오기
  Future<ThoughtDTO?> getThoughtByDate(DateTime date) async {
    final dateStr = DateTime(date.year, date.month, date.day)
        .toIso8601String()
        .split('T')[0];
    final thoughts = await _getThoughts();

    try {
      return thoughts.firstWhere((thought) => thought.date == dateStr);
    } catch (e) {
      return null;
    }
  }

  // 사용자 응답 저장하기
  Future<void> saveResponse(String thoughtId, String response) async {
    try {
      final thoughts = await _getThoughts();
      final index = thoughts.indexWhere((thought) => thought.id == thoughtId);

      if (index != -1) {
        final updatedThought = thoughts[index].copyWith(
          response: response,
          isAnswered: true,
        );

        thoughts[index] = updatedThought;
        await _saveThoughts(thoughts);

        logger.d('응답이 저장되었습니다: $thoughtId');
      } else {
        logger.w('저장할 생각을 찾을 수 없습니다: $thoughtId');
      }
    } catch (e, stackTrace) {
      logger.e('응답 저장 중 오류 발생', error: e, stackTrace: stackTrace);
    }
  }

  // 모든 생각 가져오기
  Future<List<ThoughtDTO>> getAllThoughts() async {
    return await _getThoughts();
  }

  // 응답이 있는 날짜 목록 가져오기
  Future<List<DateTime>> getAnsweredDates() async {
    final thoughts = await _getThoughts();
    return thoughts
        .where((thought) => thought.isAnswered)
        .map((thought) => DateTime.parse('${thought.date}T00:00:00Z'))
        .toList();
  }

  // 랜덤 한마디 가져오기
  String _getRandomThought() {
    _predefinedThoughts.shuffle();
    return _predefinedThoughts.first;
  }

  // 저장된 생각들 가져오기
  Future<List<ThoughtDTO>> _getThoughts() async {
    try {
      final thoughtsJson = _prefs.getString(_thoughtsKey);

      if (thoughtsJson == null || thoughtsJson.isEmpty) {
        return [];
      }

      final List<dynamic> decoded = jsonDecode(thoughtsJson);
      return decoded.map((json) => ThoughtDTO.fromJson(json)).toList();
    } catch (e, stackTrace) {
      logger.e('생각 가져오기 오류', error: e, stackTrace: stackTrace);
      return [];
    }
  }

  // 단일 생각 저장하기
  Future<void> _saveThought(ThoughtDTO thought) async {
    try {
      final thoughts = await _getThoughts();
      thoughts.add(thought);
      await _saveThoughts(thoughts);
    } catch (e, stackTrace) {
      logger.e('생각 저장 오류', error: e, stackTrace: stackTrace);
    }
  }

  // 모든 생각 저장하기
  Future<void> _saveThoughts(List<ThoughtDTO> thoughts) async {
    try {
      final encoded = jsonEncode(thoughts.map((t) => t.toJson()).toList());
      await _prefs.setString(_thoughtsKey, encoded);
    } catch (e, stackTrace) {
      logger.e('생각 목록 저장 오류', error: e, stackTrace: stackTrace);
    }
  }

  // 특정 날짜용 랜덤 생각 가져오기
  Future<String> getRandomThoughtForDate(DateTime date) async {
    _predefinedThoughts.shuffle();
    return _predefinedThoughts.first;
  }

  // 사용자 지정 생각 저장하기
  Future<void> saveCustomThought(ThoughtDTO thought) async {
    try {
      final thoughts = await _getThoughts();

      // 같은 날짜의 생각이 이미 있는지 확인
      final existingIndex = thoughts.indexWhere((t) => t.date == thought.date);

      if (existingIndex != -1) {
        // 이미 있으면 업데이트
        thoughts[existingIndex] = thought;
      } else {
        // 없으면 추가
        thoughts.add(thought);
      }

      await _saveThoughts(thoughts);
      logger.d('날짜별 생각이 저장되었습니다: ${thought.date}');
    } catch (e, stackTrace) {
      logger.e('날짜별 생각 저장 오류', error: e, stackTrace: stackTrace);
    }
  }
}
