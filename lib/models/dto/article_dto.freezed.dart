// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArticleDTO _$ArticleDTOFromJson(Map<String, dynamic> json) {
  return _ArticleDTO.fromJson(json);
}

/// @nodoc
mixin _$ArticleDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String get createTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_time')
  String get updateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_count')
  int get viewCount => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_url')
  String get profileImageUrl => throw _privateConstructorUsedError;

  /// Serializes this ArticleDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArticleDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleDTOCopyWith<ArticleDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleDTOCopyWith<$Res> {
  factory $ArticleDTOCopyWith(
          ArticleDTO value, $Res Function(ArticleDTO) then) =
      _$ArticleDTOCopyWithImpl<$Res, ArticleDTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      String title,
      String content,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      List<String>? tags,
      @JsonKey(name: 'create_time') String createTime,
      @JsonKey(name: 'update_time') String updateTime,
      @JsonKey(name: 'like_count') int likeCount,
      @JsonKey(name: 'comment_count') int commentCount,
      @JsonKey(name: 'view_count') int viewCount,
      String nickname,
      @JsonKey(name: 'profile_image_url') String profileImageUrl});
}

/// @nodoc
class _$ArticleDTOCopyWithImpl<$Res, $Val extends ArticleDTO>
    implements $ArticleDTOCopyWith<$Res> {
  _$ArticleDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticleDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? tags = freezed,
    Object? createTime = null,
    Object? updateTime = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? viewCount = null,
    Object? nickname = null,
    Object? profileImageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$ArticleDTOImplCopyWith<$Res>
    implements $ArticleDTOCopyWith<$Res> {
  factory _$$ArticleDTOImplCopyWith(
          _$ArticleDTOImpl value, $Res Function(_$ArticleDTOImpl) then) =
      __$$ArticleDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      String title,
      String content,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      List<String>? tags,
      @JsonKey(name: 'create_time') String createTime,
      @JsonKey(name: 'update_time') String updateTime,
      @JsonKey(name: 'like_count') int likeCount,
      @JsonKey(name: 'comment_count') int commentCount,
      @JsonKey(name: 'view_count') int viewCount,
      String nickname,
      @JsonKey(name: 'profile_image_url') String profileImageUrl});
}

/// @nodoc
class __$$ArticleDTOImplCopyWithImpl<$Res>
    extends _$ArticleDTOCopyWithImpl<$Res, _$ArticleDTOImpl>
    implements _$$ArticleDTOImplCopyWith<$Res> {
  __$$ArticleDTOImplCopyWithImpl(
      _$ArticleDTOImpl _value, $Res Function(_$ArticleDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? tags = freezed,
    Object? createTime = null,
    Object? updateTime = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? viewCount = null,
    Object? nickname = null,
    Object? profileImageUrl = null,
  }) {
    return _then(_$ArticleDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$ArticleDTOImpl implements _ArticleDTO {
  const _$ArticleDTOImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.title,
      required this.content,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl,
      final List<String>? tags,
      @JsonKey(name: 'create_time') required this.createTime,
      @JsonKey(name: 'update_time') required this.updateTime,
      @JsonKey(name: 'like_count') required this.likeCount,
      @JsonKey(name: 'comment_count') required this.commentCount,
      @JsonKey(name: 'view_count') required this.viewCount,
      required this.nickname,
      @JsonKey(name: 'profile_image_url') required this.profileImageUrl})
      : _tags = tags;

  factory _$ArticleDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleDTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final String title;
  @override
  final String content;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'create_time')
  final String createTime;
  @override
  @JsonKey(name: 'update_time')
  final String updateTime;
  @override
  @JsonKey(name: 'like_count')
  final int likeCount;
  @override
  @JsonKey(name: 'comment_count')
  final int commentCount;
  @override
  @JsonKey(name: 'view_count')
  final int viewCount;
  @override
  final String nickname;
  @override
  @JsonKey(name: 'profile_image_url')
  final String profileImageUrl;

  @override
  String toString() {
    return 'ArticleDTO(id: $id, userId: $userId, title: $title, content: $content, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, tags: $tags, createTime: $createTime, updateTime: $updateTime, likeCount: $likeCount, commentCount: $commentCount, viewCount: $viewCount, nickname: $nickname, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      content,
      imageUrl,
      thumbnailUrl,
      const DeepCollectionEquality().hash(_tags),
      createTime,
      updateTime,
      likeCount,
      commentCount,
      viewCount,
      nickname,
      profileImageUrl);

  /// Create a copy of ArticleDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleDTOImplCopyWith<_$ArticleDTOImpl> get copyWith =>
      __$$ArticleDTOImplCopyWithImpl<_$ArticleDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleDTOImplToJson(
      this,
    );
  }
}

abstract class _ArticleDTO implements ArticleDTO {
  const factory _ArticleDTO(
      {required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      required final String title,
      required final String content,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'thumbnail_url') final String? thumbnailUrl,
      final List<String>? tags,
      @JsonKey(name: 'create_time') required final String createTime,
      @JsonKey(name: 'update_time') required final String updateTime,
      @JsonKey(name: 'like_count') required final int likeCount,
      @JsonKey(name: 'comment_count') required final int commentCount,
      @JsonKey(name: 'view_count') required final int viewCount,
      required final String nickname,
      @JsonKey(name: 'profile_image_url')
      required final String profileImageUrl}) = _$ArticleDTOImpl;

  factory _ArticleDTO.fromJson(Map<String, dynamic> json) =
      _$ArticleDTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl;
  @override
  List<String>? get tags;
  @override
  @JsonKey(name: 'create_time')
  String get createTime;
  @override
  @JsonKey(name: 'update_time')
  String get updateTime;
  @override
  @JsonKey(name: 'like_count')
  int get likeCount;
  @override
  @JsonKey(name: 'comment_count')
  int get commentCount;
  @override
  @JsonKey(name: 'view_count')
  int get viewCount;
  @override
  String get nickname;
  @override
  @JsonKey(name: 'profile_image_url')
  String get profileImageUrl;

  /// Create a copy of ArticleDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleDTOImplCopyWith<_$ArticleDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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

CreateArticleRequest _$CreateArticleRequestFromJson(Map<String, dynamic> json) {
  return _CreateArticleRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateArticleRequest {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this CreateArticleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateArticleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateArticleRequestCopyWith<CreateArticleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateArticleRequestCopyWith<$Res> {
  factory $CreateArticleRequestCopyWith(CreateArticleRequest value,
          $Res Function(CreateArticleRequest) then) =
      _$CreateArticleRequestCopyWithImpl<$Res, CreateArticleRequest>;
  @useResult
  $Res call(
      {String title,
      String content,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      List<String>? tags,
      String? category});
}

/// @nodoc
class _$CreateArticleRequestCopyWithImpl<$Res,
        $Val extends CreateArticleRequest>
    implements $CreateArticleRequestCopyWith<$Res> {
  _$CreateArticleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateArticleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? tags = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateArticleRequestImplCopyWith<$Res>
    implements $CreateArticleRequestCopyWith<$Res> {
  factory _$$CreateArticleRequestImplCopyWith(_$CreateArticleRequestImpl value,
          $Res Function(_$CreateArticleRequestImpl) then) =
      __$$CreateArticleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String content,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      List<String>? tags,
      String? category});
}

/// @nodoc
class __$$CreateArticleRequestImplCopyWithImpl<$Res>
    extends _$CreateArticleRequestCopyWithImpl<$Res, _$CreateArticleRequestImpl>
    implements _$$CreateArticleRequestImplCopyWith<$Res> {
  __$$CreateArticleRequestImplCopyWithImpl(_$CreateArticleRequestImpl _value,
      $Res Function(_$CreateArticleRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateArticleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? tags = freezed,
    Object? category = freezed,
  }) {
    return _then(_$CreateArticleRequestImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateArticleRequestImpl implements _CreateArticleRequest {
  const _$CreateArticleRequestImpl(
      {required this.title,
      required this.content,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl,
      final List<String>? tags,
      this.category})
      : _tags = tags;

  factory _$CreateArticleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateArticleRequestImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? category;

  @override
  String toString() {
    return 'CreateArticleRequest(title: $title, content: $content, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, tags: $tags, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateArticleRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, imageUrl,
      thumbnailUrl, const DeepCollectionEquality().hash(_tags), category);

  /// Create a copy of CreateArticleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateArticleRequestImplCopyWith<_$CreateArticleRequestImpl>
      get copyWith =>
          __$$CreateArticleRequestImplCopyWithImpl<_$CreateArticleRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateArticleRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateArticleRequest implements CreateArticleRequest {
  const factory _CreateArticleRequest(
      {required final String title,
      required final String content,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'thumbnail_url') final String? thumbnailUrl,
      final List<String>? tags,
      final String? category}) = _$CreateArticleRequestImpl;

  factory _CreateArticleRequest.fromJson(Map<String, dynamic> json) =
      _$CreateArticleRequestImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl;
  @override
  List<String>? get tags;
  @override
  String? get category;

  /// Create a copy of CreateArticleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateArticleRequestImplCopyWith<_$CreateArticleRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateArticleRequest _$UpdateArticleRequestFromJson(Map<String, dynamic> json) {
  return _UpdateArticleRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateArticleRequest {
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this UpdateArticleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateArticleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateArticleRequestCopyWith<UpdateArticleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateArticleRequestCopyWith<$Res> {
  factory $UpdateArticleRequestCopyWith(UpdateArticleRequest value,
          $Res Function(UpdateArticleRequest) then) =
      _$UpdateArticleRequestCopyWithImpl<$Res, UpdateArticleRequest>;
  @useResult
  $Res call(
      {String? title,
      String? content,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      List<String>? tags,
      String? category});
}

/// @nodoc
class _$UpdateArticleRequestCopyWithImpl<$Res,
        $Val extends UpdateArticleRequest>
    implements $UpdateArticleRequestCopyWith<$Res> {
  _$UpdateArticleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateArticleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? tags = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateArticleRequestImplCopyWith<$Res>
    implements $UpdateArticleRequestCopyWith<$Res> {
  factory _$$UpdateArticleRequestImplCopyWith(_$UpdateArticleRequestImpl value,
          $Res Function(_$UpdateArticleRequestImpl) then) =
      __$$UpdateArticleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? content,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      List<String>? tags,
      String? category});
}

/// @nodoc
class __$$UpdateArticleRequestImplCopyWithImpl<$Res>
    extends _$UpdateArticleRequestCopyWithImpl<$Res, _$UpdateArticleRequestImpl>
    implements _$$UpdateArticleRequestImplCopyWith<$Res> {
  __$$UpdateArticleRequestImplCopyWithImpl(_$UpdateArticleRequestImpl _value,
      $Res Function(_$UpdateArticleRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateArticleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? tags = freezed,
    Object? category = freezed,
  }) {
    return _then(_$UpdateArticleRequestImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateArticleRequestImpl implements _UpdateArticleRequest {
  const _$UpdateArticleRequestImpl(
      {this.title,
      this.content,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl,
      final List<String>? tags,
      this.category})
      : _tags = tags;

  factory _$UpdateArticleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateArticleRequestImplFromJson(json);

  @override
  final String? title;
  @override
  final String? content;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? category;

  @override
  String toString() {
    return 'UpdateArticleRequest(title: $title, content: $content, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, tags: $tags, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateArticleRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, imageUrl,
      thumbnailUrl, const DeepCollectionEquality().hash(_tags), category);

  /// Create a copy of UpdateArticleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateArticleRequestImplCopyWith<_$UpdateArticleRequestImpl>
      get copyWith =>
          __$$UpdateArticleRequestImplCopyWithImpl<_$UpdateArticleRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateArticleRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateArticleRequest implements UpdateArticleRequest {
  const factory _UpdateArticleRequest(
      {final String? title,
      final String? content,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'thumbnail_url') final String? thumbnailUrl,
      final List<String>? tags,
      final String? category}) = _$UpdateArticleRequestImpl;

  factory _UpdateArticleRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateArticleRequestImpl.fromJson;

  @override
  String? get title;
  @override
  String? get content;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl;
  @override
  List<String>? get tags;
  @override
  String? get category;

  /// Create a copy of UpdateArticleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateArticleRequestImplCopyWith<_$UpdateArticleRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateCommentRequest _$CreateCommentRequestFromJson(Map<String, dynamic> json) {
  return _CreateCommentRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateCommentRequest {
  String get content => throw _privateConstructorUsedError;

  /// Serializes this CreateCommentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateCommentRequestCopyWith<CreateCommentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCommentRequestCopyWith<$Res> {
  factory $CreateCommentRequestCopyWith(CreateCommentRequest value,
          $Res Function(CreateCommentRequest) then) =
      _$CreateCommentRequestCopyWithImpl<$Res, CreateCommentRequest>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class _$CreateCommentRequestCopyWithImpl<$Res,
        $Val extends CreateCommentRequest>
    implements $CreateCommentRequestCopyWith<$Res> {
  _$CreateCommentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateCommentRequest
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
abstract class _$$CreateCommentRequestImplCopyWith<$Res>
    implements $CreateCommentRequestCopyWith<$Res> {
  factory _$$CreateCommentRequestImplCopyWith(_$CreateCommentRequestImpl value,
          $Res Function(_$CreateCommentRequestImpl) then) =
      __$$CreateCommentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$CreateCommentRequestImplCopyWithImpl<$Res>
    extends _$CreateCommentRequestCopyWithImpl<$Res, _$CreateCommentRequestImpl>
    implements _$$CreateCommentRequestImplCopyWith<$Res> {
  __$$CreateCommentRequestImplCopyWithImpl(_$CreateCommentRequestImpl _value,
      $Res Function(_$CreateCommentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$CreateCommentRequestImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateCommentRequestImpl implements _CreateCommentRequest {
  const _$CreateCommentRequestImpl({required this.content});

  factory _$CreateCommentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateCommentRequestImplFromJson(json);

  @override
  final String content;

  @override
  String toString() {
    return 'CreateCommentRequest(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCommentRequestImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of CreateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCommentRequestImplCopyWith<_$CreateCommentRequestImpl>
      get copyWith =>
          __$$CreateCommentRequestImplCopyWithImpl<_$CreateCommentRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateCommentRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateCommentRequest implements CreateCommentRequest {
  const factory _CreateCommentRequest({required final String content}) =
      _$CreateCommentRequestImpl;

  factory _CreateCommentRequest.fromJson(Map<String, dynamic> json) =
      _$CreateCommentRequestImpl.fromJson;

  @override
  String get content;

  /// Create a copy of CreateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateCommentRequestImplCopyWith<_$CreateCommentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateCommentRequest _$UpdateCommentRequestFromJson(Map<String, dynamic> json) {
  return _UpdateCommentRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateCommentRequest {
  String get content => throw _privateConstructorUsedError;

  /// Serializes this UpdateCommentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateCommentRequestCopyWith<UpdateCommentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCommentRequestCopyWith<$Res> {
  factory $UpdateCommentRequestCopyWith(UpdateCommentRequest value,
          $Res Function(UpdateCommentRequest) then) =
      _$UpdateCommentRequestCopyWithImpl<$Res, UpdateCommentRequest>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class _$UpdateCommentRequestCopyWithImpl<$Res,
        $Val extends UpdateCommentRequest>
    implements $UpdateCommentRequestCopyWith<$Res> {
  _$UpdateCommentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateCommentRequest
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
abstract class _$$UpdateCommentRequestImplCopyWith<$Res>
    implements $UpdateCommentRequestCopyWith<$Res> {
  factory _$$UpdateCommentRequestImplCopyWith(_$UpdateCommentRequestImpl value,
          $Res Function(_$UpdateCommentRequestImpl) then) =
      __$$UpdateCommentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$UpdateCommentRequestImplCopyWithImpl<$Res>
    extends _$UpdateCommentRequestCopyWithImpl<$Res, _$UpdateCommentRequestImpl>
    implements _$$UpdateCommentRequestImplCopyWith<$Res> {
  __$$UpdateCommentRequestImplCopyWithImpl(_$UpdateCommentRequestImpl _value,
      $Res Function(_$UpdateCommentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$UpdateCommentRequestImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateCommentRequestImpl implements _UpdateCommentRequest {
  const _$UpdateCommentRequestImpl({required this.content});

  factory _$UpdateCommentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateCommentRequestImplFromJson(json);

  @override
  final String content;

  @override
  String toString() {
    return 'UpdateCommentRequest(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCommentRequestImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of UpdateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCommentRequestImplCopyWith<_$UpdateCommentRequestImpl>
      get copyWith =>
          __$$UpdateCommentRequestImplCopyWithImpl<_$UpdateCommentRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCommentRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateCommentRequest implements UpdateCommentRequest {
  const factory _UpdateCommentRequest({required final String content}) =
      _$UpdateCommentRequestImpl;

  factory _UpdateCommentRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateCommentRequestImpl.fromJson;

  @override
  String get content;

  /// Create a copy of UpdateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateCommentRequestImplCopyWith<_$UpdateCommentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ListArticlesRequest _$ListArticlesRequestFromJson(Map<String, dynamic> json) {
  return _ListArticlesRequest.fromJson(json);
}

/// @nodoc
mixin _$ListArticlesRequest {
  @JsonKey(name: 'sort_by')
  String get sortBy => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'paging_key')
  int? get pagingKey => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this ListArticlesRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListArticlesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListArticlesRequestCopyWith<ListArticlesRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListArticlesRequestCopyWith<$Res> {
  factory $ListArticlesRequestCopyWith(
          ListArticlesRequest value, $Res Function(ListArticlesRequest) then) =
      _$ListArticlesRequestCopyWithImpl<$Res, ListArticlesRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sort_by') String sortBy,
      int limit,
      @JsonKey(name: 'paging_key') int? pagingKey,
      String? category});
}

/// @nodoc
class _$ListArticlesRequestCopyWithImpl<$Res, $Val extends ListArticlesRequest>
    implements $ListArticlesRequestCopyWith<$Res> {
  _$ListArticlesRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListArticlesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortBy = null,
    Object? limit = null,
    Object? pagingKey = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListArticlesRequestImplCopyWith<$Res>
    implements $ListArticlesRequestCopyWith<$Res> {
  factory _$$ListArticlesRequestImplCopyWith(_$ListArticlesRequestImpl value,
          $Res Function(_$ListArticlesRequestImpl) then) =
      __$$ListArticlesRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sort_by') String sortBy,
      int limit,
      @JsonKey(name: 'paging_key') int? pagingKey,
      String? category});
}

/// @nodoc
class __$$ListArticlesRequestImplCopyWithImpl<$Res>
    extends _$ListArticlesRequestCopyWithImpl<$Res, _$ListArticlesRequestImpl>
    implements _$$ListArticlesRequestImplCopyWith<$Res> {
  __$$ListArticlesRequestImplCopyWithImpl(_$ListArticlesRequestImpl _value,
      $Res Function(_$ListArticlesRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListArticlesRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortBy = null,
    Object? limit = null,
    Object? pagingKey = freezed,
    Object? category = freezed,
  }) {
    return _then(_$ListArticlesRequestImpl(
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListArticlesRequestImpl implements _ListArticlesRequest {
  const _$ListArticlesRequestImpl(
      {@JsonKey(name: 'sort_by') required this.sortBy,
      required this.limit,
      @JsonKey(name: 'paging_key') this.pagingKey,
      this.category});

  factory _$ListArticlesRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListArticlesRequestImplFromJson(json);

  @override
  @JsonKey(name: 'sort_by')
  final String sortBy;
  @override
  final int limit;
  @override
  @JsonKey(name: 'paging_key')
  final int? pagingKey;
  @override
  final String? category;

  @override
  String toString() {
    return 'ListArticlesRequest(sortBy: $sortBy, limit: $limit, pagingKey: $pagingKey, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListArticlesRequestImpl &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.pagingKey, pagingKey) ||
                other.pagingKey == pagingKey) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sortBy, limit, pagingKey, category);

  /// Create a copy of ListArticlesRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListArticlesRequestImplCopyWith<_$ListArticlesRequestImpl> get copyWith =>
      __$$ListArticlesRequestImplCopyWithImpl<_$ListArticlesRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListArticlesRequestImplToJson(
      this,
    );
  }
}

abstract class _ListArticlesRequest implements ListArticlesRequest {
  const factory _ListArticlesRequest(
      {@JsonKey(name: 'sort_by') required final String sortBy,
      required final int limit,
      @JsonKey(name: 'paging_key') final int? pagingKey,
      final String? category}) = _$ListArticlesRequestImpl;

  factory _ListArticlesRequest.fromJson(Map<String, dynamic> json) =
      _$ListArticlesRequestImpl.fromJson;

  @override
  @JsonKey(name: 'sort_by')
  String get sortBy;
  @override
  int get limit;
  @override
  @JsonKey(name: 'paging_key')
  int? get pagingKey;
  @override
  String? get category;

  /// Create a copy of ListArticlesRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListArticlesRequestImplCopyWith<_$ListArticlesRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetArticleResponse _$GetArticleResponseFromJson(Map<String, dynamic> json) {
  return _GetArticleResponse.fromJson(json);
}

/// @nodoc
mixin _$GetArticleResponse {
  ArticleDTO get article => throw _privateConstructorUsedError;

  /// Serializes this GetArticleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetArticleResponseCopyWith<GetArticleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetArticleResponseCopyWith<$Res> {
  factory $GetArticleResponseCopyWith(
          GetArticleResponse value, $Res Function(GetArticleResponse) then) =
      _$GetArticleResponseCopyWithImpl<$Res, GetArticleResponse>;
  @useResult
  $Res call({ArticleDTO article});

  $ArticleDTOCopyWith<$Res> get article;
}

/// @nodoc
class _$GetArticleResponseCopyWithImpl<$Res, $Val extends GetArticleResponse>
    implements $GetArticleResponseCopyWith<$Res> {
  _$GetArticleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = null,
  }) {
    return _then(_value.copyWith(
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ArticleDTO,
    ) as $Val);
  }

  /// Create a copy of GetArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArticleDTOCopyWith<$Res> get article {
    return $ArticleDTOCopyWith<$Res>(_value.article, (value) {
      return _then(_value.copyWith(article: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetArticleResponseImplCopyWith<$Res>
    implements $GetArticleResponseCopyWith<$Res> {
  factory _$$GetArticleResponseImplCopyWith(_$GetArticleResponseImpl value,
          $Res Function(_$GetArticleResponseImpl) then) =
      __$$GetArticleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ArticleDTO article});

  @override
  $ArticleDTOCopyWith<$Res> get article;
}

/// @nodoc
class __$$GetArticleResponseImplCopyWithImpl<$Res>
    extends _$GetArticleResponseCopyWithImpl<$Res, _$GetArticleResponseImpl>
    implements _$$GetArticleResponseImplCopyWith<$Res> {
  __$$GetArticleResponseImplCopyWithImpl(_$GetArticleResponseImpl _value,
      $Res Function(_$GetArticleResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = null,
  }) {
    return _then(_$GetArticleResponseImpl(
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ArticleDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetArticleResponseImpl implements _GetArticleResponse {
  const _$GetArticleResponseImpl({required this.article});

  factory _$GetArticleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetArticleResponseImplFromJson(json);

  @override
  final ArticleDTO article;

  @override
  String toString() {
    return 'GetArticleResponse(article: $article)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetArticleResponseImpl &&
            (identical(other.article, article) || other.article == article));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, article);

  /// Create a copy of GetArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetArticleResponseImplCopyWith<_$GetArticleResponseImpl> get copyWith =>
      __$$GetArticleResponseImplCopyWithImpl<_$GetArticleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetArticleResponseImplToJson(
      this,
    );
  }
}

abstract class _GetArticleResponse implements GetArticleResponse {
  const factory _GetArticleResponse({required final ArticleDTO article}) =
      _$GetArticleResponseImpl;

  factory _GetArticleResponse.fromJson(Map<String, dynamic> json) =
      _$GetArticleResponseImpl.fromJson;

  @override
  ArticleDTO get article;

  /// Create a copy of GetArticleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetArticleResponseImplCopyWith<_$GetArticleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListArticlesResponse _$ListArticlesResponseFromJson(Map<String, dynamic> json) {
  return _ListArticlesResponse.fromJson(json);
}

/// @nodoc
mixin _$ListArticlesResponse {
  List<ArticleDTO> get articles => throw _privateConstructorUsedError;

  /// Serializes this ListArticlesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListArticlesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListArticlesResponseCopyWith<ListArticlesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListArticlesResponseCopyWith<$Res> {
  factory $ListArticlesResponseCopyWith(ListArticlesResponse value,
          $Res Function(ListArticlesResponse) then) =
      _$ListArticlesResponseCopyWithImpl<$Res, ListArticlesResponse>;
  @useResult
  $Res call({List<ArticleDTO> articles});
}

/// @nodoc
class _$ListArticlesResponseCopyWithImpl<$Res,
        $Val extends ListArticlesResponse>
    implements $ListArticlesResponseCopyWith<$Res> {
  _$ListArticlesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListArticlesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListArticlesResponseImplCopyWith<$Res>
    implements $ListArticlesResponseCopyWith<$Res> {
  factory _$$ListArticlesResponseImplCopyWith(_$ListArticlesResponseImpl value,
          $Res Function(_$ListArticlesResponseImpl) then) =
      __$$ListArticlesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ArticleDTO> articles});
}

/// @nodoc
class __$$ListArticlesResponseImplCopyWithImpl<$Res>
    extends _$ListArticlesResponseCopyWithImpl<$Res, _$ListArticlesResponseImpl>
    implements _$$ListArticlesResponseImplCopyWith<$Res> {
  __$$ListArticlesResponseImplCopyWithImpl(_$ListArticlesResponseImpl _value,
      $Res Function(_$ListArticlesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListArticlesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_$ListArticlesResponseImpl(
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListArticlesResponseImpl implements _ListArticlesResponse {
  const _$ListArticlesResponseImpl({required final List<ArticleDTO> articles})
      : _articles = articles;

  factory _$ListArticlesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListArticlesResponseImplFromJson(json);

  final List<ArticleDTO> _articles;
  @override
  List<ArticleDTO> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'ListArticlesResponse(articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListArticlesResponseImpl &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  /// Create a copy of ListArticlesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListArticlesResponseImplCopyWith<_$ListArticlesResponseImpl>
      get copyWith =>
          __$$ListArticlesResponseImplCopyWithImpl<_$ListArticlesResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListArticlesResponseImplToJson(
      this,
    );
  }
}

abstract class _ListArticlesResponse implements ListArticlesResponse {
  const factory _ListArticlesResponse(
      {required final List<ArticleDTO> articles}) = _$ListArticlesResponseImpl;

  factory _ListArticlesResponse.fromJson(Map<String, dynamic> json) =
      _$ListArticlesResponseImpl.fromJson;

  @override
  List<ArticleDTO> get articles;

  /// Create a copy of ListArticlesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListArticlesResponseImplCopyWith<_$ListArticlesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ArticleCommentsResponse _$ArticleCommentsResponseFromJson(
    Map<String, dynamic> json) {
  return _ArticleCommentsResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticleCommentsResponse {
  List<ArticleCommentDTO> get comments => throw _privateConstructorUsedError;

  /// Serializes this ArticleCommentsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArticleCommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleCommentsResponseCopyWith<ArticleCommentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCommentsResponseCopyWith<$Res> {
  factory $ArticleCommentsResponseCopyWith(ArticleCommentsResponse value,
          $Res Function(ArticleCommentsResponse) then) =
      _$ArticleCommentsResponseCopyWithImpl<$Res, ArticleCommentsResponse>;
  @useResult
  $Res call({List<ArticleCommentDTO> comments});
}

/// @nodoc
class _$ArticleCommentsResponseCopyWithImpl<$Res,
        $Val extends ArticleCommentsResponse>
    implements $ArticleCommentsResponseCopyWith<$Res> {
  _$ArticleCommentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticleCommentsResponse
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
abstract class _$$ArticleCommentsResponseImplCopyWith<$Res>
    implements $ArticleCommentsResponseCopyWith<$Res> {
  factory _$$ArticleCommentsResponseImplCopyWith(
          _$ArticleCommentsResponseImpl value,
          $Res Function(_$ArticleCommentsResponseImpl) then) =
      __$$ArticleCommentsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ArticleCommentDTO> comments});
}

/// @nodoc
class __$$ArticleCommentsResponseImplCopyWithImpl<$Res>
    extends _$ArticleCommentsResponseCopyWithImpl<$Res,
        _$ArticleCommentsResponseImpl>
    implements _$$ArticleCommentsResponseImplCopyWith<$Res> {
  __$$ArticleCommentsResponseImplCopyWithImpl(
      _$ArticleCommentsResponseImpl _value,
      $Res Function(_$ArticleCommentsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleCommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
  }) {
    return _then(_$ArticleCommentsResponseImpl(
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ArticleCommentDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleCommentsResponseImpl implements _ArticleCommentsResponse {
  const _$ArticleCommentsResponseImpl(
      {required final List<ArticleCommentDTO> comments})
      : _comments = comments;

  factory _$ArticleCommentsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleCommentsResponseImplFromJson(json);

  final List<ArticleCommentDTO> _comments;
  @override
  List<ArticleCommentDTO> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'ArticleCommentsResponse(comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleCommentsResponseImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  /// Create a copy of ArticleCommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleCommentsResponseImplCopyWith<_$ArticleCommentsResponseImpl>
      get copyWith => __$$ArticleCommentsResponseImplCopyWithImpl<
          _$ArticleCommentsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleCommentsResponseImplToJson(
      this,
    );
  }
}

abstract class _ArticleCommentsResponse implements ArticleCommentsResponse {
  const factory _ArticleCommentsResponse(
          {required final List<ArticleCommentDTO> comments}) =
      _$ArticleCommentsResponseImpl;

  factory _ArticleCommentsResponse.fromJson(Map<String, dynamic> json) =
      _$ArticleCommentsResponseImpl.fromJson;

  @override
  List<ArticleCommentDTO> get comments;

  /// Create a copy of ArticleCommentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleCommentsResponseImplCopyWith<_$ArticleCommentsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
