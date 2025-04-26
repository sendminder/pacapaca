// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thought_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThoughtDTOImpl _$$ThoughtDTOImplFromJson(Map<String, dynamic> json) =>
    _$ThoughtDTOImpl(
      id: json['id'] as String,
      message: json['message'] as String,
      date: json['date'] as String,
      response: json['response'] as String?,
      isAnswered: json['isAnswered'] as bool? ?? false,
    );

Map<String, dynamic> _$$ThoughtDTOImplToJson(_$ThoughtDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'date': instance.date,
      'response': instance.response,
      'isAnswered': instance.isAnswered,
    };

_$DailyThoughtDTOImpl _$$DailyThoughtDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyThoughtDTOImpl(
      thoughts: (json['thoughts'] as List<dynamic>)
          .map((e) => ThoughtDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      responses: (json['responses'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$$DailyThoughtDTOImplToJson(
        _$DailyThoughtDTOImpl instance) =>
    <String, dynamic>{
      'thoughts': instance.thoughts,
      'responses': instance.responses,
    };
