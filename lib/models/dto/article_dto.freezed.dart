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
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String get createTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_time')
  String get updateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_count')
  int get viewCount => throw _privateConstructorUsedError; // 유저 정보
  @JsonKey(name: 'display_user')
  DisplayUserDTO get displayUser =>
      throw _privateConstructorUsedError; // 현재 유저가 좋아요를 눌렀는지 여부
  @JsonKey(name: 'is_liked')
  bool get isLiked => throw _privateConstructorUsedError;

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
      String? category,
      @JsonKey(name: 'create_time') String createTime,
      @JsonKey(name: 'update_time') String updateTime,
      @JsonKey(name: 'like_count') int likeCount,
      @JsonKey(name: 'comment_count') int commentCount,
      @JsonKey(name: 'view_count') int viewCount,
      @JsonKey(name: 'display_user') DisplayUserDTO displayUser,
      @JsonKey(name: 'is_liked') bool isLiked});

  $DisplayUserDTOCopyWith<$Res> get displayUser;
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
    Object? category = freezed,
    Object? createTime = null,
    Object? updateTime = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? viewCount = null,
    Object? displayUser = null,
    Object? isLiked = null,
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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
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
      displayUser: null == displayUser
          ? _value.displayUser
          : displayUser // ignore: cast_nullable_to_non_nullable
              as DisplayUserDTO,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ArticleDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisplayUserDTOCopyWith<$Res> get displayUser {
    return $DisplayUserDTOCopyWith<$Res>(_value.displayUser, (value) {
      return _then(_value.copyWith(displayUser: value) as $Val);
    });
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
      String? category,
      @JsonKey(name: 'create_time') String createTime,
      @JsonKey(name: 'update_time') String updateTime,
      @JsonKey(name: 'like_count') int likeCount,
      @JsonKey(name: 'comment_count') int commentCount,
      @JsonKey(name: 'view_count') int viewCount,
      @JsonKey(name: 'display_user') DisplayUserDTO displayUser,
      @JsonKey(name: 'is_liked') bool isLiked});

  @override
  $DisplayUserDTOCopyWith<$Res> get displayUser;
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
    Object? category = freezed,
    Object? createTime = null,
    Object? updateTime = null,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? viewCount = null,
    Object? displayUser = null,
    Object? isLiked = null,
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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
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
      displayUser: null == displayUser
          ? _value.displayUser
          : displayUser // ignore: cast_nullable_to_non_nullable
              as DisplayUserDTO,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
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
      this.category,
      @JsonKey(name: 'create_time') required this.createTime,
      @JsonKey(name: 'update_time') required this.updateTime,
      @JsonKey(name: 'like_count') required this.likeCount,
      @JsonKey(name: 'comment_count') required this.commentCount,
      @JsonKey(name: 'view_count') required this.viewCount,
      @JsonKey(name: 'display_user') required this.displayUser,
      @JsonKey(name: 'is_liked') required this.isLiked})
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
  final String? category;
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
// 유저 정보
  @override
  @JsonKey(name: 'display_user')
  final DisplayUserDTO displayUser;
// 현재 유저가 좋아요를 눌렀는지 여부
  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;

  @override
  String toString() {
    return 'ArticleDTO(id: $id, userId: $userId, title: $title, content: $content, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, tags: $tags, category: $category, createTime: $createTime, updateTime: $updateTime, likeCount: $likeCount, commentCount: $commentCount, viewCount: $viewCount, displayUser: $displayUser, isLiked: $isLiked)';
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
            (identical(other.category, category) ||
                other.category == category) &&
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
            (identical(other.displayUser, displayUser) ||
                other.displayUser == displayUser) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
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
      category,
      createTime,
      updateTime,
      likeCount,
      commentCount,
      viewCount,
      displayUser,
      isLiked);

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
      final String? category,
      @JsonKey(name: 'create_time') required final String createTime,
      @JsonKey(name: 'update_time') required final String updateTime,
      @JsonKey(name: 'like_count') required final int likeCount,
      @JsonKey(name: 'comment_count') required final int commentCount,
      @JsonKey(name: 'view_count') required final int viewCount,
      @JsonKey(name: 'display_user') required final DisplayUserDTO displayUser,
      @JsonKey(name: 'is_liked')
      required final bool isLiked}) = _$ArticleDTOImpl;

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
  String? get category;
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
  int get viewCount; // 유저 정보
  @override
  @JsonKey(name: 'display_user')
  DisplayUserDTO get displayUser; // 현재 유저가 좋아요를 눌렀는지 여부
  @override
  @JsonKey(name: 'is_liked')
  bool get isLiked;

  /// Create a copy of ArticleDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleDTOImplCopyWith<_$ArticleDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestCreateArticle _$RequestCreateArticleFromJson(Map<String, dynamic> json) {
  return _RequestCreateArticle.fromJson(json);
}

/// @nodoc
mixin _$RequestCreateArticle {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'reply_pacappi')
  bool? get replyPacappi => throw _privateConstructorUsedError;
  @JsonKey(name: 'reply_pacappu')
  bool? get replyPacappu => throw _privateConstructorUsedError;

  /// Serializes this RequestCreateArticle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestCreateArticle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestCreateArticleCopyWith<RequestCreateArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCreateArticleCopyWith<$Res> {
  factory $RequestCreateArticleCopyWith(RequestCreateArticle value,
          $Res Function(RequestCreateArticle) then) =
      _$RequestCreateArticleCopyWithImpl<$Res, RequestCreateArticle>;
  @useResult
  $Res call(
      {String title,
      String content,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      List<String>? tags,
      String? category,
      @JsonKey(name: 'reply_pacappi') bool? replyPacappi,
      @JsonKey(name: 'reply_pacappu') bool? replyPacappu});
}

/// @nodoc
class _$RequestCreateArticleCopyWithImpl<$Res,
        $Val extends RequestCreateArticle>
    implements $RequestCreateArticleCopyWith<$Res> {
  _$RequestCreateArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestCreateArticle
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
    Object? replyPacappi = freezed,
    Object? replyPacappu = freezed,
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
      replyPacappi: freezed == replyPacappi
          ? _value.replyPacappi
          : replyPacappi // ignore: cast_nullable_to_non_nullable
              as bool?,
      replyPacappu: freezed == replyPacappu
          ? _value.replyPacappu
          : replyPacappu // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestCreateArticleImplCopyWith<$Res>
    implements $RequestCreateArticleCopyWith<$Res> {
  factory _$$RequestCreateArticleImplCopyWith(_$RequestCreateArticleImpl value,
          $Res Function(_$RequestCreateArticleImpl) then) =
      __$$RequestCreateArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String content,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
      List<String>? tags,
      String? category,
      @JsonKey(name: 'reply_pacappi') bool? replyPacappi,
      @JsonKey(name: 'reply_pacappu') bool? replyPacappu});
}

/// @nodoc
class __$$RequestCreateArticleImplCopyWithImpl<$Res>
    extends _$RequestCreateArticleCopyWithImpl<$Res, _$RequestCreateArticleImpl>
    implements _$$RequestCreateArticleImplCopyWith<$Res> {
  __$$RequestCreateArticleImplCopyWithImpl(_$RequestCreateArticleImpl _value,
      $Res Function(_$RequestCreateArticleImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestCreateArticle
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
    Object? replyPacappi = freezed,
    Object? replyPacappu = freezed,
  }) {
    return _then(_$RequestCreateArticleImpl(
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
      replyPacappi: freezed == replyPacappi
          ? _value.replyPacappi
          : replyPacappi // ignore: cast_nullable_to_non_nullable
              as bool?,
      replyPacappu: freezed == replyPacappu
          ? _value.replyPacappu
          : replyPacappu // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestCreateArticleImpl implements _RequestCreateArticle {
  const _$RequestCreateArticleImpl(
      {required this.title,
      required this.content,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl,
      final List<String>? tags,
      this.category,
      @JsonKey(name: 'reply_pacappi') this.replyPacappi,
      @JsonKey(name: 'reply_pacappu') this.replyPacappu})
      : _tags = tags;

  factory _$RequestCreateArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestCreateArticleImplFromJson(json);

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
  @JsonKey(name: 'reply_pacappi')
  final bool? replyPacappi;
  @override
  @JsonKey(name: 'reply_pacappu')
  final bool? replyPacappu;

  @override
  String toString() {
    return 'RequestCreateArticle(title: $title, content: $content, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, tags: $tags, category: $category, replyPacappi: $replyPacappi, replyPacappu: $replyPacappu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestCreateArticleImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.replyPacappi, replyPacappi) ||
                other.replyPacappi == replyPacappi) &&
            (identical(other.replyPacappu, replyPacappu) ||
                other.replyPacappu == replyPacappu));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      content,
      imageUrl,
      thumbnailUrl,
      const DeepCollectionEquality().hash(_tags),
      category,
      replyPacappi,
      replyPacappu);

  /// Create a copy of RequestCreateArticle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestCreateArticleImplCopyWith<_$RequestCreateArticleImpl>
      get copyWith =>
          __$$RequestCreateArticleImplCopyWithImpl<_$RequestCreateArticleImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestCreateArticleImplToJson(
      this,
    );
  }
}

abstract class _RequestCreateArticle implements RequestCreateArticle {
  const factory _RequestCreateArticle(
          {required final String title,
          required final String content,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'thumbnail_url') final String? thumbnailUrl,
          final List<String>? tags,
          final String? category,
          @JsonKey(name: 'reply_pacappi') final bool? replyPacappi,
          @JsonKey(name: 'reply_pacappu') final bool? replyPacappu}) =
      _$RequestCreateArticleImpl;

  factory _RequestCreateArticle.fromJson(Map<String, dynamic> json) =
      _$RequestCreateArticleImpl.fromJson;

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
  @override
  @JsonKey(name: 'reply_pacappi')
  bool? get replyPacappi;
  @override
  @JsonKey(name: 'reply_pacappu')
  bool? get replyPacappu;

  /// Create a copy of RequestCreateArticle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestCreateArticleImplCopyWith<_$RequestCreateArticleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestUpdateArticle _$RequestUpdateArticleFromJson(Map<String, dynamic> json) {
  return _RequestUpdateArticle.fromJson(json);
}

/// @nodoc
mixin _$RequestUpdateArticle {
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this RequestUpdateArticle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestUpdateArticle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestUpdateArticleCopyWith<RequestUpdateArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestUpdateArticleCopyWith<$Res> {
  factory $RequestUpdateArticleCopyWith(RequestUpdateArticle value,
          $Res Function(RequestUpdateArticle) then) =
      _$RequestUpdateArticleCopyWithImpl<$Res, RequestUpdateArticle>;
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
class _$RequestUpdateArticleCopyWithImpl<$Res,
        $Val extends RequestUpdateArticle>
    implements $RequestUpdateArticleCopyWith<$Res> {
  _$RequestUpdateArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestUpdateArticle
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
abstract class _$$RequestUpdateArticleImplCopyWith<$Res>
    implements $RequestUpdateArticleCopyWith<$Res> {
  factory _$$RequestUpdateArticleImplCopyWith(_$RequestUpdateArticleImpl value,
          $Res Function(_$RequestUpdateArticleImpl) then) =
      __$$RequestUpdateArticleImplCopyWithImpl<$Res>;
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
class __$$RequestUpdateArticleImplCopyWithImpl<$Res>
    extends _$RequestUpdateArticleCopyWithImpl<$Res, _$RequestUpdateArticleImpl>
    implements _$$RequestUpdateArticleImplCopyWith<$Res> {
  __$$RequestUpdateArticleImplCopyWithImpl(_$RequestUpdateArticleImpl _value,
      $Res Function(_$RequestUpdateArticleImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestUpdateArticle
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
    return _then(_$RequestUpdateArticleImpl(
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
class _$RequestUpdateArticleImpl implements _RequestUpdateArticle {
  const _$RequestUpdateArticleImpl(
      {this.title,
      this.content,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl,
      final List<String>? tags,
      this.category})
      : _tags = tags;

  factory _$RequestUpdateArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestUpdateArticleImplFromJson(json);

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
    return 'RequestUpdateArticle(title: $title, content: $content, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, tags: $tags, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestUpdateArticleImpl &&
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

  /// Create a copy of RequestUpdateArticle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestUpdateArticleImplCopyWith<_$RequestUpdateArticleImpl>
      get copyWith =>
          __$$RequestUpdateArticleImplCopyWithImpl<_$RequestUpdateArticleImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestUpdateArticleImplToJson(
      this,
    );
  }
}

abstract class _RequestUpdateArticle implements RequestUpdateArticle {
  const factory _RequestUpdateArticle(
      {final String? title,
      final String? content,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'thumbnail_url') final String? thumbnailUrl,
      final List<String>? tags,
      final String? category}) = _$RequestUpdateArticleImpl;

  factory _RequestUpdateArticle.fromJson(Map<String, dynamic> json) =
      _$RequestUpdateArticleImpl.fromJson;

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

  /// Create a copy of RequestUpdateArticle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestUpdateArticleImplCopyWith<_$RequestUpdateArticleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestListArticles _$RequestListArticlesFromJson(Map<String, dynamic> json) {
  return _RequestListArticles.fromJson(json);
}

/// @nodoc
mixin _$RequestListArticles {
  @JsonKey(name: 'sort_by')
  String get sortBy => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'paging_view_count')
  int? get pagingViewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'paging_article_id')
  int? get pagingArticleId => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this RequestListArticles to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestListArticles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestListArticlesCopyWith<RequestListArticles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestListArticlesCopyWith<$Res> {
  factory $RequestListArticlesCopyWith(
          RequestListArticles value, $Res Function(RequestListArticles) then) =
      _$RequestListArticlesCopyWithImpl<$Res, RequestListArticles>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sort_by') String sortBy,
      int limit,
      @JsonKey(name: 'paging_view_count') int? pagingViewCount,
      @JsonKey(name: 'paging_article_id') int? pagingArticleId,
      String? category});
}

/// @nodoc
class _$RequestListArticlesCopyWithImpl<$Res, $Val extends RequestListArticles>
    implements $RequestListArticlesCopyWith<$Res> {
  _$RequestListArticlesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestListArticles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortBy = null,
    Object? limit = null,
    Object? pagingViewCount = freezed,
    Object? pagingArticleId = freezed,
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
      pagingViewCount: freezed == pagingViewCount
          ? _value.pagingViewCount
          : pagingViewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pagingArticleId: freezed == pagingArticleId
          ? _value.pagingArticleId
          : pagingArticleId // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestListArticlesImplCopyWith<$Res>
    implements $RequestListArticlesCopyWith<$Res> {
  factory _$$RequestListArticlesImplCopyWith(_$RequestListArticlesImpl value,
          $Res Function(_$RequestListArticlesImpl) then) =
      __$$RequestListArticlesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sort_by') String sortBy,
      int limit,
      @JsonKey(name: 'paging_view_count') int? pagingViewCount,
      @JsonKey(name: 'paging_article_id') int? pagingArticleId,
      String? category});
}

/// @nodoc
class __$$RequestListArticlesImplCopyWithImpl<$Res>
    extends _$RequestListArticlesCopyWithImpl<$Res, _$RequestListArticlesImpl>
    implements _$$RequestListArticlesImplCopyWith<$Res> {
  __$$RequestListArticlesImplCopyWithImpl(_$RequestListArticlesImpl _value,
      $Res Function(_$RequestListArticlesImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestListArticles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortBy = null,
    Object? limit = null,
    Object? pagingViewCount = freezed,
    Object? pagingArticleId = freezed,
    Object? category = freezed,
  }) {
    return _then(_$RequestListArticlesImpl(
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      pagingViewCount: freezed == pagingViewCount
          ? _value.pagingViewCount
          : pagingViewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pagingArticleId: freezed == pagingArticleId
          ? _value.pagingArticleId
          : pagingArticleId // ignore: cast_nullable_to_non_nullable
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
class _$RequestListArticlesImpl implements _RequestListArticles {
  const _$RequestListArticlesImpl(
      {@JsonKey(name: 'sort_by') required this.sortBy,
      required this.limit,
      @JsonKey(name: 'paging_view_count') this.pagingViewCount,
      @JsonKey(name: 'paging_article_id') this.pagingArticleId,
      this.category});

  factory _$RequestListArticlesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestListArticlesImplFromJson(json);

  @override
  @JsonKey(name: 'sort_by')
  final String sortBy;
  @override
  final int limit;
  @override
  @JsonKey(name: 'paging_view_count')
  final int? pagingViewCount;
  @override
  @JsonKey(name: 'paging_article_id')
  final int? pagingArticleId;
  @override
  final String? category;

  @override
  String toString() {
    return 'RequestListArticles(sortBy: $sortBy, limit: $limit, pagingViewCount: $pagingViewCount, pagingArticleId: $pagingArticleId, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestListArticlesImpl &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.pagingViewCount, pagingViewCount) ||
                other.pagingViewCount == pagingViewCount) &&
            (identical(other.pagingArticleId, pagingArticleId) ||
                other.pagingArticleId == pagingArticleId) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sortBy, limit, pagingViewCount, pagingArticleId, category);

  /// Create a copy of RequestListArticles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestListArticlesImplCopyWith<_$RequestListArticlesImpl> get copyWith =>
      __$$RequestListArticlesImplCopyWithImpl<_$RequestListArticlesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestListArticlesImplToJson(
      this,
    );
  }
}

abstract class _RequestListArticles implements RequestListArticles {
  const factory _RequestListArticles(
      {@JsonKey(name: 'sort_by') required final String sortBy,
      required final int limit,
      @JsonKey(name: 'paging_view_count') final int? pagingViewCount,
      @JsonKey(name: 'paging_article_id') final int? pagingArticleId,
      final String? category}) = _$RequestListArticlesImpl;

  factory _RequestListArticles.fromJson(Map<String, dynamic> json) =
      _$RequestListArticlesImpl.fromJson;

  @override
  @JsonKey(name: 'sort_by')
  String get sortBy;
  @override
  int get limit;
  @override
  @JsonKey(name: 'paging_view_count')
  int? get pagingViewCount;
  @override
  @JsonKey(name: 'paging_article_id')
  int? get pagingArticleId;
  @override
  String? get category;

  /// Create a copy of RequestListArticles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestListArticlesImplCopyWith<_$RequestListArticlesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseGetArticle _$ResponseGetArticleFromJson(Map<String, dynamic> json) {
  return _ResponseGetArticle.fromJson(json);
}

/// @nodoc
mixin _$ResponseGetArticle {
  ArticleDTO get article => throw _privateConstructorUsedError;

  /// Serializes this ResponseGetArticle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseGetArticle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseGetArticleCopyWith<ResponseGetArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseGetArticleCopyWith<$Res> {
  factory $ResponseGetArticleCopyWith(
          ResponseGetArticle value, $Res Function(ResponseGetArticle) then) =
      _$ResponseGetArticleCopyWithImpl<$Res, ResponseGetArticle>;
  @useResult
  $Res call({ArticleDTO article});

  $ArticleDTOCopyWith<$Res> get article;
}

/// @nodoc
class _$ResponseGetArticleCopyWithImpl<$Res, $Val extends ResponseGetArticle>
    implements $ResponseGetArticleCopyWith<$Res> {
  _$ResponseGetArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseGetArticle
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

  /// Create a copy of ResponseGetArticle
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
abstract class _$$ResponseGetArticleImplCopyWith<$Res>
    implements $ResponseGetArticleCopyWith<$Res> {
  factory _$$ResponseGetArticleImplCopyWith(_$ResponseGetArticleImpl value,
          $Res Function(_$ResponseGetArticleImpl) then) =
      __$$ResponseGetArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ArticleDTO article});

  @override
  $ArticleDTOCopyWith<$Res> get article;
}

/// @nodoc
class __$$ResponseGetArticleImplCopyWithImpl<$Res>
    extends _$ResponseGetArticleCopyWithImpl<$Res, _$ResponseGetArticleImpl>
    implements _$$ResponseGetArticleImplCopyWith<$Res> {
  __$$ResponseGetArticleImplCopyWithImpl(_$ResponseGetArticleImpl _value,
      $Res Function(_$ResponseGetArticleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseGetArticle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? article = null,
  }) {
    return _then(_$ResponseGetArticleImpl(
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as ArticleDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseGetArticleImpl implements _ResponseGetArticle {
  const _$ResponseGetArticleImpl({required this.article});

  factory _$ResponseGetArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseGetArticleImplFromJson(json);

  @override
  final ArticleDTO article;

  @override
  String toString() {
    return 'ResponseGetArticle(article: $article)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseGetArticleImpl &&
            (identical(other.article, article) || other.article == article));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, article);

  /// Create a copy of ResponseGetArticle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseGetArticleImplCopyWith<_$ResponseGetArticleImpl> get copyWith =>
      __$$ResponseGetArticleImplCopyWithImpl<_$ResponseGetArticleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseGetArticleImplToJson(
      this,
    );
  }
}

abstract class _ResponseGetArticle implements ResponseGetArticle {
  const factory _ResponseGetArticle({required final ArticleDTO article}) =
      _$ResponseGetArticleImpl;

  factory _ResponseGetArticle.fromJson(Map<String, dynamic> json) =
      _$ResponseGetArticleImpl.fromJson;

  @override
  ArticleDTO get article;

  /// Create a copy of ResponseGetArticle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseGetArticleImplCopyWith<_$ResponseGetArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseListArticles _$ResponseListArticlesFromJson(Map<String, dynamic> json) {
  return _ResponseListArticles.fromJson(json);
}

/// @nodoc
mixin _$ResponseListArticles {
  List<ArticleDTO>? get articles => throw _privateConstructorUsedError;

  /// Serializes this ResponseListArticles to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseListArticles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseListArticlesCopyWith<ResponseListArticles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseListArticlesCopyWith<$Res> {
  factory $ResponseListArticlesCopyWith(ResponseListArticles value,
          $Res Function(ResponseListArticles) then) =
      _$ResponseListArticlesCopyWithImpl<$Res, ResponseListArticles>;
  @useResult
  $Res call({List<ArticleDTO>? articles});
}

/// @nodoc
class _$ResponseListArticlesCopyWithImpl<$Res,
        $Val extends ResponseListArticles>
    implements $ResponseListArticlesCopyWith<$Res> {
  _$ResponseListArticlesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseListArticles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = freezed,
  }) {
    return _then(_value.copyWith(
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseListArticlesImplCopyWith<$Res>
    implements $ResponseListArticlesCopyWith<$Res> {
  factory _$$ResponseListArticlesImplCopyWith(_$ResponseListArticlesImpl value,
          $Res Function(_$ResponseListArticlesImpl) then) =
      __$$ResponseListArticlesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ArticleDTO>? articles});
}

/// @nodoc
class __$$ResponseListArticlesImplCopyWithImpl<$Res>
    extends _$ResponseListArticlesCopyWithImpl<$Res, _$ResponseListArticlesImpl>
    implements _$$ResponseListArticlesImplCopyWith<$Res> {
  __$$ResponseListArticlesImplCopyWithImpl(_$ResponseListArticlesImpl _value,
      $Res Function(_$ResponseListArticlesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseListArticles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = freezed,
  }) {
    return _then(_$ResponseListArticlesImpl(
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseListArticlesImpl implements _ResponseListArticles {
  const _$ResponseListArticlesImpl({final List<ArticleDTO>? articles})
      : _articles = articles;

  factory _$ResponseListArticlesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseListArticlesImplFromJson(json);

  final List<ArticleDTO>? _articles;
  @override
  List<ArticleDTO>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResponseListArticles(articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseListArticlesImpl &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  /// Create a copy of ResponseListArticles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseListArticlesImplCopyWith<_$ResponseListArticlesImpl>
      get copyWith =>
          __$$ResponseListArticlesImplCopyWithImpl<_$ResponseListArticlesImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseListArticlesImplToJson(
      this,
    );
  }
}

abstract class _ResponseListArticles implements ResponseListArticles {
  const factory _ResponseListArticles({final List<ArticleDTO>? articles}) =
      _$ResponseListArticlesImpl;

  factory _ResponseListArticles.fromJson(Map<String, dynamic> json) =
      _$ResponseListArticlesImpl.fromJson;

  @override
  List<ArticleDTO>? get articles;

  /// Create a copy of ResponseListArticles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseListArticlesImplCopyWith<_$ResponseListArticlesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseArticleLike _$ResponseArticleLikeFromJson(Map<String, dynamic> json) {
  return _ResponseArticleLike.fromJson(json);
}

/// @nodoc
mixin _$ResponseArticleLike {
  @JsonKey(name: 'article_id')
  int get articleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'like_count')
  int get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_liked')
  bool get isLiked => throw _privateConstructorUsedError;

  /// Serializes this ResponseArticleLike to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseArticleLike
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseArticleLikeCopyWith<ResponseArticleLike> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseArticleLikeCopyWith<$Res> {
  factory $ResponseArticleLikeCopyWith(
          ResponseArticleLike value, $Res Function(ResponseArticleLike) then) =
      _$ResponseArticleLikeCopyWithImpl<$Res, ResponseArticleLike>;
  @useResult
  $Res call(
      {@JsonKey(name: 'article_id') int articleId,
      @JsonKey(name: 'like_count') int likeCount,
      @JsonKey(name: 'is_liked') bool isLiked});
}

/// @nodoc
class _$ResponseArticleLikeCopyWithImpl<$Res, $Val extends ResponseArticleLike>
    implements $ResponseArticleLikeCopyWith<$Res> {
  _$ResponseArticleLikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseArticleLike
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
    Object? likeCount = null,
    Object? isLiked = null,
  }) {
    return _then(_value.copyWith(
      articleId: null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseArticleLikeImplCopyWith<$Res>
    implements $ResponseArticleLikeCopyWith<$Res> {
  factory _$$ResponseArticleLikeImplCopyWith(_$ResponseArticleLikeImpl value,
          $Res Function(_$ResponseArticleLikeImpl) then) =
      __$$ResponseArticleLikeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'article_id') int articleId,
      @JsonKey(name: 'like_count') int likeCount,
      @JsonKey(name: 'is_liked') bool isLiked});
}

/// @nodoc
class __$$ResponseArticleLikeImplCopyWithImpl<$Res>
    extends _$ResponseArticleLikeCopyWithImpl<$Res, _$ResponseArticleLikeImpl>
    implements _$$ResponseArticleLikeImplCopyWith<$Res> {
  __$$ResponseArticleLikeImplCopyWithImpl(_$ResponseArticleLikeImpl _value,
      $Res Function(_$ResponseArticleLikeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseArticleLike
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleId = null,
    Object? likeCount = null,
    Object? isLiked = null,
  }) {
    return _then(_$ResponseArticleLikeImpl(
      articleId: null == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseArticleLikeImpl implements _ResponseArticleLike {
  const _$ResponseArticleLikeImpl(
      {@JsonKey(name: 'article_id') required this.articleId,
      @JsonKey(name: 'like_count') required this.likeCount,
      @JsonKey(name: 'is_liked') required this.isLiked});

  factory _$ResponseArticleLikeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseArticleLikeImplFromJson(json);

  @override
  @JsonKey(name: 'article_id')
  final int articleId;
  @override
  @JsonKey(name: 'like_count')
  final int likeCount;
  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;

  @override
  String toString() {
    return 'ResponseArticleLike(articleId: $articleId, likeCount: $likeCount, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseArticleLikeImpl &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, articleId, likeCount, isLiked);

  /// Create a copy of ResponseArticleLike
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseArticleLikeImplCopyWith<_$ResponseArticleLikeImpl> get copyWith =>
      __$$ResponseArticleLikeImplCopyWithImpl<_$ResponseArticleLikeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseArticleLikeImplToJson(
      this,
    );
  }
}

abstract class _ResponseArticleLike implements ResponseArticleLike {
  const factory _ResponseArticleLike(
          {@JsonKey(name: 'article_id') required final int articleId,
          @JsonKey(name: 'like_count') required final int likeCount,
          @JsonKey(name: 'is_liked') required final bool isLiked}) =
      _$ResponseArticleLikeImpl;

  factory _ResponseArticleLike.fromJson(Map<String, dynamic> json) =
      _$ResponseArticleLikeImpl.fromJson;

  @override
  @JsonKey(name: 'article_id')
  int get articleId;
  @override
  @JsonKey(name: 'like_count')
  int get likeCount;
  @override
  @JsonKey(name: 'is_liked')
  bool get isLiked;

  /// Create a copy of ResponseArticleLike
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseArticleLikeImplCopyWith<_$ResponseArticleLikeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestSearchArticles _$RequestSearchArticlesFromJson(
    Map<String, dynamic> json) {
  return _RequestSearchArticles.fromJson(json);
}

/// @nodoc
mixin _$RequestSearchArticles {
  String get query => throw _privateConstructorUsedError;
  @JsonKey(name: 'paging_key')
  int? get pagingKey => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Serializes this RequestSearchArticles to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestSearchArticles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestSearchArticlesCopyWith<RequestSearchArticles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestSearchArticlesCopyWith<$Res> {
  factory $RequestSearchArticlesCopyWith(RequestSearchArticles value,
          $Res Function(RequestSearchArticles) then) =
      _$RequestSearchArticlesCopyWithImpl<$Res, RequestSearchArticles>;
  @useResult
  $Res call(
      {String query, @JsonKey(name: 'paging_key') int? pagingKey, int limit});
}

/// @nodoc
class _$RequestSearchArticlesCopyWithImpl<$Res,
        $Val extends RequestSearchArticles>
    implements $RequestSearchArticlesCopyWith<$Res> {
  _$RequestSearchArticlesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestSearchArticles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? pagingKey = freezed,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestSearchArticlesImplCopyWith<$Res>
    implements $RequestSearchArticlesCopyWith<$Res> {
  factory _$$RequestSearchArticlesImplCopyWith(
          _$RequestSearchArticlesImpl value,
          $Res Function(_$RequestSearchArticlesImpl) then) =
      __$$RequestSearchArticlesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query, @JsonKey(name: 'paging_key') int? pagingKey, int limit});
}

/// @nodoc
class __$$RequestSearchArticlesImplCopyWithImpl<$Res>
    extends _$RequestSearchArticlesCopyWithImpl<$Res,
        _$RequestSearchArticlesImpl>
    implements _$$RequestSearchArticlesImplCopyWith<$Res> {
  __$$RequestSearchArticlesImplCopyWithImpl(_$RequestSearchArticlesImpl _value,
      $Res Function(_$RequestSearchArticlesImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestSearchArticles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? pagingKey = freezed,
    Object? limit = null,
  }) {
    return _then(_$RequestSearchArticlesImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestSearchArticlesImpl implements _RequestSearchArticles {
  const _$RequestSearchArticlesImpl(
      {required this.query,
      @JsonKey(name: 'paging_key') this.pagingKey,
      required this.limit});

  factory _$RequestSearchArticlesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestSearchArticlesImplFromJson(json);

  @override
  final String query;
  @override
  @JsonKey(name: 'paging_key')
  final int? pagingKey;
  @override
  final int limit;

  @override
  String toString() {
    return 'RequestSearchArticles(query: $query, pagingKey: $pagingKey, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestSearchArticlesImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.pagingKey, pagingKey) ||
                other.pagingKey == pagingKey) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, query, pagingKey, limit);

  /// Create a copy of RequestSearchArticles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestSearchArticlesImplCopyWith<_$RequestSearchArticlesImpl>
      get copyWith => __$$RequestSearchArticlesImplCopyWithImpl<
          _$RequestSearchArticlesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestSearchArticlesImplToJson(
      this,
    );
  }
}

abstract class _RequestSearchArticles implements RequestSearchArticles {
  const factory _RequestSearchArticles(
      {required final String query,
      @JsonKey(name: 'paging_key') final int? pagingKey,
      required final int limit}) = _$RequestSearchArticlesImpl;

  factory _RequestSearchArticles.fromJson(Map<String, dynamic> json) =
      _$RequestSearchArticlesImpl.fromJson;

  @override
  String get query;
  @override
  @JsonKey(name: 'paging_key')
  int? get pagingKey;
  @override
  int get limit;

  /// Create a copy of RequestSearchArticles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestSearchArticlesImplCopyWith<_$RequestSearchArticlesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestListUserArticles _$RequestListUserArticlesFromJson(
    Map<String, dynamic> json) {
  return _RequestListUserArticles.fromJson(json);
}

/// @nodoc
mixin _$RequestListUserArticles {
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'paging_key')
  int? get pagingKey => throw _privateConstructorUsedError;

  /// Serializes this RequestListUserArticles to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestListUserArticles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestListUserArticlesCopyWith<RequestListUserArticles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestListUserArticlesCopyWith<$Res> {
  factory $RequestListUserArticlesCopyWith(RequestListUserArticles value,
          $Res Function(RequestListUserArticles) then) =
      _$RequestListUserArticlesCopyWithImpl<$Res, RequestListUserArticles>;
  @useResult
  $Res call({int limit, @JsonKey(name: 'paging_key') int? pagingKey});
}

/// @nodoc
class _$RequestListUserArticlesCopyWithImpl<$Res,
        $Val extends RequestListUserArticles>
    implements $RequestListUserArticlesCopyWith<$Res> {
  _$RequestListUserArticlesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestListUserArticles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? pagingKey = freezed,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestListUserArticlesImplCopyWith<$Res>
    implements $RequestListUserArticlesCopyWith<$Res> {
  factory _$$RequestListUserArticlesImplCopyWith(
          _$RequestListUserArticlesImpl value,
          $Res Function(_$RequestListUserArticlesImpl) then) =
      __$$RequestListUserArticlesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, @JsonKey(name: 'paging_key') int? pagingKey});
}

/// @nodoc
class __$$RequestListUserArticlesImplCopyWithImpl<$Res>
    extends _$RequestListUserArticlesCopyWithImpl<$Res,
        _$RequestListUserArticlesImpl>
    implements _$$RequestListUserArticlesImplCopyWith<$Res> {
  __$$RequestListUserArticlesImplCopyWithImpl(
      _$RequestListUserArticlesImpl _value,
      $Res Function(_$RequestListUserArticlesImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestListUserArticles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? pagingKey = freezed,
  }) {
    return _then(_$RequestListUserArticlesImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestListUserArticlesImpl implements _RequestListUserArticles {
  const _$RequestListUserArticlesImpl(
      {required this.limit, @JsonKey(name: 'paging_key') this.pagingKey});

  factory _$RequestListUserArticlesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestListUserArticlesImplFromJson(json);

  @override
  final int limit;
  @override
  @JsonKey(name: 'paging_key')
  final int? pagingKey;

  @override
  String toString() {
    return 'RequestListUserArticles(limit: $limit, pagingKey: $pagingKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestListUserArticlesImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.pagingKey, pagingKey) ||
                other.pagingKey == pagingKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, pagingKey);

  /// Create a copy of RequestListUserArticles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestListUserArticlesImplCopyWith<_$RequestListUserArticlesImpl>
      get copyWith => __$$RequestListUserArticlesImplCopyWithImpl<
          _$RequestListUserArticlesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestListUserArticlesImplToJson(
      this,
    );
  }
}

abstract class _RequestListUserArticles implements RequestListUserArticles {
  const factory _RequestListUserArticles(
          {required final int limit,
          @JsonKey(name: 'paging_key') final int? pagingKey}) =
      _$RequestListUserArticlesImpl;

  factory _RequestListUserArticles.fromJson(Map<String, dynamic> json) =
      _$RequestListUserArticlesImpl.fromJson;

  @override
  int get limit;
  @override
  @JsonKey(name: 'paging_key')
  int? get pagingKey;

  /// Create a copy of RequestListUserArticles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestListUserArticlesImplCopyWith<_$RequestListUserArticlesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestListLikedPosts _$RequestListLikedPostsFromJson(
    Map<String, dynamic> json) {
  return _RequestListLikedPosts.fromJson(json);
}

/// @nodoc
mixin _$RequestListLikedPosts {
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'paging_key')
  int? get pagingKey => throw _privateConstructorUsedError;

  /// Serializes this RequestListLikedPosts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestListLikedPosts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestListLikedPostsCopyWith<RequestListLikedPosts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestListLikedPostsCopyWith<$Res> {
  factory $RequestListLikedPostsCopyWith(RequestListLikedPosts value,
          $Res Function(RequestListLikedPosts) then) =
      _$RequestListLikedPostsCopyWithImpl<$Res, RequestListLikedPosts>;
  @useResult
  $Res call({int limit, @JsonKey(name: 'paging_key') int? pagingKey});
}

/// @nodoc
class _$RequestListLikedPostsCopyWithImpl<$Res,
        $Val extends RequestListLikedPosts>
    implements $RequestListLikedPostsCopyWith<$Res> {
  _$RequestListLikedPostsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestListLikedPosts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? pagingKey = freezed,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestListLikedPostsImplCopyWith<$Res>
    implements $RequestListLikedPostsCopyWith<$Res> {
  factory _$$RequestListLikedPostsImplCopyWith(
          _$RequestListLikedPostsImpl value,
          $Res Function(_$RequestListLikedPostsImpl) then) =
      __$$RequestListLikedPostsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, @JsonKey(name: 'paging_key') int? pagingKey});
}

/// @nodoc
class __$$RequestListLikedPostsImplCopyWithImpl<$Res>
    extends _$RequestListLikedPostsCopyWithImpl<$Res,
        _$RequestListLikedPostsImpl>
    implements _$$RequestListLikedPostsImplCopyWith<$Res> {
  __$$RequestListLikedPostsImplCopyWithImpl(_$RequestListLikedPostsImpl _value,
      $Res Function(_$RequestListLikedPostsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestListLikedPosts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? pagingKey = freezed,
  }) {
    return _then(_$RequestListLikedPostsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestListLikedPostsImpl implements _RequestListLikedPosts {
  const _$RequestListLikedPostsImpl(
      {required this.limit, @JsonKey(name: 'paging_key') this.pagingKey});

  factory _$RequestListLikedPostsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestListLikedPostsImplFromJson(json);

  @override
  final int limit;
  @override
  @JsonKey(name: 'paging_key')
  final int? pagingKey;

  @override
  String toString() {
    return 'RequestListLikedPosts(limit: $limit, pagingKey: $pagingKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestListLikedPostsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.pagingKey, pagingKey) ||
                other.pagingKey == pagingKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, pagingKey);

  /// Create a copy of RequestListLikedPosts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestListLikedPostsImplCopyWith<_$RequestListLikedPostsImpl>
      get copyWith => __$$RequestListLikedPostsImplCopyWithImpl<
          _$RequestListLikedPostsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestListLikedPostsImplToJson(
      this,
    );
  }
}

abstract class _RequestListLikedPosts implements RequestListLikedPosts {
  const factory _RequestListLikedPosts(
          {required final int limit,
          @JsonKey(name: 'paging_key') final int? pagingKey}) =
      _$RequestListLikedPostsImpl;

  factory _RequestListLikedPosts.fromJson(Map<String, dynamic> json) =
      _$RequestListLikedPostsImpl.fromJson;

  @override
  int get limit;
  @override
  @JsonKey(name: 'paging_key')
  int? get pagingKey;

  /// Create a copy of RequestListLikedPosts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestListLikedPostsImplCopyWith<_$RequestListLikedPostsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
