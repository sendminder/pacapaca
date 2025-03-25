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
    required List<Message> messages,
  }) = _RequestDefineProblems;

  factory RequestDefineProblems.fromJson(Map<String, dynamic> json) =>
      _$RequestDefineProblemsFromJson(json);
}

@freezed
class ResponseDefineProblems with _$ResponseDefineProblems {
  const factory ResponseDefineProblems({
    required String answer,
    bool? done,
    String? title,
    String? category,
    List<String>? keywords,
  }) = _ResponseDefineProblems;

  factory ResponseDefineProblems.fromJson(Map<String, dynamic> json) =>
      _$ResponseDefineProblemsFromJson(json);
}

@freezed
class RequestSummarizeConcerns with _$RequestSummarizeConcerns {
  const factory RequestSummarizeConcerns({
    required List<Message> messages,
  }) = _RequestSummarizeConcerns;

  factory RequestSummarizeConcerns.fromJson(Map<String, dynamic> json) =>
      _$RequestSummarizeConcernsFromJson(json);
}

@freezed
class ResponseSummarizeConcerns with _$ResponseSummarizeConcerns {
  const factory ResponseSummarizeConcerns({
    required String answer,
    bool? done,
    String? title,
    String? category,
    List<String>? keywords,
  }) = _ResponseSummarizeConcerns;

  factory ResponseSummarizeConcerns.fromJson(Map<String, dynamic> json) =>
      _$ResponseSummarizeConcernsFromJson(json);
}
