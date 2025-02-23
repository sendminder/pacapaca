import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
part 'point_dto.freezed.dart';
part 'point_dto.g.dart';

@freezed
class RequestListPointRankings with _$RequestListPointRankings {
  const factory RequestListPointRankings({
    required int limit,
    @JsonKey(name: 'paging_user_id') int? pagingUserId,
    @JsonKey(name: 'paging_amount') int? pagingAmount,
  }) = _RequestListPointRankings;

  factory RequestListPointRankings.fromJson(Map<String, dynamic> json) =>
      _$RequestListPointRankingsFromJson(json);
}

@freezed
class RequestListPointsHistory with _$RequestListPointsHistory {
  const factory RequestListPointsHistory({
    required int limit,
    @JsonKey(name: 'paging_key') int? pagingKey,
  }) = _RequestListPointsHistory;

  factory RequestListPointsHistory.fromJson(Map<String, dynamic> json) =>
      _$RequestListPointsHistoryFromJson(json);
}

@freezed
class ResponseGetTopPointUsers with _$ResponseGetTopPointUsers {
  const factory ResponseGetTopPointUsers({
    @JsonKey(name: 'top_users') List<DisplayUserDTO>? topUsers,
  }) = _ResponseGetTopPointUsers;

  factory ResponseGetTopPointUsers.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetTopPointUsersFromJson(json);
}

@freezed
class ResponseGetPointsHistory with _$ResponseGetPointsHistory {
  const factory ResponseGetPointsHistory({
    @JsonKey(name: 'histories') List<PointsHistoryDTO>? histories,
  }) = _ResponseGetPointsHistory;

  factory ResponseGetPointsHistory.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetPointsHistoryFromJson(json);
}

@freezed
class ResponseGetPointBalance with _$ResponseGetPointBalance {
  const factory ResponseGetPointBalance({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'balance') required int balance,
  }) = _ResponseGetPointBalance;

  factory ResponseGetPointBalance.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetPointBalanceFromJson(json);
}

@freezed
class PointsHistoryDTO with _$PointsHistoryDTO {
  const factory PointsHistoryDTO({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    required int amount,
    required String description,
    @JsonKey(name: 'create_time') required String createTime,
  }) = _PointsHistoryDTO;

  factory PointsHistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$PointsHistoryDTOFromJson(json);
}
