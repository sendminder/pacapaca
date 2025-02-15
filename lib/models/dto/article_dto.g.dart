// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleDTOImpl _$$ArticleDTOImplFromJson(Map<String, dynamic> json) =>
    _$ArticleDTOImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['image_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createTime: json['create_time'] as String,
      updateTime: json['update_time'] as String,
      likeCount: (json['like_count'] as num).toInt(),
      commentCount: (json['comment_count'] as num).toInt(),
      viewCount: (json['view_count'] as num).toInt(),
      nickname: json['nickname'] as String,
      profileImageUrl: json['profile_image_url'] as String,
      isLiked: json['is_liked'] as bool,
    );

Map<String, dynamic> _$$ArticleDTOImplToJson(_$ArticleDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'content': instance.content,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'tags': instance.tags,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'view_count': instance.viewCount,
      'nickname': instance.nickname,
      'profile_image_url': instance.profileImageUrl,
      'is_liked': instance.isLiked,
    };

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

_$CreateArticleRequestImpl _$$CreateArticleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateArticleRequestImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['image_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$CreateArticleRequestImplToJson(
        _$CreateArticleRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'tags': instance.tags,
      'category': instance.category,
    };

_$UpdateArticleRequestImpl _$$UpdateArticleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateArticleRequestImpl(
      title: json['title'] as String?,
      content: json['content'] as String?,
      imageUrl: json['image_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$UpdateArticleRequestImplToJson(
        _$UpdateArticleRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'tags': instance.tags,
      'category': instance.category,
    };

_$CreateCommentRequestImpl _$$CreateCommentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCommentRequestImpl(
      content: json['content'] as String,
    );

Map<String, dynamic> _$$CreateCommentRequestImplToJson(
        _$CreateCommentRequestImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

_$UpdateCommentRequestImpl _$$UpdateCommentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateCommentRequestImpl(
      content: json['content'] as String,
    );

Map<String, dynamic> _$$UpdateCommentRequestImplToJson(
        _$UpdateCommentRequestImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

_$ListArticlesRequestImpl _$$ListArticlesRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ListArticlesRequestImpl(
      sortBy: json['sort_by'] as String,
      limit: (json['limit'] as num).toInt(),
      pagingKey: (json['paging_key'] as num?)?.toInt(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$ListArticlesRequestImplToJson(
        _$ListArticlesRequestImpl instance) =>
    <String, dynamic>{
      'sort_by': instance.sortBy,
      'limit': instance.limit,
      'paging_key': instance.pagingKey,
      'category': instance.category,
    };

_$GetArticleResponseImpl _$$GetArticleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetArticleResponseImpl(
      article: ArticleDTO.fromJson(json['article'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetArticleResponseImplToJson(
        _$GetArticleResponseImpl instance) =>
    <String, dynamic>{
      'article': instance.article,
    };

_$ListArticlesResponseImpl _$$ListArticlesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListArticlesResponseImpl(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListArticlesResponseImplToJson(
        _$ListArticlesResponseImpl instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };

_$ArticleCommentsResponseImpl _$$ArticleCommentsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticleCommentsResponseImpl(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => ArticleCommentDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArticleCommentsResponseImplToJson(
        _$ArticleCommentsResponseImpl instance) =>
    <String, dynamic>{
      'comments': instance.comments,
    };

_$GetCommentResponseImpl _$$GetCommentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCommentResponseImpl(
      comment:
          ArticleCommentDTO.fromJson(json['comment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetCommentResponseImplToJson(
        _$GetCommentResponseImpl instance) =>
    <String, dynamic>{
      'comment': instance.comment,
    };

_$ArticleLikeResponseImpl _$$ArticleLikeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticleLikeResponseImpl(
      articleId: (json['article_id'] as num).toInt(),
      likeCount: (json['like_count'] as num).toInt(),
      isLiked: json['is_liked'] as bool,
    );

Map<String, dynamic> _$$ArticleLikeResponseImplToJson(
        _$ArticleLikeResponseImpl instance) =>
    <String, dynamic>{
      'article_id': instance.articleId,
      'like_count': instance.likeCount,
      'is_liked': instance.isLiked,
    };
