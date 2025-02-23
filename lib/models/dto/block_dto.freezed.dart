// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestCreateUserBlock _$RequestCreateUserBlockFromJson(
    Map<String, dynamic> json) {
  return _RequestCreateUserBlock.fromJson(json);
}

/// @nodoc
mixin _$RequestCreateUserBlock {
  @JsonKey(name: 'reported_id')
  int get reportedId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_id')
  int? get commentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'article_id')
  int? get articleId => throw _privateConstructorUsedError;

  /// Serializes this RequestCreateUserBlock to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestCreateUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestCreateUserBlockCopyWith<RequestCreateUserBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCreateUserBlockCopyWith<$Res> {
  factory $RequestCreateUserBlockCopyWith(RequestCreateUserBlock value,
          $Res Function(RequestCreateUserBlock) then) =
      _$RequestCreateUserBlockCopyWithImpl<$Res, RequestCreateUserBlock>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reported_id') int reportedId,
      String reason,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId});
}

/// @nodoc
class _$RequestCreateUserBlockCopyWithImpl<$Res,
        $Val extends RequestCreateUserBlock>
    implements $RequestCreateUserBlockCopyWith<$Res> {
  _$RequestCreateUserBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestCreateUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportedId = null,
    Object? reason = null,
    Object? commentId = freezed,
    Object? articleId = freezed,
  }) {
    return _then(_value.copyWith(
      reportedId: null == reportedId
          ? _value.reportedId
          : reportedId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestCreateUserBlockImplCopyWith<$Res>
    implements $RequestCreateUserBlockCopyWith<$Res> {
  factory _$$RequestCreateUserBlockImplCopyWith(
          _$RequestCreateUserBlockImpl value,
          $Res Function(_$RequestCreateUserBlockImpl) then) =
      __$$RequestCreateUserBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reported_id') int reportedId,
      String reason,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId});
}

/// @nodoc
class __$$RequestCreateUserBlockImplCopyWithImpl<$Res>
    extends _$RequestCreateUserBlockCopyWithImpl<$Res,
        _$RequestCreateUserBlockImpl>
    implements _$$RequestCreateUserBlockImplCopyWith<$Res> {
  __$$RequestCreateUserBlockImplCopyWithImpl(
      _$RequestCreateUserBlockImpl _value,
      $Res Function(_$RequestCreateUserBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestCreateUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportedId = null,
    Object? reason = null,
    Object? commentId = freezed,
    Object? articleId = freezed,
  }) {
    return _then(_$RequestCreateUserBlockImpl(
      reportedId: null == reportedId
          ? _value.reportedId
          : reportedId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestCreateUserBlockImpl implements _RequestCreateUserBlock {
  const _$RequestCreateUserBlockImpl(
      {@JsonKey(name: 'reported_id') required this.reportedId,
      required this.reason,
      @JsonKey(name: 'comment_id') this.commentId,
      @JsonKey(name: 'article_id') this.articleId});

  factory _$RequestCreateUserBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestCreateUserBlockImplFromJson(json);

  @override
  @JsonKey(name: 'reported_id')
  final int reportedId;
  @override
  final String reason;
  @override
  @JsonKey(name: 'comment_id')
  final int? commentId;
  @override
  @JsonKey(name: 'article_id')
  final int? articleId;

  @override
  String toString() {
    return 'RequestCreateUserBlock(reportedId: $reportedId, reason: $reason, commentId: $commentId, articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestCreateUserBlockImpl &&
            (identical(other.reportedId, reportedId) ||
                other.reportedId == reportedId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reportedId, reason, commentId, articleId);

  /// Create a copy of RequestCreateUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestCreateUserBlockImplCopyWith<_$RequestCreateUserBlockImpl>
      get copyWith => __$$RequestCreateUserBlockImplCopyWithImpl<
          _$RequestCreateUserBlockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestCreateUserBlockImplToJson(
      this,
    );
  }
}

abstract class _RequestCreateUserBlock implements RequestCreateUserBlock {
  const factory _RequestCreateUserBlock(
          {@JsonKey(name: 'reported_id') required final int reportedId,
          required final String reason,
          @JsonKey(name: 'comment_id') final int? commentId,
          @JsonKey(name: 'article_id') final int? articleId}) =
      _$RequestCreateUserBlockImpl;

  factory _RequestCreateUserBlock.fromJson(Map<String, dynamic> json) =
      _$RequestCreateUserBlockImpl.fromJson;

  @override
  @JsonKey(name: 'reported_id')
  int get reportedId;
  @override
  String get reason;
  @override
  @JsonKey(name: 'comment_id')
  int? get commentId;
  @override
  @JsonKey(name: 'article_id')
  int? get articleId;

  /// Create a copy of RequestCreateUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestCreateUserBlockImplCopyWith<_$RequestCreateUserBlockImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserBlockDTO _$UserBlockDTOFromJson(Map<String, dynamic> json) {
  return _UserBlockDTO.fromJson(json);
}

/// @nodoc
mixin _$UserBlockDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'reporter_id')
  int get reporterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'reported_id')
  int get reportedId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_id')
  int? get commentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'article_id')
  int? get articleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String get createTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_time')
  String get updateTime => throw _privateConstructorUsedError;

  /// Serializes this UserBlockDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBlockDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBlockDTOCopyWith<UserBlockDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockDTOCopyWith<$Res> {
  factory $UserBlockDTOCopyWith(
          UserBlockDTO value, $Res Function(UserBlockDTO) then) =
      _$UserBlockDTOCopyWithImpl<$Res, UserBlockDTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'reporter_id') int reporterId,
      @JsonKey(name: 'reported_id') int reportedId,
      String reason,
      String status,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId,
      @JsonKey(name: 'create_time') String createTime,
      @JsonKey(name: 'update_time') String updateTime});
}

/// @nodoc
class _$UserBlockDTOCopyWithImpl<$Res, $Val extends UserBlockDTO>
    implements $UserBlockDTOCopyWith<$Res> {
  _$UserBlockDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBlockDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reporterId = null,
    Object? reportedId = null,
    Object? reason = null,
    Object? status = null,
    Object? commentId = freezed,
    Object? articleId = freezed,
    Object? createTime = null,
    Object? updateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reporterId: null == reporterId
          ? _value.reporterId
          : reporterId // ignore: cast_nullable_to_non_nullable
              as int,
      reportedId: null == reportedId
          ? _value.reportedId
          : reportedId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBlockDTOImplCopyWith<$Res>
    implements $UserBlockDTOCopyWith<$Res> {
  factory _$$UserBlockDTOImplCopyWith(
          _$UserBlockDTOImpl value, $Res Function(_$UserBlockDTOImpl) then) =
      __$$UserBlockDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'reporter_id') int reporterId,
      @JsonKey(name: 'reported_id') int reportedId,
      String reason,
      String status,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId,
      @JsonKey(name: 'create_time') String createTime,
      @JsonKey(name: 'update_time') String updateTime});
}

/// @nodoc
class __$$UserBlockDTOImplCopyWithImpl<$Res>
    extends _$UserBlockDTOCopyWithImpl<$Res, _$UserBlockDTOImpl>
    implements _$$UserBlockDTOImplCopyWith<$Res> {
  __$$UserBlockDTOImplCopyWithImpl(
      _$UserBlockDTOImpl _value, $Res Function(_$UserBlockDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBlockDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reporterId = null,
    Object? reportedId = null,
    Object? reason = null,
    Object? status = null,
    Object? commentId = freezed,
    Object? articleId = freezed,
    Object? createTime = null,
    Object? updateTime = null,
  }) {
    return _then(_$UserBlockDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reporterId: null == reporterId
          ? _value.reporterId
          : reporterId // ignore: cast_nullable_to_non_nullable
              as int,
      reportedId: null == reportedId
          ? _value.reportedId
          : reportedId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBlockDTOImpl implements _UserBlockDTO {
  const _$UserBlockDTOImpl(
      {required this.id,
      @JsonKey(name: 'reporter_id') required this.reporterId,
      @JsonKey(name: 'reported_id') required this.reportedId,
      required this.reason,
      required this.status,
      @JsonKey(name: 'comment_id') this.commentId,
      @JsonKey(name: 'article_id') this.articleId,
      @JsonKey(name: 'create_time') required this.createTime,
      @JsonKey(name: 'update_time') required this.updateTime});

  factory _$UserBlockDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBlockDTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'reporter_id')
  final int reporterId;
  @override
  @JsonKey(name: 'reported_id')
  final int reportedId;
  @override
  final String reason;
  @override
  final String status;
  @override
  @JsonKey(name: 'comment_id')
  final int? commentId;
  @override
  @JsonKey(name: 'article_id')
  final int? articleId;
  @override
  @JsonKey(name: 'create_time')
  final String createTime;
  @override
  @JsonKey(name: 'update_time')
  final String updateTime;

  @override
  String toString() {
    return 'UserBlockDTO(id: $id, reporterId: $reporterId, reportedId: $reportedId, reason: $reason, status: $status, commentId: $commentId, articleId: $articleId, createTime: $createTime, updateTime: $updateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBlockDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reporterId, reporterId) ||
                other.reporterId == reporterId) &&
            (identical(other.reportedId, reportedId) ||
                other.reportedId == reportedId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, reporterId, reportedId,
      reason, status, commentId, articleId, createTime, updateTime);

  /// Create a copy of UserBlockDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBlockDTOImplCopyWith<_$UserBlockDTOImpl> get copyWith =>
      __$$UserBlockDTOImplCopyWithImpl<_$UserBlockDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBlockDTOImplToJson(
      this,
    );
  }
}

abstract class _UserBlockDTO implements UserBlockDTO {
  const factory _UserBlockDTO(
          {required final int id,
          @JsonKey(name: 'reporter_id') required final int reporterId,
          @JsonKey(name: 'reported_id') required final int reportedId,
          required final String reason,
          required final String status,
          @JsonKey(name: 'comment_id') final int? commentId,
          @JsonKey(name: 'article_id') final int? articleId,
          @JsonKey(name: 'create_time') required final String createTime,
          @JsonKey(name: 'update_time') required final String updateTime}) =
      _$UserBlockDTOImpl;

  factory _UserBlockDTO.fromJson(Map<String, dynamic> json) =
      _$UserBlockDTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'reporter_id')
  int get reporterId;
  @override
  @JsonKey(name: 'reported_id')
  int get reportedId;
  @override
  String get reason;
  @override
  String get status;
  @override
  @JsonKey(name: 'comment_id')
  int? get commentId;
  @override
  @JsonKey(name: 'article_id')
  int? get articleId;
  @override
  @JsonKey(name: 'create_time')
  String get createTime;
  @override
  @JsonKey(name: 'update_time')
  String get updateTime;

  /// Create a copy of UserBlockDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBlockDTOImplCopyWith<_$UserBlockDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseUserBlock _$ResponseUserBlockFromJson(Map<String, dynamic> json) {
  return _ResponseUserBlock.fromJson(json);
}

/// @nodoc
mixin _$ResponseUserBlock {
  UserBlockDTO get block => throw _privateConstructorUsedError;

  /// Serializes this ResponseUserBlock to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseUserBlockCopyWith<ResponseUserBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseUserBlockCopyWith<$Res> {
  factory $ResponseUserBlockCopyWith(
          ResponseUserBlock value, $Res Function(ResponseUserBlock) then) =
      _$ResponseUserBlockCopyWithImpl<$Res, ResponseUserBlock>;
  @useResult
  $Res call({UserBlockDTO block});

  $UserBlockDTOCopyWith<$Res> get block;
}

/// @nodoc
class _$ResponseUserBlockCopyWithImpl<$Res, $Val extends ResponseUserBlock>
    implements $ResponseUserBlockCopyWith<$Res> {
  _$ResponseUserBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? block = null,
  }) {
    return _then(_value.copyWith(
      block: null == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as UserBlockDTO,
    ) as $Val);
  }

  /// Create a copy of ResponseUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserBlockDTOCopyWith<$Res> get block {
    return $UserBlockDTOCopyWith<$Res>(_value.block, (value) {
      return _then(_value.copyWith(block: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseUserBlockImplCopyWith<$Res>
    implements $ResponseUserBlockCopyWith<$Res> {
  factory _$$ResponseUserBlockImplCopyWith(_$ResponseUserBlockImpl value,
          $Res Function(_$ResponseUserBlockImpl) then) =
      __$$ResponseUserBlockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserBlockDTO block});

  @override
  $UserBlockDTOCopyWith<$Res> get block;
}

/// @nodoc
class __$$ResponseUserBlockImplCopyWithImpl<$Res>
    extends _$ResponseUserBlockCopyWithImpl<$Res, _$ResponseUserBlockImpl>
    implements _$$ResponseUserBlockImplCopyWith<$Res> {
  __$$ResponseUserBlockImplCopyWithImpl(_$ResponseUserBlockImpl _value,
      $Res Function(_$ResponseUserBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? block = null,
  }) {
    return _then(_$ResponseUserBlockImpl(
      block: null == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as UserBlockDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseUserBlockImpl implements _ResponseUserBlock {
  const _$ResponseUserBlockImpl({required this.block});

  factory _$ResponseUserBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseUserBlockImplFromJson(json);

  @override
  final UserBlockDTO block;

  @override
  String toString() {
    return 'ResponseUserBlock(block: $block)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseUserBlockImpl &&
            (identical(other.block, block) || other.block == block));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, block);

  /// Create a copy of ResponseUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseUserBlockImplCopyWith<_$ResponseUserBlockImpl> get copyWith =>
      __$$ResponseUserBlockImplCopyWithImpl<_$ResponseUserBlockImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseUserBlockImplToJson(
      this,
    );
  }
}

abstract class _ResponseUserBlock implements ResponseUserBlock {
  const factory _ResponseUserBlock({required final UserBlockDTO block}) =
      _$ResponseUserBlockImpl;

  factory _ResponseUserBlock.fromJson(Map<String, dynamic> json) =
      _$ResponseUserBlockImpl.fromJson;

  @override
  UserBlockDTO get block;

  /// Create a copy of ResponseUserBlock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseUserBlockImplCopyWith<_$ResponseUserBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseUserBlocks _$ResponseUserBlocksFromJson(Map<String, dynamic> json) {
  return _ResponseUserBlocks.fromJson(json);
}

/// @nodoc
mixin _$ResponseUserBlocks {
  List<UserBlockDTO> get blocks => throw _privateConstructorUsedError;

  /// Serializes this ResponseUserBlocks to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseUserBlocks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseUserBlocksCopyWith<ResponseUserBlocks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseUserBlocksCopyWith<$Res> {
  factory $ResponseUserBlocksCopyWith(
          ResponseUserBlocks value, $Res Function(ResponseUserBlocks) then) =
      _$ResponseUserBlocksCopyWithImpl<$Res, ResponseUserBlocks>;
  @useResult
  $Res call({List<UserBlockDTO> blocks});
}

/// @nodoc
class _$ResponseUserBlocksCopyWithImpl<$Res, $Val extends ResponseUserBlocks>
    implements $ResponseUserBlocksCopyWith<$Res> {
  _$ResponseUserBlocksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseUserBlocks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocks = null,
  }) {
    return _then(_value.copyWith(
      blocks: null == blocks
          ? _value.blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<UserBlockDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseUserBlocksImplCopyWith<$Res>
    implements $ResponseUserBlocksCopyWith<$Res> {
  factory _$$ResponseUserBlocksImplCopyWith(_$ResponseUserBlocksImpl value,
          $Res Function(_$ResponseUserBlocksImpl) then) =
      __$$ResponseUserBlocksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserBlockDTO> blocks});
}

/// @nodoc
class __$$ResponseUserBlocksImplCopyWithImpl<$Res>
    extends _$ResponseUserBlocksCopyWithImpl<$Res, _$ResponseUserBlocksImpl>
    implements _$$ResponseUserBlocksImplCopyWith<$Res> {
  __$$ResponseUserBlocksImplCopyWithImpl(_$ResponseUserBlocksImpl _value,
      $Res Function(_$ResponseUserBlocksImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseUserBlocks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocks = null,
  }) {
    return _then(_$ResponseUserBlocksImpl(
      blocks: null == blocks
          ? _value._blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<UserBlockDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseUserBlocksImpl implements _ResponseUserBlocks {
  const _$ResponseUserBlocksImpl({required final List<UserBlockDTO> blocks})
      : _blocks = blocks;

  factory _$ResponseUserBlocksImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseUserBlocksImplFromJson(json);

  final List<UserBlockDTO> _blocks;
  @override
  List<UserBlockDTO> get blocks {
    if (_blocks is EqualUnmodifiableListView) return _blocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocks);
  }

  @override
  String toString() {
    return 'ResponseUserBlocks(blocks: $blocks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseUserBlocksImpl &&
            const DeepCollectionEquality().equals(other._blocks, _blocks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_blocks));

  /// Create a copy of ResponseUserBlocks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseUserBlocksImplCopyWith<_$ResponseUserBlocksImpl> get copyWith =>
      __$$ResponseUserBlocksImplCopyWithImpl<_$ResponseUserBlocksImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseUserBlocksImplToJson(
      this,
    );
  }
}

abstract class _ResponseUserBlocks implements ResponseUserBlocks {
  const factory _ResponseUserBlocks(
      {required final List<UserBlockDTO> blocks}) = _$ResponseUserBlocksImpl;

  factory _ResponseUserBlocks.fromJson(Map<String, dynamic> json) =
      _$ResponseUserBlocksImpl.fromJson;

  @override
  List<UserBlockDTO> get blocks;

  /// Create a copy of ResponseUserBlocks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseUserBlocksImplCopyWith<_$ResponseUserBlocksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
