import 'package:freezed_annotation/freezed_annotation.dart';

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
class RequestListTransactions with _$RequestListTransactions {
  const factory RequestListTransactions({
    required int limit,
    @JsonKey(name: 'paging_key') int? pagingKey,
  }) = _RequestListTransactions;

  factory RequestListTransactions.fromJson(Map<String, dynamic> json) =>
      _$RequestListTransactionsFromJson(json);
}

@freezed
class ResponseCarrotRankings with _$ResponseCarrotRankings {
  const factory ResponseCarrotRankings({
    @JsonKey(name: 'top_receivers')
    required List<CarrotRankingDTO> topReceivers,
    @JsonKey(name: 'top_senders') required List<CarrotRankingDTO> topSenders,
  }) = _ResponseCarrotRankings;

  factory ResponseCarrotRankings.fromJson(Map<String, dynamic> json) =>
      _$ResponseCarrotRankingsFromJson(json);
}

@freezed
class CarrotTransactionDTO with _$CarrotTransactionDTO {
  const factory CarrotTransactionDTO({
    required int id,
    @JsonKey(name: 'sender_id') required int senderId,
    @JsonKey(name: 'receiver_id') required int receiverId,
    required int amount,
    String? description,
    @JsonKey(name: 'comment_id') int? commentId,
    @JsonKey(name: 'article_id') int? articleId,
    @JsonKey(name: 'create_time') required String createTime,
  }) = _CarrotTransactionDTO;

  factory CarrotTransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$CarrotTransactionDTOFromJson(json);
}

@freezed
class CarrotBalanceDTO with _$CarrotBalanceDTO {
  const factory CarrotBalanceDTO({
    @JsonKey(name: 'user_id') required int userId,
    required int balance,
  }) = _CarrotBalanceDTO;

  factory CarrotBalanceDTO.fromJson(Map<String, dynamic> json) =>
      _$CarrotBalanceDTOFromJson(json);
}

@freezed
class CarrotRankingDTO with _$CarrotRankingDTO {
  const factory CarrotRankingDTO({
    @JsonKey(name: 'user_id') required int userId,
    required String nickname,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    required int total,
  }) = _CarrotRankingDTO;

  factory CarrotRankingDTO.fromJson(Map<String, dynamic> json) =>
      _$CarrotRankingDTOFromJson(json);
}
