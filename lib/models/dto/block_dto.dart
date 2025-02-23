import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_dto.freezed.dart';
part 'block_dto.g.dart';

@freezed
class RequestCreateUserBlock with _$RequestCreateUserBlock {
  const factory RequestCreateUserBlock({
    @JsonKey(name: 'reported_id') required int reportedId,
    required String reason,
    @JsonKey(name: 'comment_id') int? commentId,
    @JsonKey(name: 'article_id') int? articleId,
  }) = _RequestCreateUserBlock;

  factory RequestCreateUserBlock.fromJson(Map<String, dynamic> json) =>
      _$RequestCreateUserBlockFromJson(json);
}

@freezed
class UserBlockDTO with _$UserBlockDTO {
  const factory UserBlockDTO({
    required int id,
    @JsonKey(name: 'reporter_id') required int reporterId,
    @JsonKey(name: 'reported_id') required int reportedId,
    required String reason,
    required String status,
    @JsonKey(name: 'comment_id') int? commentId,
    @JsonKey(name: 'article_id') int? articleId,
    @JsonKey(name: 'create_time') required String createTime,
    @JsonKey(name: 'update_time') required String updateTime,
  }) = _UserBlockDTO;

  factory UserBlockDTO.fromJson(Map<String, dynamic> json) =>
      _$UserBlockDTOFromJson(json);
}

@freezed
class ResponseUserBlock with _$ResponseUserBlock {
  const factory ResponseUserBlock({
    required UserBlockDTO block,
  }) = _ResponseUserBlock;

  factory ResponseUserBlock.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserBlockFromJson(json);
}

@freezed
class ResponseUserBlocks with _$ResponseUserBlocks {
  const factory ResponseUserBlocks({
    required List<UserBlockDTO> blocks,
  }) = _ResponseUserBlocks;

  factory ResponseUserBlocks.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserBlocksFromJson(json);
}
