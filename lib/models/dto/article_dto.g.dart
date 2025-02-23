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
      category: json['category'] as String?,
      createTime: json['create_time'] as String,
      updateTime: json['update_time'] as String,
      likeCount: (json['like_count'] as num).toInt(),
      commentCount: (json['comment_count'] as num).toInt(),
      viewCount: (json['view_count'] as num).toInt(),
      displayUser:
          DisplayUserDTO.fromJson(json['displayUser'] as Map<String, dynamic>),
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
      'category': instance.category,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'view_count': instance.viewCount,
      'displayUser': instance.displayUser,
      'is_liked': instance.isLiked,
    };

_$RequestCreateArticleImpl _$$RequestCreateArticleImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestCreateArticleImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['image_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$RequestCreateArticleImplToJson(
        _$RequestCreateArticleImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'tags': instance.tags,
      'category': instance.category,
    };

_$RequestUpdateArticleImpl _$$RequestUpdateArticleImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestUpdateArticleImpl(
      title: json['title'] as String?,
      content: json['content'] as String?,
      imageUrl: json['image_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$RequestUpdateArticleImplToJson(
        _$RequestUpdateArticleImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'tags': instance.tags,
      'category': instance.category,
    };

_$RequestListArticlesImpl _$$RequestListArticlesImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListArticlesImpl(
      sortBy: json['sort_by'] as String,
      limit: (json['limit'] as num).toInt(),
      pagingViewCount: (json['paging_view_count'] as num?)?.toInt(),
      pagingArticleId: (json['paging_article_id'] as num?)?.toInt(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$RequestListArticlesImplToJson(
        _$RequestListArticlesImpl instance) =>
    <String, dynamic>{
      'sort_by': instance.sortBy,
      'limit': instance.limit,
      'paging_view_count': instance.pagingViewCount,
      'paging_article_id': instance.pagingArticleId,
      'category': instance.category,
    };

_$ResponseGetArticleImpl _$$ResponseGetArticleImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseGetArticleImpl(
      article: ArticleDTO.fromJson(json['article'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseGetArticleImplToJson(
        _$ResponseGetArticleImpl instance) =>
    <String, dynamic>{
      'article': instance.article,
    };

_$ResponseListArticlesImpl _$$ResponseListArticlesImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseListArticlesImpl(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResponseListArticlesImplToJson(
        _$ResponseListArticlesImpl instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };

_$ResponseArticleLikeImpl _$$ResponseArticleLikeImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseArticleLikeImpl(
      articleId: (json['article_id'] as num).toInt(),
      likeCount: (json['like_count'] as num).toInt(),
      isLiked: json['is_liked'] as bool,
    );

Map<String, dynamic> _$$ResponseArticleLikeImplToJson(
        _$ResponseArticleLikeImpl instance) =>
    <String, dynamic>{
      'article_id': instance.articleId,
      'like_count': instance.likeCount,
      'is_liked': instance.isLiked,
    };

_$RequestSearchArticlesImpl _$$RequestSearchArticlesImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestSearchArticlesImpl(
      query: json['query'] as String,
      pagingKey: (json['paging_key'] as num?)?.toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$$RequestSearchArticlesImplToJson(
        _$RequestSearchArticlesImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'paging_key': instance.pagingKey,
      'limit': instance.limit,
    };
