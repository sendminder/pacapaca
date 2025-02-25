import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pacapaca/models/dto/user_dto.dart';

part 'comment_dto.freezed.dart';
part 'comment_dto.g.dart';

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
    @JsonKey(name: 'display_user') required DisplayUserDTO displayUser,
    // 대댓글
    @JsonKey(name: 'parent_id') int? parentId,
    @JsonKey(name: 'replies') List<ArticleCommentDTO>? replies,
    @JsonKey(name: 'reply_count') int? replyCount,
    @JsonKey(name: 'has_more') bool? hasMore,
    @JsonKey(name: 'like_count') required int likeCount,
    @JsonKey(name: 'is_liked') required bool isLiked,
  }) = _ArticleCommentDTO;

  factory ArticleCommentDTO.fromJson(Map<String, dynamic> json) =>
      _$ArticleCommentDTOFromJson(json);
}

@freezed
class ResponseGetComment with _$ResponseGetComment {
  const factory ResponseGetComment({
    required ArticleCommentDTO comment,
  }) = _ResponseGetComment;

  factory ResponseGetComment.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetCommentFromJson(json);
}

@freezed
class ResponseListComments with _$ResponseListComments {
  const factory ResponseListComments({
    List<ArticleCommentDTO>? comments,
  }) = _ResponseListComments;

  factory ResponseListComments.fromJson(Map<String, dynamic> json) =>
      _$ResponseListCommentsFromJson(json);
}

@freezed
class RequestUpdateComment with _$RequestUpdateComment {
  const factory RequestUpdateComment({
    required String content,
  }) = _RequestUpdateComment;

  factory RequestUpdateComment.fromJson(Map<String, dynamic> json) =>
      _$RequestUpdateCommentFromJson(json);
}

@freezed
class RequestCreateComment with _$RequestCreateComment {
  const factory RequestCreateComment({
    required String content,
    @JsonKey(name: 'parent_id') int? parentId,
  }) = _RequestCreateComment;

  factory RequestCreateComment.fromJson(Map<String, dynamic> json) =>
      _$RequestCreateCommentFromJson(json);
}

@freezed
class RequestListReplies with _$RequestListReplies {
  const factory RequestListReplies({
    @JsonKey(name: 'sort_by') required String sortBy,
    @JsonKey(name: 'limit') required int limit,
    @JsonKey(name: 'paging_key') int? pagingKey,
  }) = _RequestListReplies;

  factory RequestListReplies.fromJson(Map<String, dynamic> json) =>
      _$RequestListRepliesFromJson(json);
}

@freezed
class RequestListComments with _$RequestListComments {
  const factory RequestListComments({
    @JsonKey(name: 'sort_by') required String sortBy,
    @JsonKey(name: 'limit') required int limit,
    @JsonKey(name: 'paging_key') int? pagingKey,
  }) = _RequestListComments;

  factory RequestListComments.fromJson(Map<String, dynamic> json) =>
      _$RequestListCommentsFromJson(json);
}
