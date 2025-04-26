import 'package:freezed_annotation/freezed_annotation.dart';

part 'thought_dto.freezed.dart';
part 'thought_dto.g.dart';

@freezed
class ThoughtDTO with _$ThoughtDTO {
  const factory ThoughtDTO({
    required String id,
    required String message,
    required String date,
    String? response,
    @Default(false) bool isAnswered,
  }) = _ThoughtDTO;

  factory ThoughtDTO.fromJson(Map<String, dynamic> json) =>
      _$ThoughtDTOFromJson(json);
}

@freezed
class DailyThoughtDTO with _$DailyThoughtDTO {
  const factory DailyThoughtDTO({
    required List<ThoughtDTO> thoughts,
    @Default({}) Map<String, String> responses,
  }) = _DailyThoughtDTO;

  factory DailyThoughtDTO.fromJson(Map<String, dynamic> json) =>
      _$DailyThoughtDTOFromJson(json);
}
