import 'package:freezed_annotation/freezed_annotation.dart';

part 'point_dto.freezed.dart';
part 'point_dto.g.dart';

@freezed
class PointRankingResponse with _$PointRankingResponse {
  const factory PointRankingResponse({
    @JsonKey(name: 'top_users') required List<PointRankingDTO> topUsers,
  }) = _PointRankingResponse;

  factory PointRankingResponse.fromJson(Map<String, dynamic> json) =>
      _$PointRankingResponseFromJson(json);
}

@freezed
class PointHistoryResponse with _$PointHistoryResponse {
  const factory PointHistoryResponse({
    @JsonKey(name: 'histories') required List<PointHistoryDTO> histories,
  }) = _PointHistoryResponse;

  factory PointHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$PointHistoryResponseFromJson(json);
}

@freezed
class PointBalanceResponse with _$PointBalanceResponse {
  const factory PointBalanceResponse({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'balance') required int balance,
  }) = _PointBalanceResponse;

  factory PointBalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$PointBalanceResponseFromJson(json);
}

@freezed
class PointRankingDTO with _$PointRankingDTO {
  const factory PointRankingDTO({
    @JsonKey(name: 'user_id') required int userId,
    required String nickname,
    @JsonKey(name: 'profile_url') String? profileUrl,
    required int balance,
  }) = _PointRankingDTO;

  factory PointRankingDTO.fromJson(Map<String, dynamic> json) =>
      _$PointRankingDTOFromJson(json);
}

@freezed
class PointHistoryDTO with _$PointHistoryDTO {
  const factory PointHistoryDTO({
    @JsonKey(name: 'user_id') required int userId,
    required int amount,
    required String description,
    @JsonKey(name: 'create_time') required String createTime,
  }) = _PointHistoryDTO;

  factory PointHistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$PointHistoryDTOFromJson(json);
}
