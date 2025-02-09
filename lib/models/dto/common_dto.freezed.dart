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

ResponseRest<T> _$ResponseRestFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ResponseRest<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ResponseRest<T> {
  @JsonKey(name: 'status_code')
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  T? get response => throw _privateConstructorUsedError;

  /// Serializes this ResponseRest to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ResponseRest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseRestCopyWith<T, ResponseRest<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseRestCopyWith<T, $Res> {
  factory $ResponseRestCopyWith(
          ResponseRest<T> value, $Res Function(ResponseRest<T>) then) =
      _$ResponseRestCopyWithImpl<T, $Res, ResponseRest<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status_code') int statusCode,
      String message,
      T? response});
}

/// @nodoc
class _$ResponseRestCopyWithImpl<T, $Res, $Val extends ResponseRest<T>>
    implements $ResponseRestCopyWith<T, $Res> {
  _$ResponseRestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseRest
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
abstract class _$$ResponseRestImplCopyWith<T, $Res>
    implements $ResponseRestCopyWith<T, $Res> {
  factory _$$ResponseRestImplCopyWith(_$ResponseRestImpl<T> value,
          $Res Function(_$ResponseRestImpl<T>) then) =
      __$$ResponseRestImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status_code') int statusCode,
      String message,
      T? response});
}

/// @nodoc
class __$$ResponseRestImplCopyWithImpl<T, $Res>
    extends _$ResponseRestCopyWithImpl<T, $Res, _$ResponseRestImpl<T>>
    implements _$$ResponseRestImplCopyWith<T, $Res> {
  __$$ResponseRestImplCopyWithImpl(
      _$ResponseRestImpl<T> _value, $Res Function(_$ResponseRestImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResponseRest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? response = freezed,
  }) {
    return _then(_$ResponseRestImpl<T>(
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
class _$ResponseRestImpl<T> implements _ResponseRest<T> {
  const _$ResponseRestImpl(
      {@JsonKey(name: 'status_code') required this.statusCode,
      required this.message,
      this.response});

  factory _$ResponseRestImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ResponseRestImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'status_code')
  final int statusCode;
  @override
  final String message;
  @override
  final T? response;

  @override
  String toString() {
    return 'ResponseRest<$T>(statusCode: $statusCode, message: $message, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseRestImpl<T> &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message,
      const DeepCollectionEquality().hash(response));

  /// Create a copy of ResponseRest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseRestImplCopyWith<T, _$ResponseRestImpl<T>> get copyWith =>
      __$$ResponseRestImplCopyWithImpl<T, _$ResponseRestImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ResponseRestImplToJson<T>(this, toJsonT);
  }
}

abstract class _ResponseRest<T> implements ResponseRest<T> {
  const factory _ResponseRest(
      {@JsonKey(name: 'status_code') required final int statusCode,
      required final String message,
      final T? response}) = _$ResponseRestImpl<T>;

  factory _ResponseRest.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ResponseRestImpl<T>.fromJson;

  @override
  @JsonKey(name: 'status_code')
  int get statusCode;
  @override
  String get message;
  @override
  T? get response;

  /// Create a copy of ResponseRest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseRestImplCopyWith<T, _$ResponseRestImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
