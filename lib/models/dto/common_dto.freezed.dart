// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestResponse<T> _$RestResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _RestResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$RestResponse<T> {
  @JsonKey(name: 'status_code')
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  T? get response => throw _privateConstructorUsedError;

  /// Serializes this RestResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of RestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestResponseCopyWith<T, RestResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestResponseCopyWith<T, $Res> {
  factory $RestResponseCopyWith(
          RestResponse<T> value, $Res Function(RestResponse<T>) then) =
      _$RestResponseCopyWithImpl<T, $Res, RestResponse<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status_code') int statusCode,
      String message,
      T? response});
}

/// @nodoc
class _$RestResponseCopyWithImpl<T, $Res, $Val extends RestResponse<T>>
    implements $RestResponseCopyWith<T, $Res> {
  _$RestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestResponseImplCopyWith<T, $Res>
    implements $RestResponseCopyWith<T, $Res> {
  factory _$$RestResponseImplCopyWith(_$RestResponseImpl<T> value,
          $Res Function(_$RestResponseImpl<T>) then) =
      __$$RestResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status_code') int statusCode,
      String message,
      T? response});
}

/// @nodoc
class __$$RestResponseImplCopyWithImpl<T, $Res>
    extends _$RestResponseCopyWithImpl<T, $Res, _$RestResponseImpl<T>>
    implements _$$RestResponseImplCopyWith<T, $Res> {
  __$$RestResponseImplCopyWithImpl(
      _$RestResponseImpl<T> _value, $Res Function(_$RestResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of RestResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? response = freezed,
  }) {
    return _then(_$RestResponseImpl<T>(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$RestResponseImpl<T> implements _RestResponse<T> {
  const _$RestResponseImpl(
      {@JsonKey(name: 'status_code') required this.statusCode,
      required this.message,
      this.response});

  factory _$RestResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$RestResponseImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'status_code')
  final int statusCode;
  @override
  final String message;
  @override
  final T? response;

  @override
  String toString() {
    return 'RestResponse<$T>(statusCode: $statusCode, message: $message, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestResponseImpl<T> &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message,
      const DeepCollectionEquality().hash(response));

  /// Create a copy of RestResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestResponseImplCopyWith<T, _$RestResponseImpl<T>> get copyWith =>
      __$$RestResponseImplCopyWithImpl<T, _$RestResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$RestResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _RestResponse<T> implements RestResponse<T> {
  const factory _RestResponse(
      {@JsonKey(name: 'status_code') required final int statusCode,
      required final String message,
      final T? response}) = _$RestResponseImpl<T>;

  factory _RestResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$RestResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'status_code')
  int get statusCode;
  @override
  String get message;
  @override
  T? get response;

  /// Create a copy of RestResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestResponseImplCopyWith<T, _$RestResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
