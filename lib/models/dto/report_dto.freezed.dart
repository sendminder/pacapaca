// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestCreateUserReport _$RequestCreateUserReportFromJson(
    Map<String, dynamic> json) {
  return _CreateReportRequest.fromJson(json);
}

/// @nodoc
mixin _$RequestCreateUserReport {
  @JsonKey(name: 'reported_id')
  int get reportedId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_id')
  int? get commentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'article_id')
  int? get articleId => throw _privateConstructorUsedError;

  /// Serializes this RequestCreateUserReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestCreateUserReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestCreateUserReportCopyWith<RequestCreateUserReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCreateUserReportCopyWith<$Res> {
  factory $RequestCreateUserReportCopyWith(RequestCreateUserReport value,
          $Res Function(RequestCreateUserReport) then) =
      _$RequestCreateUserReportCopyWithImpl<$Res, RequestCreateUserReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reported_id') int reportedId,
      String reason,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId});
}

/// @nodoc
class _$RequestCreateUserReportCopyWithImpl<$Res,
        $Val extends RequestCreateUserReport>
    implements $RequestCreateUserReportCopyWith<$Res> {
  _$RequestCreateUserReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestCreateUserReport
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
abstract class _$$CreateReportRequestImplCopyWith<$Res>
    implements $RequestCreateUserReportCopyWith<$Res> {
  factory _$$CreateReportRequestImplCopyWith(_$CreateReportRequestImpl value,
          $Res Function(_$CreateReportRequestImpl) then) =
      __$$CreateReportRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reported_id') int reportedId,
      String reason,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId});
}

/// @nodoc
class __$$CreateReportRequestImplCopyWithImpl<$Res>
    extends _$RequestCreateUserReportCopyWithImpl<$Res,
        _$CreateReportRequestImpl>
    implements _$$CreateReportRequestImplCopyWith<$Res> {
  __$$CreateReportRequestImplCopyWithImpl(_$CreateReportRequestImpl _value,
      $Res Function(_$CreateReportRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestCreateUserReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportedId = null,
    Object? reason = null,
    Object? commentId = freezed,
    Object? articleId = freezed,
  }) {
    return _then(_$CreateReportRequestImpl(
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
class _$CreateReportRequestImpl implements _CreateReportRequest {
  const _$CreateReportRequestImpl(
      {@JsonKey(name: 'reported_id') required this.reportedId,
      required this.reason,
      @JsonKey(name: 'comment_id') this.commentId,
      @JsonKey(name: 'article_id') this.articleId});

  factory _$CreateReportRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReportRequestImplFromJson(json);

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
    return 'RequestCreateUserReport(reportedId: $reportedId, reason: $reason, commentId: $commentId, articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReportRequestImpl &&
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

  /// Create a copy of RequestCreateUserReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReportRequestImplCopyWith<_$CreateReportRequestImpl> get copyWith =>
      __$$CreateReportRequestImplCopyWithImpl<_$CreateReportRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReportRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateReportRequest implements RequestCreateUserReport {
  const factory _CreateReportRequest(
          {@JsonKey(name: 'reported_id') required final int reportedId,
          required final String reason,
          @JsonKey(name: 'comment_id') final int? commentId,
          @JsonKey(name: 'article_id') final int? articleId}) =
      _$CreateReportRequestImpl;

  factory _CreateReportRequest.fromJson(Map<String, dynamic> json) =
      _$CreateReportRequestImpl.fromJson;

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

  /// Create a copy of RequestCreateUserReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReportRequestImplCopyWith<_$CreateReportRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserReportDTO _$UserReportDTOFromJson(Map<String, dynamic> json) {
  return _UserReportDTO.fromJson(json);
}

/// @nodoc
mixin _$UserReportDTO {
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

  /// Serializes this UserReportDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserReportDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserReportDTOCopyWith<UserReportDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReportDTOCopyWith<$Res> {
  factory $UserReportDTOCopyWith(
          UserReportDTO value, $Res Function(UserReportDTO) then) =
      _$UserReportDTOCopyWithImpl<$Res, UserReportDTO>;
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
class _$UserReportDTOCopyWithImpl<$Res, $Val extends UserReportDTO>
    implements $UserReportDTOCopyWith<$Res> {
  _$UserReportDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserReportDTO
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
abstract class _$$UserReportDTOImplCopyWith<$Res>
    implements $UserReportDTOCopyWith<$Res> {
  factory _$$UserReportDTOImplCopyWith(
          _$UserReportDTOImpl value, $Res Function(_$UserReportDTOImpl) then) =
      __$$UserReportDTOImplCopyWithImpl<$Res>;
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
class __$$UserReportDTOImplCopyWithImpl<$Res>
    extends _$UserReportDTOCopyWithImpl<$Res, _$UserReportDTOImpl>
    implements _$$UserReportDTOImplCopyWith<$Res> {
  __$$UserReportDTOImplCopyWithImpl(
      _$UserReportDTOImpl _value, $Res Function(_$UserReportDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserReportDTO
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
    return _then(_$UserReportDTOImpl(
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
class _$UserReportDTOImpl implements _UserReportDTO {
  const _$UserReportDTOImpl(
      {required this.id,
      @JsonKey(name: 'reporter_id') required this.reporterId,
      @JsonKey(name: 'reported_id') required this.reportedId,
      required this.reason,
      required this.status,
      @JsonKey(name: 'comment_id') this.commentId,
      @JsonKey(name: 'article_id') this.articleId,
      @JsonKey(name: 'create_time') required this.createTime,
      @JsonKey(name: 'update_time') required this.updateTime});

  factory _$UserReportDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserReportDTOImplFromJson(json);

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
    return 'UserReportDTO(id: $id, reporterId: $reporterId, reportedId: $reportedId, reason: $reason, status: $status, commentId: $commentId, articleId: $articleId, createTime: $createTime, updateTime: $updateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserReportDTOImpl &&
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

  /// Create a copy of UserReportDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserReportDTOImplCopyWith<_$UserReportDTOImpl> get copyWith =>
      __$$UserReportDTOImplCopyWithImpl<_$UserReportDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserReportDTOImplToJson(
      this,
    );
  }
}

abstract class _UserReportDTO implements UserReportDTO {
  const factory _UserReportDTO(
          {required final int id,
          @JsonKey(name: 'reporter_id') required final int reporterId,
          @JsonKey(name: 'reported_id') required final int reportedId,
          required final String reason,
          required final String status,
          @JsonKey(name: 'comment_id') final int? commentId,
          @JsonKey(name: 'article_id') final int? articleId,
          @JsonKey(name: 'create_time') required final String createTime,
          @JsonKey(name: 'update_time') required final String updateTime}) =
      _$UserReportDTOImpl;

  factory _UserReportDTO.fromJson(Map<String, dynamic> json) =
      _$UserReportDTOImpl.fromJson;

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

  /// Create a copy of UserReportDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserReportDTOImplCopyWith<_$UserReportDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
