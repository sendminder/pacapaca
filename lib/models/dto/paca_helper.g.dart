// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paca_helper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };

_$RequestDefineProblemsImpl _$$RequestDefineProblemsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestDefineProblemsImpl(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RequestDefineProblemsImplToJson(
        _$RequestDefineProblemsImpl instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };

_$ResponseDefineProblemsImpl _$$ResponseDefineProblemsImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseDefineProblemsImpl(
      answer: json['answer'] as String,
      done: json['done'] as bool?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ResponseDefineProblemsImplToJson(
        _$ResponseDefineProblemsImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'done': instance.done,
      'title': instance.title,
      'category': instance.category,
      'keywords': instance.keywords,
    };

_$RequestSummarizeConcernsImpl _$$RequestSummarizeConcernsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestSummarizeConcernsImpl(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RequestSummarizeConcernsImplToJson(
        _$RequestSummarizeConcernsImpl instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };

_$ResponseSummarizeConcernsImpl _$$ResponseSummarizeConcernsImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseSummarizeConcernsImpl(
      answer: json['answer'] as String,
      done: json['done'] as bool?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ResponseSummarizeConcernsImplToJson(
        _$ResponseSummarizeConcernsImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'done': instance.done,
      'title': instance.title,
      'category': instance.category,
      'keywords': instance.keywords,
    };
