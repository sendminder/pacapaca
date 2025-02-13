import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: 'create_time') required String createTime,
    @JsonKey(name: 'update_time') required String updateTime,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'comment_count') required int commentCount,
    @JsonKey(name: 'view_count') required int viewCount,
    required String nickname,
    @JsonKey(name: 'profile_image_url') required String profileImageUrl,
  }) = _ArticleDTO;

  factory ArticleDTO.fromJson(Map<String, dynamic> json) =>
      _$ArticleDTOFromJson(json);
}

@freezed
class ArticleCommentDTO with _$ArticleCommentDTO {
  const factory ArticleCommentDTO({
    required int id,
    @JsonKey(name: 'article_id') required int articleId,
    @JsonKey(name: 'user_id') required int userId,
    required String content,
    @JsonKey(name: 'create_time') required String createTime,
    @JsonKey(name: 'update_time') required String updateTime,
    @JsonKey(name: 'delete_time') String? deleteTime,
    required String nickname,
    @JsonKey(name: 'profile_image_url') required String profileImageUrl,
  }) = _ArticleCommentDTO;

  factory ArticleCommentDTO.fromJson(Map<String, dynamic> json) =>
      _$ArticleCommentDTOFromJson(json);
}

// Request DTOs
@freezed
class CreateArticleRequest with _$CreateArticleRequest {
  const factory CreateArticleRequest({
    required String title,
    required String content,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    List<String>? tags,
    String? category,
  }) = _CreateArticleRequest;

  factory CreateArticleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateArticleRequestFromJson(json);
}

@freezed
class UpdateArticleRequest with _$UpdateArticleRequest {
  const factory UpdateArticleRequest({
    String? title,
    String? content,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    List<String>? tags,
    String? category,
  }) = _UpdateArticleRequest;

  factory UpdateArticleRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateArticleRequestFromJson(json);
}

@freezed
class CreateCommentRequest with _$CreateCommentRequest {
  const factory CreateCommentRequest({
    required String content,
  }) = _CreateCommentRequest;

  factory CreateCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCommentRequestFromJson(json);
}

@freezed
class UpdateCommentRequest with _$UpdateCommentRequest {
  const factory UpdateCommentRequest({
    required String content,
  }) = _UpdateCommentRequest;

  factory UpdateCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCommentRequestFromJson(json);
}

@freezed
class ListArticlesRequest with _$ListArticlesRequest {
  const factory ListArticlesRequest({
    @JsonKey(name: 'sort_by') required String sortBy,
    required int limit,
    @JsonKey(name: 'paging_key') int? pagingKey,
    String? category,
  }) = _ListArticlesRequest;

  factory ListArticlesRequest.fromJson(Map<String, dynamic> json) =>
      _$ListArticlesRequestFromJson(json);
}

// Response DTOs
@freezed
class GetArticleResponse with _$GetArticleResponse {
  const factory GetArticleResponse({
    required ArticleDTO article,
  }) = _GetArticleResponse;

  factory GetArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetArticleResponseFromJson(json);
}

@freezed
class ListArticlesResponse with _$ListArticlesResponse {
  const factory ListArticlesResponse({
    required List<ArticleDTO> articles,
  }) = _ListArticlesResponse;

  factory ListArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListArticlesResponseFromJson(json);
}

@freezed
class ArticleCommentsResponse with _$ArticleCommentsResponse {
  const factory ArticleCommentsResponse({
    required List<ArticleCommentDTO> comments,
  }) = _ArticleCommentsResponse;

  factory ArticleCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleCommentsResponseFromJson(json);
}

@freezed
class GetCommentResponse with _$GetCommentResponse {
  const factory GetCommentResponse({
    required ArticleCommentDTO comment,
  }) = _GetCommentResponse;

  factory GetCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCommentResponseFromJson(json);
}
