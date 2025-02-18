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

CreateBlockRequest _$CreateBlockRequestFromJson(Map<String, dynamic> json) {
  return _CreateBlockRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateBlockRequest {
  @JsonKey(name: 'reported_id')
  int get reportedId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_id')
  int? get commentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'article_id')
  int? get articleId => throw _privateConstructorUsedError;

  /// Serializes this CreateBlockRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateBlockRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateBlockRequestCopyWith<CreateBlockRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBlockRequestCopyWith<$Res> {
  factory $CreateBlockRequestCopyWith(
          CreateBlockRequest value, $Res Function(CreateBlockRequest) then) =
      _$CreateBlockRequestCopyWithImpl<$Res, CreateBlockRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reported_id') int reportedId,
      String reason,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId});
}

/// @nodoc
class _$CreateBlockRequestCopyWithImpl<$Res, $Val extends CreateBlockRequest>
    implements $CreateBlockRequestCopyWith<$Res> {
  _$CreateBlockRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBlockRequest
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
abstract class _$$CreateBlockRequestImplCopyWith<$Res>
    implements $CreateBlockRequestCopyWith<$Res> {
  factory _$$CreateBlockRequestImplCopyWith(_$CreateBlockRequestImpl value,
          $Res Function(_$CreateBlockRequestImpl) then) =
      __$$CreateBlockRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reported_id') int reportedId,
      String reason,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId});
}

/// @nodoc
class __$$CreateBlockRequestImplCopyWithImpl<$Res>
    extends _$CreateBlockRequestCopyWithImpl<$Res, _$CreateBlockRequestImpl>
    implements _$$CreateBlockRequestImplCopyWith<$Res> {
  __$$CreateBlockRequestImplCopyWithImpl(_$CreateBlockRequestImpl _value,
      $Res Function(_$CreateBlockRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBlockRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportedId = null,
    Object? reason = null,
    Object? commentId = freezed,
    Object? articleId = freezed,
  }) {
    return _then(_$CreateBlockRequestImpl(
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
class _$CreateBlockRequestImpl implements _CreateBlockRequest {
  const _$CreateBlockRequestImpl(
      {@JsonKey(name: 'reported_id') required this.reportedId,
      required this.reason,
      @JsonKey(name: 'comment_id') this.commentId,
      @JsonKey(name: 'article_id') this.articleId});

  factory _$CreateBlockRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBlockRequestImplFromJson(json);

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
    return 'CreateBlockRequest(reportedId: $reportedId, reason: $reason, commentId: $commentId, articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBlockRequestImpl &&
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

  /// Create a copy of CreateBlockRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBlockRequestImplCopyWith<_$CreateBlockRequestImpl> get copyWith =>
      __$$CreateBlockRequestImplCopyWithImpl<_$CreateBlockRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBlockRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateBlockRequest implements CreateBlockRequest {
  const factory _CreateBlockRequest(
          {@JsonKey(name: 'reported_id') required final int reportedId,
          required final String reason,
          @JsonKey(name: 'comment_id') final int? commentId,
          @JsonKey(name: 'article_id') final int? articleId}) =
      _$CreateBlockRequestImpl;

  factory _CreateBlockRequest.fromJson(Map<String, dynamic> json) =
      _$CreateBlockRequestImpl.fromJson;

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

  /// Create a copy of CreateBlockRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBlockRequestImplCopyWith<_$CreateBlockRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
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

GetBlockResponse _$GetBlockResponseFromJson(Map<String, dynamic> json) {
  return _GetBlockResponse.fromJson(json);
}

/// @nodoc
mixin _$GetBlockResponse {
  UserBlockDTO get block => throw _privateConstructorUsedError;

  /// Serializes this GetBlockResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetBlockResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetBlockResponseCopyWith<GetBlockResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBlockResponseCopyWith<$Res> {
  factory $GetBlockResponseCopyWith(
          GetBlockResponse value, $Res Function(GetBlockResponse) then) =
      _$GetBlockResponseCopyWithImpl<$Res, GetBlockResponse>;
  @useResult
  $Res call({UserBlockDTO block});

  $UserBlockDTOCopyWith<$Res> get block;
}

/// @nodoc
class _$GetBlockResponseCopyWithImpl<$Res, $Val extends GetBlockResponse>
    implements $GetBlockResponseCopyWith<$Res> {
  _$GetBlockResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetBlockResponse
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

  /// Create a copy of GetBlockResponse
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
abstract class _$$GetBlockResponseImplCopyWith<$Res>
    implements $GetBlockResponseCopyWith<$Res> {
  factory _$$GetBlockResponseImplCopyWith(_$GetBlockResponseImpl value,
          $Res Function(_$GetBlockResponseImpl) then) =
      __$$GetBlockResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserBlockDTO block});

  @override
  $UserBlockDTOCopyWith<$Res> get block;
}

/// @nodoc
class __$$GetBlockResponseImplCopyWithImpl<$Res>
    extends _$GetBlockResponseCopyWithImpl<$Res, _$GetBlockResponseImpl>
    implements _$$GetBlockResponseImplCopyWith<$Res> {
  __$$GetBlockResponseImplCopyWithImpl(_$GetBlockResponseImpl _value,
      $Res Function(_$GetBlockResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetBlockResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? block = null,
  }) {
    return _then(_$GetBlockResponseImpl(
      block: null == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as UserBlockDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetBlockResponseImpl implements _GetBlockResponse {
  const _$GetBlockResponseImpl({required this.block});

  factory _$GetBlockResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetBlockResponseImplFromJson(json);

  @override
  final UserBlockDTO block;

  @override
  String toString() {
    return 'GetBlockResponse(block: $block)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBlockResponseImpl &&
            (identical(other.block, block) || other.block == block));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, block);

  /// Create a copy of GetBlockResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBlockResponseImplCopyWith<_$GetBlockResponseImpl> get copyWith =>
      __$$GetBlockResponseImplCopyWithImpl<_$GetBlockResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetBlockResponseImplToJson(
      this,
    );
  }
}

abstract class _GetBlockResponse implements GetBlockResponse {
  const factory _GetBlockResponse({required final UserBlockDTO block}) =
      _$GetBlockResponseImpl;

  factory _GetBlockResponse.fromJson(Map<String, dynamic> json) =
      _$GetBlockResponseImpl.fromJson;

  @override
  UserBlockDTO get block;

  /// Create a copy of GetBlockResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBlockResponseImplCopyWith<_$GetBlockResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetBlocksResponse _$GetBlocksResponseFromJson(Map<String, dynamic> json) {
  return _GetBlocksResponse.fromJson(json);
}

/// @nodoc
mixin _$GetBlocksResponse {
  List<UserBlockDTO> get blocks => throw _privateConstructorUsedError;

  /// Serializes this GetBlocksResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetBlocksResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetBlocksResponseCopyWith<GetBlocksResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBlocksResponseCopyWith<$Res> {
  factory $GetBlocksResponseCopyWith(
          GetBlocksResponse value, $Res Function(GetBlocksResponse) then) =
      _$GetBlocksResponseCopyWithImpl<$Res, GetBlocksResponse>;
  @useResult
  $Res call({List<UserBlockDTO> blocks});
}

/// @nodoc
class _$GetBlocksResponseCopyWithImpl<$Res, $Val extends GetBlocksResponse>
    implements $GetBlocksResponseCopyWith<$Res> {
  _$GetBlocksResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetBlocksResponse
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
abstract class _$$GetBlocksResponseImplCopyWith<$Res>
    implements $GetBlocksResponseCopyWith<$Res> {
  factory _$$GetBlocksResponseImplCopyWith(_$GetBlocksResponseImpl value,
          $Res Function(_$GetBlocksResponseImpl) then) =
      __$$GetBlocksResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserBlockDTO> blocks});
}

/// @nodoc
class __$$GetBlocksResponseImplCopyWithImpl<$Res>
    extends _$GetBlocksResponseCopyWithImpl<$Res, _$GetBlocksResponseImpl>
    implements _$$GetBlocksResponseImplCopyWith<$Res> {
  __$$GetBlocksResponseImplCopyWithImpl(_$GetBlocksResponseImpl _value,
      $Res Function(_$GetBlocksResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetBlocksResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocks = null,
  }) {
    return _then(_$GetBlocksResponseImpl(
      blocks: null == blocks
          ? _value._blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<UserBlockDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetBlocksResponseImpl implements _GetBlocksResponse {
  const _$GetBlocksResponseImpl({required final List<UserBlockDTO> blocks})
      : _blocks = blocks;

  factory _$GetBlocksResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetBlocksResponseImplFromJson(json);

  final List<UserBlockDTO> _blocks;
  @override
  List<UserBlockDTO> get blocks {
    if (_blocks is EqualUnmodifiableListView) return _blocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocks);
  }

  @override
  String toString() {
    return 'GetBlocksResponse(blocks: $blocks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBlocksResponseImpl &&
            const DeepCollectionEquality().equals(other._blocks, _blocks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_blocks));

  /// Create a copy of GetBlocksResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBlocksResponseImplCopyWith<_$GetBlocksResponseImpl> get copyWith =>
      __$$GetBlocksResponseImplCopyWithImpl<_$GetBlocksResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetBlocksResponseImplToJson(
      this,
    );
  }
}

abstract class _GetBlocksResponse implements GetBlocksResponse {
  const factory _GetBlocksResponse({required final List<UserBlockDTO> blocks}) =
      _$GetBlocksResponseImpl;

  factory _GetBlocksResponse.fromJson(Map<String, dynamic> json) =
      _$GetBlocksResponseImpl.fromJson;

  @override
  List<UserBlockDTO> get blocks;

  /// Create a copy of GetBlocksResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBlocksResponseImplCopyWith<_$GetBlocksResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
