import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pacapaca/models/dto/user_dto.dart';

part 'article_dto.freezed.dart';
part 'article_dto.g.dart';

@freezed
class ArticleDTO with _$ArticleDTO {
  const factory ArticleDTO({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    required String title,
    required String content,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    List<String>? tags,
    String? category,
    @JsonKey(name: 'create_time') required String createTime,
    @JsonKey(name: 'update_time') required String updateTime,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'comment_count') required int commentCount,
    @JsonKey(name: 'view_count') required int viewCount,

    // 유저 정보
    @JsonKey(name: 'display_user') required DisplayUserDTO displayUser,

    // 현재 유저가 좋아요를 눌렀는지 여부
    @JsonKey(name: 'is_liked') required bool isLiked,
  }) = _ArticleDTO;

  factory ArticleDTO.fromJson(Map<String, dynamic> json) =>
      _$ArticleDTOFromJson(json);
}

// Request DTOs
@freezed
class RequestCreateArticle with _$RequestCreateArticle {
  const factory RequestCreateArticle({
    required String title,
    required String content,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    List<String>? tags,
    String? category,
  }) = _RequestCreateArticle;

  factory RequestCreateArticle.fromJson(Map<String, dynamic> json) =>
      _$RequestCreateArticleFromJson(json);
}

@freezed
class RequestUpdateArticle with _$RequestUpdateArticle {
  const factory RequestUpdateArticle({
    String? title,
    String? content,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    List<String>? tags,
    String? category,
  }) = _RequestUpdateArticle;

  factory RequestUpdateArticle.fromJson(Map<String, dynamic> json) =>
      _$RequestUpdateArticleFromJson(json);
}

@freezed
class RequestListArticles with _$RequestListArticles {
  const factory RequestListArticles({
    @JsonKey(name: 'sort_by') required String sortBy,
    required int limit,
    @JsonKey(name: 'paging_view_count') int? pagingViewCount,
    @JsonKey(name: 'paging_article_id') int? pagingArticleId,
    String? category,
  }) = _RequestListArticles;

  factory RequestListArticles.fromJson(Map<String, dynamic> json) =>
      _$RequestListArticlesFromJson(json);
}

// Response DTOs
@freezed
class ResponseGetArticle with _$ResponseGetArticle {
  const factory ResponseGetArticle({
    required ArticleDTO article,
  }) = _ResponseGetArticle;

  factory ResponseGetArticle.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetArticleFromJson(json);
}

@freezed
class ResponseListArticles with _$ResponseListArticles {
  const factory ResponseListArticles({
    List<ArticleDTO>? articles,
  }) = _ResponseListArticles;

  factory ResponseListArticles.fromJson(Map<String, dynamic> json) =>
      _$ResponseListArticlesFromJson(json);
}

@freezed
class ResponseArticleLike with _$ResponseArticleLike {
  const factory ResponseArticleLike({
    @JsonKey(name: 'article_id') required int articleId,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'is_liked') required bool isLiked,
  }) = _ResponseArticleLike;

  factory ResponseArticleLike.fromJson(Map<String, dynamic> json) =>
      _$ResponseArticleLikeFromJson(json);
}

@freezed
class RequestSearchArticles with _$RequestSearchArticles {
  const factory RequestSearchArticles({
    required String query,
    @JsonKey(name: 'paging_key') int? pagingKey,
    required int limit,
  }) = _RequestSearchArticles;

  factory RequestSearchArticles.fromJson(Map<String, dynamic> json) =>
      _$RequestSearchArticlesFromJson(json);
}

@freezed
class RequestListUserArticles with _$RequestListUserArticles {
  const factory RequestListUserArticles({
    required int limit,
    @JsonKey(name: 'paging_key') int? pagingKey,
  }) = _RequestListUserArticles;

  factory RequestListUserArticles.fromJson(Map<String, dynamic> json) =>
      _$RequestListUserArticlesFromJson(json);
}

@freezed
class RequestListLikedPosts with _$RequestListLikedPosts {
  const factory RequestListLikedPosts({
    required int limit,
    @JsonKey(name: 'paging_key') int? pagingKey,
  }) = _RequestListLikedPosts;

  factory RequestListLikedPosts.fromJson(Map<String, dynamic> json) =>
      _$RequestListLikedPostsFromJson(json);
}
