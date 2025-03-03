import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pacapaca/models/dto/user_dto.dart';

part 'carrot_dto.freezed.dart';
part 'carrot_dto.g.dart';

@freezed
class RequestSendCarrots with _$RequestSendCarrots {
  const factory RequestSendCarrots({
    @JsonKey(name: 'receiver_id') required int receiverId,
    required int amount,
    String? description,
    @JsonKey(name: 'comment_id') int? commentId,
    @JsonKey(name: 'article_id') int? articleId,
  }) = _RequestSendCarrots;

  factory RequestSendCarrots.fromJson(Map<String, dynamic> json) =>
      _$RequestSendCarrotsFromJson(json);
}

@freezed
class RequestAdminRewardCarrots with _$RequestAdminRewardCarrots {
  const factory RequestAdminRewardCarrots({
    @JsonKey(name: 'user_id') required int userId,
    required int amount,
    required String description,
  }) = _RequestAdminRewardCarrots;

  factory RequestAdminRewardCarrots.fromJson(Map<String, dynamic> json) =>
      _$RequestAdminRewardCarrotsFromJson(json);
}

@freezed
class RequestListTransactions with _$RequestListTransactions {
  const factory RequestListTransactions({
    required int limit,
    int? pagingKey,
  }) = _RequestListTransactions;

  factory RequestListTransactions.fromJson(Map<String, dynamic> json) =>
      _$RequestListTransactionsFromJson(json);
}

@freezed
class RequestListCarrotRankings with _$RequestListCarrotRankings {
  const factory RequestListCarrotRankings({
    required int limit,
    int? pagingKey,
  }) = _RequestListCarrotRankings;

  factory RequestListCarrotRankings.fromJson(Map<String, dynamic> json) =>
      _$RequestListCarrotRankingsFromJson(json);
}

@freezed
class ResponseCarrotBalance with _$ResponseCarrotBalance {
  const factory ResponseCarrotBalance({
    @JsonKey(name: 'user_id') required int userId,
    required int balance,
  }) = _ResponseCarrotBalance;

  factory ResponseCarrotBalance.fromJson(Map<String, dynamic> json) =>
      _$ResponseCarrotBalanceFromJson(json);
}

@freezed
class ResponseCarrotTransaction with _$ResponseCarrotTransaction {
  const factory ResponseCarrotTransaction({
    required CarrotTransactionDTO transaction,
  }) = _ResponseCarrotTransaction;

  factory ResponseCarrotTransaction.fromJson(Map<String, dynamic> json) =>
      _$ResponseCarrotTransactionFromJson(json);
}

@freezed
class ResponseCarrotTransactions with _$ResponseCarrotTransactions {
  const factory ResponseCarrotTransactions({
    List<CarrotTransactionDTO>? transactions,
  }) = _ResponseCarrotTransactions;

  factory ResponseCarrotTransactions.fromJson(Map<String, dynamic> json) =>
      _$ResponseCarrotTransactionsFromJson(json);
}

@freezed
class ResponseCarrotRankings with _$ResponseCarrotRankings {
  const factory ResponseCarrotRankings({
    @JsonKey(name: 'top_receivers') List<DisplayUserDTO>? topReceivers,
    @JsonKey(name: 'top_senders') List<DisplayUserDTO>? topSenders,
  }) = _ResponseCarrotRankings;

  factory ResponseCarrotRankings.fromJson(Map<String, dynamic> json) =>
      _$ResponseCarrotRankingsFromJson(json);
}

@freezed
class CarrotTransactionDTO with _$CarrotTransactionDTO {
  const factory CarrotTransactionDTO({
    required int id,
    @JsonKey(name: 'sender_id') int? senderId,
    @JsonKey(name: 'receiver_id') required int receiverId,
    required int amount,
    String? description,
    @JsonKey(name: 'comment_id') int? commentId,
    @JsonKey(name: 'article_id') int? articleId,
    @JsonKey(name: 'create_time') required String createTime,
    required String type,
  }) = _CarrotTransactionDTO;

  factory CarrotTransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$CarrotTransactionDTOFromJson(json);
}
