// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paca_helper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_$MessageImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl({required this.role, required this.content});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String role;
  @override
  final String content;

  @override
  String toString() {
    return 'Message(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final String role,
      required final String content}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get role;
  @override
  String get content;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestDefineProblems _$RequestDefineProblemsFromJson(
    Map<String, dynamic> json) {
  return _RequestDefineProblems.fromJson(json);
}

/// @nodoc
mixin _$RequestDefineProblems {
  List<Message> get messages => throw _privateConstructorUsedError;

  /// Serializes this RequestDefineProblems to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestDefineProblems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestDefineProblemsCopyWith<RequestDefineProblems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestDefineProblemsCopyWith<$Res> {
  factory $RequestDefineProblemsCopyWith(RequestDefineProblems value,
          $Res Function(RequestDefineProblems) then) =
      _$RequestDefineProblemsCopyWithImpl<$Res, RequestDefineProblems>;
  @useResult
  $Res call({List<Message> messages});
}

/// @nodoc
class _$RequestDefineProblemsCopyWithImpl<$Res,
        $Val extends RequestDefineProblems>
    implements $RequestDefineProblemsCopyWith<$Res> {
  _$RequestDefineProblemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestDefineProblems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestDefineProblemsImplCopyWith<$Res>
    implements $RequestDefineProblemsCopyWith<$Res> {
  factory _$$RequestDefineProblemsImplCopyWith(
          _$RequestDefineProblemsImpl value,
          $Res Function(_$RequestDefineProblemsImpl) then) =
      __$$RequestDefineProblemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Message> messages});
}

/// @nodoc
class __$$RequestDefineProblemsImplCopyWithImpl<$Res>
    extends _$RequestDefineProblemsCopyWithImpl<$Res,
        _$RequestDefineProblemsImpl>
    implements _$$RequestDefineProblemsImplCopyWith<$Res> {
  __$$RequestDefineProblemsImplCopyWithImpl(_$RequestDefineProblemsImpl _value,
      $Res Function(_$RequestDefineProblemsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestDefineProblems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$RequestDefineProblemsImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestDefineProblemsImpl implements _RequestDefineProblems {
  const _$RequestDefineProblemsImpl({required final List<Message> messages})
      : _messages = messages;

  factory _$RequestDefineProblemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestDefineProblemsImplFromJson(json);

  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'RequestDefineProblems(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestDefineProblemsImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  /// Create a copy of RequestDefineProblems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestDefineProblemsImplCopyWith<_$RequestDefineProblemsImpl>
      get copyWith => __$$RequestDefineProblemsImplCopyWithImpl<
          _$RequestDefineProblemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestDefineProblemsImplToJson(
      this,
    );
  }
}

abstract class _RequestDefineProblems implements RequestDefineProblems {
  const factory _RequestDefineProblems(
      {required final List<Message> messages}) = _$RequestDefineProblemsImpl;

  factory _RequestDefineProblems.fromJson(Map<String, dynamic> json) =
      _$RequestDefineProblemsImpl.fromJson;

  @override
  List<Message> get messages;

  /// Create a copy of RequestDefineProblems
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestDefineProblemsImplCopyWith<_$RequestDefineProblemsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseDefineProblems _$ResponseDefineProblemsFromJson(
    Map<String, dynamic> json) {
  return _ResponseDefineProblems.fromJson(json);
}

/// @nodoc
mixin _$ResponseDefineProblems {
  String get answer => throw _privateConstructorUsedError;
  bool? get done => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  List<String>? get keywords => throw _privateConstructorUsedError;

  /// Serializes this ResponseDefineProblems to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseDefineProblems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseDefineProblemsCopyWith<ResponseDefineProblems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseDefineProblemsCopyWith<$Res> {
  factory $ResponseDefineProblemsCopyWith(ResponseDefineProblems value,
          $Res Function(ResponseDefineProblems) then) =
      _$ResponseDefineProblemsCopyWithImpl<$Res, ResponseDefineProblems>;
  @useResult
  $Res call(
      {String answer,
      bool? done,
      String? title,
      String? category,
      List<String>? keywords});
}

/// @nodoc
class _$ResponseDefineProblemsCopyWithImpl<$Res,
        $Val extends ResponseDefineProblems>
    implements $ResponseDefineProblemsCopyWith<$Res> {
  _$ResponseDefineProblemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseDefineProblems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? done = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_value.copyWith(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseDefineProblemsImplCopyWith<$Res>
    implements $ResponseDefineProblemsCopyWith<$Res> {
  factory _$$ResponseDefineProblemsImplCopyWith(
          _$ResponseDefineProblemsImpl value,
          $Res Function(_$ResponseDefineProblemsImpl) then) =
      __$$ResponseDefineProblemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String answer,
      bool? done,
      String? title,
      String? category,
      List<String>? keywords});
}

/// @nodoc
class __$$ResponseDefineProblemsImplCopyWithImpl<$Res>
    extends _$ResponseDefineProblemsCopyWithImpl<$Res,
        _$ResponseDefineProblemsImpl>
    implements _$$ResponseDefineProblemsImplCopyWith<$Res> {
  __$$ResponseDefineProblemsImplCopyWithImpl(
      _$ResponseDefineProblemsImpl _value,
      $Res Function(_$ResponseDefineProblemsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseDefineProblems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? done = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_$ResponseDefineProblemsImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseDefineProblemsImpl implements _ResponseDefineProblems {
  const _$ResponseDefineProblemsImpl(
      {required this.answer,
      this.done,
      this.title,
      this.category,
      final List<String>? keywords})
      : _keywords = keywords;

  factory _$ResponseDefineProblemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseDefineProblemsImplFromJson(json);

  @override
  final String answer;
  @override
  final bool? done;
  @override
  final String? title;
  @override
  final String? category;
  final List<String>? _keywords;
  @override
  List<String>? get keywords {
    final value = _keywords;
    if (value == null) return null;
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResponseDefineProblems(answer: $answer, done: $done, title: $title, category: $category, keywords: $keywords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseDefineProblemsImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, answer, done, title, category,
      const DeepCollectionEquality().hash(_keywords));

  /// Create a copy of ResponseDefineProblems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseDefineProblemsImplCopyWith<_$ResponseDefineProblemsImpl>
      get copyWith => __$$ResponseDefineProblemsImplCopyWithImpl<
          _$ResponseDefineProblemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseDefineProblemsImplToJson(
      this,
    );
  }
}

abstract class _ResponseDefineProblems implements ResponseDefineProblems {
  const factory _ResponseDefineProblems(
      {required final String answer,
      final bool? done,
      final String? title,
      final String? category,
      final List<String>? keywords}) = _$ResponseDefineProblemsImpl;

  factory _ResponseDefineProblems.fromJson(Map<String, dynamic> json) =
      _$ResponseDefineProblemsImpl.fromJson;

  @override
  String get answer;
  @override
  bool? get done;
  @override
  String? get title;
  @override
  String? get category;
  @override
  List<String>? get keywords;

  /// Create a copy of ResponseDefineProblems
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseDefineProblemsImplCopyWith<_$ResponseDefineProblemsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestSummarizeConcerns _$RequestSummarizeConcernsFromJson(
    Map<String, dynamic> json) {
  return _RequestSummarizeConcerns.fromJson(json);
}

/// @nodoc
mixin _$RequestSummarizeConcerns {
  List<Message> get messages => throw _privateConstructorUsedError;

  /// Serializes this RequestSummarizeConcerns to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestSummarizeConcerns
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestSummarizeConcernsCopyWith<RequestSummarizeConcerns> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestSummarizeConcernsCopyWith<$Res> {
  factory $RequestSummarizeConcernsCopyWith(RequestSummarizeConcerns value,
          $Res Function(RequestSummarizeConcerns) then) =
      _$RequestSummarizeConcernsCopyWithImpl<$Res, RequestSummarizeConcerns>;
  @useResult
  $Res call({List<Message> messages});
}

/// @nodoc
class _$RequestSummarizeConcernsCopyWithImpl<$Res,
        $Val extends RequestSummarizeConcerns>
    implements $RequestSummarizeConcernsCopyWith<$Res> {
  _$RequestSummarizeConcernsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestSummarizeConcerns
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestSummarizeConcernsImplCopyWith<$Res>
    implements $RequestSummarizeConcernsCopyWith<$Res> {
  factory _$$RequestSummarizeConcernsImplCopyWith(
          _$RequestSummarizeConcernsImpl value,
          $Res Function(_$RequestSummarizeConcernsImpl) then) =
      __$$RequestSummarizeConcernsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Message> messages});
}

/// @nodoc
class __$$RequestSummarizeConcernsImplCopyWithImpl<$Res>
    extends _$RequestSummarizeConcernsCopyWithImpl<$Res,
        _$RequestSummarizeConcernsImpl>
    implements _$$RequestSummarizeConcernsImplCopyWith<$Res> {
  __$$RequestSummarizeConcernsImplCopyWithImpl(
      _$RequestSummarizeConcernsImpl _value,
      $Res Function(_$RequestSummarizeConcernsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestSummarizeConcerns
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$RequestSummarizeConcernsImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestSummarizeConcernsImpl implements _RequestSummarizeConcerns {
  const _$RequestSummarizeConcernsImpl({required final List<Message> messages})
      : _messages = messages;

  factory _$RequestSummarizeConcernsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestSummarizeConcernsImplFromJson(json);

  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'RequestSummarizeConcerns(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestSummarizeConcernsImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  /// Create a copy of RequestSummarizeConcerns
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestSummarizeConcernsImplCopyWith<_$RequestSummarizeConcernsImpl>
      get copyWith => __$$RequestSummarizeConcernsImplCopyWithImpl<
          _$RequestSummarizeConcernsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestSummarizeConcernsImplToJson(
      this,
    );
  }
}

abstract class _RequestSummarizeConcerns implements RequestSummarizeConcerns {
  const factory _RequestSummarizeConcerns(
      {required final List<Message> messages}) = _$RequestSummarizeConcernsImpl;

  factory _RequestSummarizeConcerns.fromJson(Map<String, dynamic> json) =
      _$RequestSummarizeConcernsImpl.fromJson;

  @override
  List<Message> get messages;

  /// Create a copy of RequestSummarizeConcerns
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestSummarizeConcernsImplCopyWith<_$RequestSummarizeConcernsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseSummarizeConcerns _$ResponseSummarizeConcernsFromJson(
    Map<String, dynamic> json) {
  return _ResponseSummarizeConcerns.fromJson(json);
}

/// @nodoc
mixin _$ResponseSummarizeConcerns {
  String get answer => throw _privateConstructorUsedError;
  bool? get done => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  List<String>? get keywords => throw _privateConstructorUsedError;

  /// Serializes this ResponseSummarizeConcerns to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseSummarizeConcerns
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseSummarizeConcernsCopyWith<ResponseSummarizeConcerns> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseSummarizeConcernsCopyWith<$Res> {
  factory $ResponseSummarizeConcernsCopyWith(ResponseSummarizeConcerns value,
          $Res Function(ResponseSummarizeConcerns) then) =
      _$ResponseSummarizeConcernsCopyWithImpl<$Res, ResponseSummarizeConcerns>;
  @useResult
  $Res call(
      {String answer,
      bool? done,
      String? title,
      String? category,
      List<String>? keywords});
}

/// @nodoc
class _$ResponseSummarizeConcernsCopyWithImpl<$Res,
        $Val extends ResponseSummarizeConcerns>
    implements $ResponseSummarizeConcernsCopyWith<$Res> {
  _$ResponseSummarizeConcernsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseSummarizeConcerns
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? done = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_value.copyWith(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseSummarizeConcernsImplCopyWith<$Res>
    implements $ResponseSummarizeConcernsCopyWith<$Res> {
  factory _$$ResponseSummarizeConcernsImplCopyWith(
          _$ResponseSummarizeConcernsImpl value,
          $Res Function(_$ResponseSummarizeConcernsImpl) then) =
      __$$ResponseSummarizeConcernsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String answer,
      bool? done,
      String? title,
      String? category,
      List<String>? keywords});
}

/// @nodoc
class __$$ResponseSummarizeConcernsImplCopyWithImpl<$Res>
    extends _$ResponseSummarizeConcernsCopyWithImpl<$Res,
        _$ResponseSummarizeConcernsImpl>
    implements _$$ResponseSummarizeConcernsImplCopyWith<$Res> {
  __$$ResponseSummarizeConcernsImplCopyWithImpl(
      _$ResponseSummarizeConcernsImpl _value,
      $Res Function(_$ResponseSummarizeConcernsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseSummarizeConcerns
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? done = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_$ResponseSummarizeConcernsImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseSummarizeConcernsImpl implements _ResponseSummarizeConcerns {
  const _$ResponseSummarizeConcernsImpl(
      {required this.answer,
      this.done,
      this.title,
      this.category,
      final List<String>? keywords})
      : _keywords = keywords;

  factory _$ResponseSummarizeConcernsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseSummarizeConcernsImplFromJson(json);

  @override
  final String answer;
  @override
  final bool? done;
  @override
  final String? title;
  @override
  final String? category;
  final List<String>? _keywords;
  @override
  List<String>? get keywords {
    final value = _keywords;
    if (value == null) return null;
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResponseSummarizeConcerns(answer: $answer, done: $done, title: $title, category: $category, keywords: $keywords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseSummarizeConcernsImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, answer, done, title, category,
      const DeepCollectionEquality().hash(_keywords));

  /// Create a copy of ResponseSummarizeConcerns
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseSummarizeConcernsImplCopyWith<_$ResponseSummarizeConcernsImpl>
      get copyWith => __$$ResponseSummarizeConcernsImplCopyWithImpl<
          _$ResponseSummarizeConcernsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseSummarizeConcernsImplToJson(
      this,
    );
  }
}

abstract class _ResponseSummarizeConcerns implements ResponseSummarizeConcerns {
  const factory _ResponseSummarizeConcerns(
      {required final String answer,
      final bool? done,
      final String? title,
      final String? category,
      final List<String>? keywords}) = _$ResponseSummarizeConcernsImpl;

  factory _ResponseSummarizeConcerns.fromJson(Map<String, dynamic> json) =
      _$ResponseSummarizeConcernsImpl.fromJson;

  @override
  String get answer;
  @override
  bool? get done;
  @override
  String? get title;
  @override
  String? get category;
  @override
  List<String>? get keywords;

  /// Create a copy of ResponseSummarizeConcerns
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseSummarizeConcernsImplCopyWith<_$ResponseSummarizeConcernsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
