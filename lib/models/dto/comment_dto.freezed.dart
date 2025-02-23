// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArticleCommentDTO _$ArticleCommentDTOFromJson(Map<String, dynamic> json) {
  return _ArticleCommentDTO.fromJson(json);
}

/// @nodoc
mixin _$ArticleCommentDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'article_id')
  int get articleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String get createTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_time')
  String get updateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'delete_time')
  String? get deleteTime => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_url')
  String get profileImageUrl => throw _privateConstructorUsedError;

  /// Serializes this ArticleCommentDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArticleCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleCommentDTOCopyWith<ArticleCommentDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCommentDTOCopyWith<$Res> {
  factory $ArticleCommentDTOCopyWith(
          ArticleCommentDTO value, $Res Function(ArticleCommentDTO) then) =
      _$ArticleCommentDTOCopyWithImpl<$Res, ArticleCommentDTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'article_id') int articleId,
      @JsonKey(name: 'user_id') int userId,
      String content,
      @JsonKey(name: 'create_time') String createTime,
      @JsonKey(name: 'update_time') String updateTime,
      @JsonKey(name: 'delete_time') String? deleteTime,
      String nickname,
      @JsonKey(name: 'profile_image_url') String profileImageUrl});
}

/// @nodoc
class _$ArticleCommentDTOCopyWithImpl<$Res, $Val extends ArticleCommentDTO>
    implements $ArticleCommentDTOCopyWith<$Res> {
  _$ArticleCommentDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticleCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? articleId = null,
    Object? userId = null,
    Object? content = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? deleteTime = freezed,
    Object? nickname = null,
    Object? profileImageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      articleId: null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
      deleteTime: freezed == deleteTime
          ? _value.deleteTime
          : deleteTime // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleCommentDTOImplCopyWith<$Res>
    implements $ArticleCommentDTOCopyWith<$Res> {
  factory _$$ArticleCommentDTOImplCopyWith(_$ArticleCommentDTOImpl value,
          $Res Function(_$ArticleCommentDTOImpl) then) =
      __$$ArticleCommentDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'article_id') int articleId,
      @JsonKey(name: 'user_id') int userId,
      String content,
      @JsonKey(name: 'create_time') String createTime,
      @JsonKey(name: 'update_time') String updateTime,
      @JsonKey(name: 'delete_time') String? deleteTime,
      String nickname,
      @JsonKey(name: 'profile_image_url') String profileImageUrl});
}

/// @nodoc
class __$$ArticleCommentDTOImplCopyWithImpl<$Res>
    extends _$ArticleCommentDTOCopyWithImpl<$Res, _$ArticleCommentDTOImpl>
    implements _$$ArticleCommentDTOImplCopyWith<$Res> {
  __$$ArticleCommentDTOImplCopyWithImpl(_$ArticleCommentDTOImpl _value,
      $Res Function(_$ArticleCommentDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? articleId = null,
    Object? userId = null,
    Object? content = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? deleteTime = freezed,
    Object? nickname = null,
    Object? profileImageUrl = null,
  }) {
    return _then(_$ArticleCommentDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      articleId: null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
      deleteTime: freezed == deleteTime
          ? _value.deleteTime
          : deleteTime // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleCommentDTOImpl implements _ArticleCommentDTO {
  const _$ArticleCommentDTOImpl(
      {required this.id,
      @JsonKey(name: 'article_id') required this.articleId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.content,
      @JsonKey(name: 'create_time') required this.createTime,
      @JsonKey(name: 'update_time') required this.updateTime,
      @JsonKey(name: 'delete_time') this.deleteTime,
      required this.nickname,
      @JsonKey(name: 'profile_image_url') required this.profileImageUrl});

  factory _$ArticleCommentDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleCommentDTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'article_id')
  final int articleId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final String content;
  @override
  @JsonKey(name: 'create_time')
  final String createTime;
  @override
  @JsonKey(name: 'update_time')
  final String updateTime;
  @override
  @JsonKey(name: 'delete_time')
  final String? deleteTime;
  @override
  final String nickname;
  @override
  @JsonKey(name: 'profile_image_url')
  final String profileImageUrl;

  @override
  String toString() {
    return 'ArticleCommentDTO(id: $id, articleId: $articleId, userId: $userId, content: $content, createTime: $createTime, updateTime: $updateTime, deleteTime: $deleteTime, nickname: $nickname, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleCommentDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.deleteTime, deleteTime) ||
                other.deleteTime == deleteTime) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, articleId, userId, content,
      createTime, updateTime, deleteTime, nickname, profileImageUrl);

  /// Create a copy of ArticleCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleCommentDTOImplCopyWith<_$ArticleCommentDTOImpl> get copyWith =>
      __$$ArticleCommentDTOImplCopyWithImpl<_$ArticleCommentDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleCommentDTOImplToJson(
      this,
    );
  }
}

abstract class _ArticleCommentDTO implements ArticleCommentDTO {
  const factory _ArticleCommentDTO(
      {required final int id,
      @JsonKey(name: 'article_id') required final int articleId,
      @JsonKey(name: 'user_id') required final int userId,
      required final String content,
      @JsonKey(name: 'create_time') required final String createTime,
      @JsonKey(name: 'update_time') required final String updateTime,
      @JsonKey(name: 'delete_time') final String? deleteTime,
      required final String nickname,
      @JsonKey(name: 'profile_image_url')
      required final String profileImageUrl}) = _$ArticleCommentDTOImpl;

  factory _ArticleCommentDTO.fromJson(Map<String, dynamic> json) =
      _$ArticleCommentDTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'article_id')
  int get articleId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  String get content;
  @override
  @JsonKey(name: 'create_time')
  String get createTime;
  @override
  @JsonKey(name: 'update_time')
  String get updateTime;
  @override
  @JsonKey(name: 'delete_time')
  String? get deleteTime;
  @override
  String get nickname;
  @override
  @JsonKey(name: 'profile_image_url')
  String get profileImageUrl;

  /// Create a copy of ArticleCommentDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleCommentDTOImplCopyWith<_$ArticleCommentDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseGetComment _$ResponseGetCommentFromJson(Map<String, dynamic> json) {
  return _ResponseGetComment.fromJson(json);
}

/// @nodoc
mixin _$ResponseGetComment {
  ArticleCommentDTO get comment => throw _privateConstructorUsedError;

  /// Serializes this ResponseGetComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseGetComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseGetCommentCopyWith<ResponseGetComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseGetCommentCopyWith<$Res> {
  factory $ResponseGetCommentCopyWith(
          ResponseGetComment value, $Res Function(ResponseGetComment) then) =
      _$ResponseGetCommentCopyWithImpl<$Res, ResponseGetComment>;
  @useResult
  $Res call({ArticleCommentDTO comment});

  $ArticleCommentDTOCopyWith<$Res> get comment;
}

/// @nodoc
class _$ResponseGetCommentCopyWithImpl<$Res, $Val extends ResponseGetComment>
    implements $ResponseGetCommentCopyWith<$Res> {
  _$ResponseGetCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseGetComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as ArticleCommentDTO,
    ) as $Val);
  }

  /// Create a copy of ResponseGetComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArticleCommentDTOCopyWith<$Res> get comment {
    return $ArticleCommentDTOCopyWith<$Res>(_value.comment, (value) {
      return _then(_value.copyWith(comment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseGetCommentImplCopyWith<$Res>
    implements $ResponseGetCommentCopyWith<$Res> {
  factory _$$ResponseGetCommentImplCopyWith(_$ResponseGetCommentImpl value,
          $Res Function(_$ResponseGetCommentImpl) then) =
      __$$ResponseGetCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ArticleCommentDTO comment});

  @override
  $ArticleCommentDTOCopyWith<$Res> get comment;
}

/// @nodoc
class __$$ResponseGetCommentImplCopyWithImpl<$Res>
    extends _$ResponseGetCommentCopyWithImpl<$Res, _$ResponseGetCommentImpl>
    implements _$$ResponseGetCommentImplCopyWith<$Res> {
  __$$ResponseGetCommentImplCopyWithImpl(_$ResponseGetCommentImpl _value,
      $Res Function(_$ResponseGetCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseGetComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_$ResponseGetCommentImpl(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as ArticleCommentDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseGetCommentImpl implements _ResponseGetComment {
  const _$ResponseGetCommentImpl({required this.comment});

  factory _$ResponseGetCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseGetCommentImplFromJson(json);

  @override
  final ArticleCommentDTO comment;

  @override
  String toString() {
    return 'ResponseGetComment(comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseGetCommentImpl &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, comment);

  /// Create a copy of ResponseGetComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseGetCommentImplCopyWith<_$ResponseGetCommentImpl> get copyWith =>
      __$$ResponseGetCommentImplCopyWithImpl<_$ResponseGetCommentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseGetCommentImplToJson(
      this,
    );
  }
}

abstract class _ResponseGetComment implements ResponseGetComment {
  const factory _ResponseGetComment(
      {required final ArticleCommentDTO comment}) = _$ResponseGetCommentImpl;

  factory _ResponseGetComment.fromJson(Map<String, dynamic> json) =
      _$ResponseGetCommentImpl.fromJson;

  @override
  ArticleCommentDTO get comment;

  /// Create a copy of ResponseGetComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseGetCommentImplCopyWith<_$ResponseGetCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseListComments _$ResponseListCommentsFromJson(Map<String, dynamic> json) {
  return _ResponseListComments.fromJson(json);
}

/// @nodoc
mixin _$ResponseListComments {
  List<ArticleCommentDTO> get comments => throw _privateConstructorUsedError;

  /// Serializes this ResponseListComments to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseListComments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseListCommentsCopyWith<ResponseListComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseListCommentsCopyWith<$Res> {
  factory $ResponseListCommentsCopyWith(ResponseListComments value,
          $Res Function(ResponseListComments) then) =
      _$ResponseListCommentsCopyWithImpl<$Res, ResponseListComments>;
  @useResult
  $Res call({List<ArticleCommentDTO> comments});
}

/// @nodoc
class _$ResponseListCommentsCopyWithImpl<$Res,
        $Val extends ResponseListComments>
    implements $ResponseListCommentsCopyWith<$Res> {
  _$ResponseListCommentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseListComments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ArticleCommentDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseListCommentsImplCopyWith<$Res>
    implements $ResponseListCommentsCopyWith<$Res> {
  factory _$$ResponseListCommentsImplCopyWith(_$ResponseListCommentsImpl value,
          $Res Function(_$ResponseListCommentsImpl) then) =
      __$$ResponseListCommentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ArticleCommentDTO> comments});
}

/// @nodoc
class __$$ResponseListCommentsImplCopyWithImpl<$Res>
    extends _$ResponseListCommentsCopyWithImpl<$Res, _$ResponseListCommentsImpl>
    implements _$$ResponseListCommentsImplCopyWith<$Res> {
  __$$ResponseListCommentsImplCopyWithImpl(_$ResponseListCommentsImpl _value,
      $Res Function(_$ResponseListCommentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseListComments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
  }) {
    return _then(_$ResponseListCommentsImpl(
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ArticleCommentDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseListCommentsImpl implements _ResponseListComments {
  const _$ResponseListCommentsImpl(
      {required final List<ArticleCommentDTO> comments})
      : _comments = comments;

  factory _$ResponseListCommentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseListCommentsImplFromJson(json);

  final List<ArticleCommentDTO> _comments;
  @override
  List<ArticleCommentDTO> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'ResponseListComments(comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseListCommentsImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  /// Create a copy of ResponseListComments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseListCommentsImplCopyWith<_$ResponseListCommentsImpl>
      get copyWith =>
          __$$ResponseListCommentsImplCopyWithImpl<_$ResponseListCommentsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseListCommentsImplToJson(
      this,
    );
  }
}

abstract class _ResponseListComments implements ResponseListComments {
  const factory _ResponseListComments(
          {required final List<ArticleCommentDTO> comments}) =
      _$ResponseListCommentsImpl;

  factory _ResponseListComments.fromJson(Map<String, dynamic> json) =
      _$ResponseListCommentsImpl.fromJson;

  @override
  List<ArticleCommentDTO> get comments;

  /// Create a copy of ResponseListComments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseListCommentsImplCopyWith<_$ResponseListCommentsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestUpdateComment _$RequestUpdateCommentFromJson(Map<String, dynamic> json) {
  return _RequestUpdateComment.fromJson(json);
}

/// @nodoc
mixin _$RequestUpdateComment {
  String get content => throw _privateConstructorUsedError;

  /// Serializes this RequestUpdateComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestUpdateComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestUpdateCommentCopyWith<RequestUpdateComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestUpdateCommentCopyWith<$Res> {
  factory $RequestUpdateCommentCopyWith(RequestUpdateComment value,
          $Res Function(RequestUpdateComment) then) =
      _$RequestUpdateCommentCopyWithImpl<$Res, RequestUpdateComment>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class _$RequestUpdateCommentCopyWithImpl<$Res,
        $Val extends RequestUpdateComment>
    implements $RequestUpdateCommentCopyWith<$Res> {
  _$RequestUpdateCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestUpdateComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestUpdateCommentImplCopyWith<$Res>
    implements $RequestUpdateCommentCopyWith<$Res> {
  factory _$$RequestUpdateCommentImplCopyWith(_$RequestUpdateCommentImpl value,
          $Res Function(_$RequestUpdateCommentImpl) then) =
      __$$RequestUpdateCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$RequestUpdateCommentImplCopyWithImpl<$Res>
    extends _$RequestUpdateCommentCopyWithImpl<$Res, _$RequestUpdateCommentImpl>
    implements _$$RequestUpdateCommentImplCopyWith<$Res> {
  __$$RequestUpdateCommentImplCopyWithImpl(_$RequestUpdateCommentImpl _value,
      $Res Function(_$RequestUpdateCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestUpdateComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$RequestUpdateCommentImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestUpdateCommentImpl implements _RequestUpdateComment {
  const _$RequestUpdateCommentImpl({required this.content});

  factory _$RequestUpdateCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestUpdateCommentImplFromJson(json);

  @override
  final String content;

  @override
  String toString() {
    return 'RequestUpdateComment(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestUpdateCommentImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of RequestUpdateComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestUpdateCommentImplCopyWith<_$RequestUpdateCommentImpl>
      get copyWith =>
          __$$RequestUpdateCommentImplCopyWithImpl<_$RequestUpdateCommentImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestUpdateCommentImplToJson(
      this,
    );
  }
}

abstract class _RequestUpdateComment implements RequestUpdateComment {
  const factory _RequestUpdateComment({required final String content}) =
      _$RequestUpdateCommentImpl;

  factory _RequestUpdateComment.fromJson(Map<String, dynamic> json) =
      _$RequestUpdateCommentImpl.fromJson;

  @override
  String get content;

  /// Create a copy of RequestUpdateComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestUpdateCommentImplCopyWith<_$RequestUpdateCommentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestCreateComment _$RequestCreateCommentFromJson(Map<String, dynamic> json) {
  return _RequestCreateComment.fromJson(json);
}

/// @nodoc
mixin _$RequestCreateComment {
  String get content => throw _privateConstructorUsedError;

  /// Serializes this RequestCreateComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestCreateComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestCreateCommentCopyWith<RequestCreateComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCreateCommentCopyWith<$Res> {
  factory $RequestCreateCommentCopyWith(RequestCreateComment value,
          $Res Function(RequestCreateComment) then) =
      _$RequestCreateCommentCopyWithImpl<$Res, RequestCreateComment>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class _$RequestCreateCommentCopyWithImpl<$Res,
        $Val extends RequestCreateComment>
    implements $RequestCreateCommentCopyWith<$Res> {
  _$RequestCreateCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestCreateComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestCreateCommentImplCopyWith<$Res>
    implements $RequestCreateCommentCopyWith<$Res> {
  factory _$$RequestCreateCommentImplCopyWith(_$RequestCreateCommentImpl value,
          $Res Function(_$RequestCreateCommentImpl) then) =
      __$$RequestCreateCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$RequestCreateCommentImplCopyWithImpl<$Res>
    extends _$RequestCreateCommentCopyWithImpl<$Res, _$RequestCreateCommentImpl>
    implements _$$RequestCreateCommentImplCopyWith<$Res> {
  __$$RequestCreateCommentImplCopyWithImpl(_$RequestCreateCommentImpl _value,
      $Res Function(_$RequestCreateCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestCreateComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$RequestCreateCommentImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestCreateCommentImpl implements _RequestCreateComment {
  const _$RequestCreateCommentImpl({required this.content});

  factory _$RequestCreateCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestCreateCommentImplFromJson(json);

  @override
  final String content;

  @override
  String toString() {
    return 'RequestCreateComment(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestCreateCommentImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of RequestCreateComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestCreateCommentImplCopyWith<_$RequestCreateCommentImpl>
      get copyWith =>
          __$$RequestCreateCommentImplCopyWithImpl<_$RequestCreateCommentImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestCreateCommentImplToJson(
      this,
    );
  }
}

abstract class _RequestCreateComment implements RequestCreateComment {
  const factory _RequestCreateComment({required final String content}) =
      _$RequestCreateCommentImpl;

  factory _RequestCreateComment.fromJson(Map<String, dynamic> json) =
      _$RequestCreateCommentImpl.fromJson;

  @override
  String get content;

  /// Create a copy of RequestCreateComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestCreateCommentImplCopyWith<_$RequestCreateCommentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
