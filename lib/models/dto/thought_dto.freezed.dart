// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thought_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThoughtDTO _$ThoughtDTOFromJson(Map<String, dynamic> json) {
  return _ThoughtDTO.fromJson(json);
}

/// @nodoc
mixin _$ThoughtDTO {
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;
  bool get isAnswered => throw _privateConstructorUsedError;

  /// Serializes this ThoughtDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThoughtDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThoughtDTOCopyWith<ThoughtDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThoughtDTOCopyWith<$Res> {
  factory $ThoughtDTOCopyWith(
          ThoughtDTO value, $Res Function(ThoughtDTO) then) =
      _$ThoughtDTOCopyWithImpl<$Res, ThoughtDTO>;
  @useResult
  $Res call(
      {String id,
      String message,
      String date,
      String? response,
      bool isAnswered});
}

/// @nodoc
class _$ThoughtDTOCopyWithImpl<$Res, $Val extends ThoughtDTO>
    implements $ThoughtDTOCopyWith<$Res> {
  _$ThoughtDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThoughtDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? date = null,
    Object? response = freezed,
    Object? isAnswered = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThoughtDTOImplCopyWith<$Res>
    implements $ThoughtDTOCopyWith<$Res> {
  factory _$$ThoughtDTOImplCopyWith(
          _$ThoughtDTOImpl value, $Res Function(_$ThoughtDTOImpl) then) =
      __$$ThoughtDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String message,
      String date,
      String? response,
      bool isAnswered});
}

/// @nodoc
class __$$ThoughtDTOImplCopyWithImpl<$Res>
    extends _$ThoughtDTOCopyWithImpl<$Res, _$ThoughtDTOImpl>
    implements _$$ThoughtDTOImplCopyWith<$Res> {
  __$$ThoughtDTOImplCopyWithImpl(
      _$ThoughtDTOImpl _value, $Res Function(_$ThoughtDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThoughtDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? date = null,
    Object? response = freezed,
    Object? isAnswered = null,
  }) {
    return _then(_$ThoughtDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThoughtDTOImpl implements _ThoughtDTO {
  const _$ThoughtDTOImpl(
      {required this.id,
      required this.message,
      required this.date,
      this.response,
      this.isAnswered = false});

  factory _$ThoughtDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThoughtDTOImplFromJson(json);

  @override
  final String id;
  @override
  final String message;
  @override
  final String date;
  @override
  final String? response;
  @override
  @JsonKey()
  final bool isAnswered;

  @override
  String toString() {
    return 'ThoughtDTO(id: $id, message: $message, date: $date, response: $response, isAnswered: $isAnswered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThoughtDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.isAnswered, isAnswered) ||
                other.isAnswered == isAnswered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, message, date, response, isAnswered);

  /// Create a copy of ThoughtDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThoughtDTOImplCopyWith<_$ThoughtDTOImpl> get copyWith =>
      __$$ThoughtDTOImplCopyWithImpl<_$ThoughtDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThoughtDTOImplToJson(
      this,
    );
  }
}

abstract class _ThoughtDTO implements ThoughtDTO {
  const factory _ThoughtDTO(
      {required final String id,
      required final String message,
      required final String date,
      final String? response,
      final bool isAnswered}) = _$ThoughtDTOImpl;

  factory _ThoughtDTO.fromJson(Map<String, dynamic> json) =
      _$ThoughtDTOImpl.fromJson;

  @override
  String get id;
  @override
  String get message;
  @override
  String get date;
  @override
  String? get response;
  @override
  bool get isAnswered;

  /// Create a copy of ThoughtDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThoughtDTOImplCopyWith<_$ThoughtDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyThoughtDTO _$DailyThoughtDTOFromJson(Map<String, dynamic> json) {
  return _DailyThoughtDTO.fromJson(json);
}

/// @nodoc
mixin _$DailyThoughtDTO {
  List<ThoughtDTO> get thoughts => throw _privateConstructorUsedError;
  Map<String, String> get responses => throw _privateConstructorUsedError;

  /// Serializes this DailyThoughtDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyThoughtDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyThoughtDTOCopyWith<DailyThoughtDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyThoughtDTOCopyWith<$Res> {
  factory $DailyThoughtDTOCopyWith(
          DailyThoughtDTO value, $Res Function(DailyThoughtDTO) then) =
      _$DailyThoughtDTOCopyWithImpl<$Res, DailyThoughtDTO>;
  @useResult
  $Res call({List<ThoughtDTO> thoughts, Map<String, String> responses});
}

/// @nodoc
class _$DailyThoughtDTOCopyWithImpl<$Res, $Val extends DailyThoughtDTO>
    implements $DailyThoughtDTOCopyWith<$Res> {
  _$DailyThoughtDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyThoughtDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thoughts = null,
    Object? responses = null,
  }) {
    return _then(_value.copyWith(
      thoughts: null == thoughts
          ? _value.thoughts
          : thoughts // ignore: cast_nullable_to_non_nullable
              as List<ThoughtDTO>,
      responses: null == responses
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyThoughtDTOImplCopyWith<$Res>
    implements $DailyThoughtDTOCopyWith<$Res> {
  factory _$$DailyThoughtDTOImplCopyWith(_$DailyThoughtDTOImpl value,
          $Res Function(_$DailyThoughtDTOImpl) then) =
      __$$DailyThoughtDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ThoughtDTO> thoughts, Map<String, String> responses});
}

/// @nodoc
class __$$DailyThoughtDTOImplCopyWithImpl<$Res>
    extends _$DailyThoughtDTOCopyWithImpl<$Res, _$DailyThoughtDTOImpl>
    implements _$$DailyThoughtDTOImplCopyWith<$Res> {
  __$$DailyThoughtDTOImplCopyWithImpl(
      _$DailyThoughtDTOImpl _value, $Res Function(_$DailyThoughtDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyThoughtDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thoughts = null,
    Object? responses = null,
  }) {
    return _then(_$DailyThoughtDTOImpl(
      thoughts: null == thoughts
          ? _value._thoughts
          : thoughts // ignore: cast_nullable_to_non_nullable
              as List<ThoughtDTO>,
      responses: null == responses
          ? _value._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyThoughtDTOImpl implements _DailyThoughtDTO {
  const _$DailyThoughtDTOImpl(
      {required final List<ThoughtDTO> thoughts,
      final Map<String, String> responses = const {}})
      : _thoughts = thoughts,
        _responses = responses;

  factory _$DailyThoughtDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyThoughtDTOImplFromJson(json);

  final List<ThoughtDTO> _thoughts;
  @override
  List<ThoughtDTO> get thoughts {
    if (_thoughts is EqualUnmodifiableListView) return _thoughts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thoughts);
  }

  final Map<String, String> _responses;
  @override
  @JsonKey()
  Map<String, String> get responses {
    if (_responses is EqualUnmodifiableMapView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_responses);
  }

  @override
  String toString() {
    return 'DailyThoughtDTO(thoughts: $thoughts, responses: $responses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyThoughtDTOImpl &&
            const DeepCollectionEquality().equals(other._thoughts, _thoughts) &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_thoughts),
      const DeepCollectionEquality().hash(_responses));

  /// Create a copy of DailyThoughtDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyThoughtDTOImplCopyWith<_$DailyThoughtDTOImpl> get copyWith =>
      __$$DailyThoughtDTOImplCopyWithImpl<_$DailyThoughtDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyThoughtDTOImplToJson(
      this,
    );
  }
}

abstract class _DailyThoughtDTO implements DailyThoughtDTO {
  const factory _DailyThoughtDTO(
      {required final List<ThoughtDTO> thoughts,
      final Map<String, String> responses}) = _$DailyThoughtDTOImpl;

  factory _DailyThoughtDTO.fromJson(Map<String, dynamic> json) =
      _$DailyThoughtDTOImpl.fromJson;

  @override
  List<ThoughtDTO> get thoughts;
  @override
  Map<String, String> get responses;

  /// Create a copy of DailyThoughtDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyThoughtDTOImplCopyWith<_$DailyThoughtDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
