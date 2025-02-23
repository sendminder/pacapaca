// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleCommentDTOImpl _$$ArticleCommentDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticleCommentDTOImpl(
      id: (json['id'] as num).toInt(),
      articleId: (json['article_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      content: json['content'] as String,
      createTime: json['create_time'] as String,
      updateTime: json['update_time'] as String,
      deleteTime: json['delete_time'] as String?,
      nickname: json['nickname'] as String,
      profileImageUrl: json['profile_image_url'] as String,
    );

Map<String, dynamic> _$$ArticleCommentDTOImplToJson(
        _$ArticleCommentDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'article_id': instance.articleId,
      'user_id': instance.userId,
      'content': instance.content,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
      'delete_time': instance.deleteTime,
      'nickname': instance.nickname,
      'profile_image_url': instance.profileImageUrl,
    };

_$ResponseGetCommentImpl _$$ResponseGetCommentImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseGetCommentImpl(
      comment:
          ArticleCommentDTO.fromJson(json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseGetCommentImplToJson(
        _$ResponseGetCommentImpl instance) =>
    <String, dynamic>{
      'comment': instance.comment,
    };

_$ResponseListCommentsImpl _$$ResponseListCommentsImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseListCommentsImpl(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => ArticleCommentDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResponseListCommentsImplToJson(
        _$ResponseListCommentsImpl instance) =>
    <String, dynamic>{
      'comments': instance.comments,
    };

_$RequestUpdateCommentImpl _$$RequestUpdateCommentImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestUpdateCommentImpl(
      content: json['content'] as String,
    );

Map<String, dynamic> _$$RequestUpdateCommentImplToJson(
        _$RequestUpdateCommentImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

_$RequestCreateCommentImpl _$$RequestCreateCommentImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestCreateCommentImpl(
      content: json['content'] as String,
    );

Map<String, dynamic> _$$RequestCreateCommentImplToJson(
        _$RequestCreateCommentImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
    };
