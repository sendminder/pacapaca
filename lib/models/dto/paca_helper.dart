import 'package:freezed_annotation/freezed_annotation.dart';

part 'paca_helper.freezed.dart';
part 'paca_helper.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String role,
    required String content,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@freezed
class RequestDefineProblems with _$RequestDefineProblems {
  const factory RequestDefineProblems({
    required String category,
    required List<Message> messages,
  }) = _RequestDefineProblems;

  factory RequestDefineProblems.fromJson(Map<String, dynamic> json) =>
      _$RequestDefineProblemsFromJson(json);
}

@freezed
class ResponseDefineProblems with _$ResponseDefineProblems {
  const factory ResponseDefineProblems({
    required String answer,
    required bool done,
    String? title,
    String? category,
  }) = _ResponseDefineProblems;

  factory ResponseDefineProblems.fromJson(Map<String, dynamic> json) =>
      _$ResponseDefineProblemsFromJson(json);
}
