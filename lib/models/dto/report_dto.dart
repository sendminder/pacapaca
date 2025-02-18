import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_dto.freezed.dart';
part 'report_dto.g.dart';

@freezed
class CreateReportRequest with _$CreateReportRequest {
  const factory CreateReportRequest({
    @JsonKey(name: 'reported_id') required int reportedId,
    required String reason,
    @JsonKey(name: 'comment_id') int? commentId,
    @JsonKey(name: 'article_id') int? articleId,
  }) = _CreateReportRequest;

  factory CreateReportRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReportRequestFromJson(json);
}

@freezed
class UserReportDTO with _$UserReportDTO {
  const factory UserReportDTO({
    required int id,
    @JsonKey(name: 'reporter_id') required int reporterId,
    @JsonKey(name: 'reported_id') required int reportedId,
    required String reason,
    required String status,
    @JsonKey(name: 'comment_id') int? commentId,
    @JsonKey(name: 'article_id') int? articleId,
    @JsonKey(name: 'create_time') required String createTime,
    @JsonKey(name: 'update_time') required String updateTime,
  }) = _UserReportDTO;

  factory UserReportDTO.fromJson(Map<String, dynamic> json) =>
      _$UserReportDTOFromJson(json);
}

@freezed
class GetReportResponse with _$GetReportResponse {
  const factory GetReportResponse({
    required UserReportDTO report,
  }) = _GetReportResponse;

  factory GetReportResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReportResponseFromJson(json);
}
