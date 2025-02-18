import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_dto.freezed.dart';
part 'block_dto.g.dart';

@freezed
class CreateBlockRequest with _$CreateBlockRequest {
  const factory CreateBlockRequest({
    @JsonKey(name: 'reported_id') required int reportedId,
    required String reason,
    @JsonKey(name: 'comment_id') int? commentId,
    @JsonKey(name: 'article_id') int? articleId,
  }) = _CreateBlockRequest;

  factory CreateBlockRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBlockRequestFromJson(json);
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
class GetBlockResponse with _$GetBlockResponse {
  const factory GetBlockResponse({
    required UserBlockDTO block,
  }) = _GetBlockResponse;

  factory GetBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBlockResponseFromJson(json);
}

@freezed
class GetBlocksResponse with _$GetBlocksResponse {
  const factory GetBlocksResponse({
    required List<UserBlockDTO> blocks,
  }) = _GetBlocksResponse;

  factory GetBlocksResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBlocksResponseFromJson(json);
}
