import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pacapaca/models/dto/user_dto.dart';
part 'point_dto.freezed.dart';
part 'point_dto.g.dart';

@freezed
class ResponseGetTopPointUsers with _$ResponseGetTopPointUsers {
  const factory ResponseGetTopPointUsers({
    @JsonKey(name: 'top_users') required List<DisplayUserDTO> topUsers,
  }) = _ResponseGetTopPointUsers;

  factory ResponseGetTopPointUsers.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetTopPointUsersFromJson(json);
}

@freezed
class ResponseGetPointsHistory with _$ResponseGetPointsHistory {
  const factory ResponseGetPointsHistory({
    @JsonKey(name: 'histories') required List<PointsHistoryDTO> histories,
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
    @JsonKey(name: 'user_id') required int userId,
    required int amount,
    required String description,
    @JsonKey(name: 'create_time') required String createTime,
  }) = _PointsHistoryDTO;

  factory PointsHistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$PointsHistoryDTOFromJson(json);
}
