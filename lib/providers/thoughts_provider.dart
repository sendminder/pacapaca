import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/thought_dto.dart';
import 'package:pacapaca/services/thoughts_service.dart';

// 선택된 날짜 상태
final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

// 모든 생각 데이터 가져오기
final thoughtsProvider = FutureProvider<List<ThoughtDTO>>((ref) async {
  final service = GetIt.instance<ThoughtsService>();
  return service.getAllThoughts();
});

// 특정 날짜의 생각 가져오기
final selectedThoughtProvider =
    FutureProvider.family<ThoughtDTO?, DateTime>((ref, date) async {
  final service = GetIt.instance<ThoughtsService>();
  return service.getThoughtByDate(date);
});

// 오늘의 생각 가져오기
final todayThoughtProvider = FutureProvider<ThoughtDTO>((ref) async {
  final service = GetIt.instance<ThoughtsService>();
  return service.getTodayThought();
});

// 응답 있는 날짜 목록 가져오기
final answeredDatesProvider = FutureProvider<List<DateTime>>((ref) async {
  final service = GetIt.instance<ThoughtsService>();
  return service.getAnsweredDates();
});
