// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestResponseImpl<T> _$$RestResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$RestResponseImpl<T>(
      statusCode: (json['status_code'] as num).toInt(),
      message: json['message'] as String,
      response: _$nullableGenericFromJson(json['response'], fromJsonT),
    );

Map<String, dynamic> _$$RestResponseImplToJson<T>(
  _$RestResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
      'response': _$nullableGenericToJson(instance.response, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
