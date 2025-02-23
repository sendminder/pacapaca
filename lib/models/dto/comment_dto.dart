import 'package:freezed_annotation/freezed_annotation.dart';

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
    required String nickname,
    @JsonKey(name: 'profile_image_url') required String profileImageUrl,
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
  }) = _RequestCreateComment;

  factory RequestCreateComment.fromJson(Map<String, dynamic> json) =>
      _$RequestCreateCommentFromJson(json);
}
