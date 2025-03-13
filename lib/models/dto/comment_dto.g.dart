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
      isDeleted: json['is_deleted'] as bool,
      displayUser:
          DisplayUserDTO.fromJson(json['display_user'] as Map<String, dynamic>),
      parentId: (json['parent_id'] as num?)?.toInt(),
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => ArticleCommentDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      replyCount: (json['reply_count'] as num?)?.toInt(),
      hasMore: json['has_more'] as bool?,
      likeCount: (json['like_count'] as num).toInt(),
      isLiked: json['is_liked'] as bool,
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
      'is_deleted': instance.isDeleted,
      'display_user': instance.displayUser,
      'parent_id': instance.parentId,
      'replies': instance.replies,
      'reply_count': instance.replyCount,
      'has_more': instance.hasMore,
      'like_count': instance.likeCount,
      'is_liked': instance.isLiked,
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
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => ArticleCommentDTO.fromJson(e as Map<String, dynamic>))
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
      parentId: (json['parent_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestCreateCommentImplToJson(
        _$RequestCreateCommentImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'parent_id': instance.parentId,
    };

_$RequestListRepliesImpl _$$RequestListRepliesImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListRepliesImpl(
      sortBy: json['sort_by'] as String,
      limit: (json['limit'] as num).toInt(),
      pagingKey: (json['paging_key'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestListRepliesImplToJson(
        _$RequestListRepliesImpl instance) =>
    <String, dynamic>{
      'sort_by': instance.sortBy,
      'limit': instance.limit,
      'paging_key': instance.pagingKey,
    };

_$RequestListCommentsImpl _$$RequestListCommentsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListCommentsImpl(
      sortBy: json['sort_by'] as String,
      limit: (json['limit'] as num).toInt(),
      pagingKey: (json['paging_key'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestListCommentsImplToJson(
        _$RequestListCommentsImpl instance) =>
    <String, dynamic>{
      'sort_by': instance.sortBy,
      'limit': instance.limit,
      'paging_key': instance.pagingKey,
    };

_$RequestLikeCommentImpl _$$RequestLikeCommentImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestLikeCommentImpl(
      commentId: (json['comment_id'] as num).toInt(),
    );

Map<String, dynamic> _$$RequestLikeCommentImplToJson(
        _$RequestLikeCommentImpl instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
    };

_$ResponseLikeCommentImpl _$$ResponseLikeCommentImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseLikeCommentImpl(
      commentId: (json['comment_id'] as num).toInt(),
      likeCount: (json['like_count'] as num).toInt(),
      isLiked: json['is_liked'] as bool,
    );

Map<String, dynamic> _$$ResponseLikeCommentImplToJson(
        _$ResponseLikeCommentImpl instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'like_count': instance.likeCount,
      'is_liked': instance.isLiked,
    };
