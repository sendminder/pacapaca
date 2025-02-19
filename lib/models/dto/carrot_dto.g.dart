// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestSendCarrotsImpl _$$RequestSendCarrotsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestSendCarrotsImpl(
      receiverId: (json['receiver_id'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String?,
      commentId: (json['comment_id'] as num?)?.toInt(),
      articleId: (json['article_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestSendCarrotsImplToJson(
        _$RequestSendCarrotsImpl instance) =>
    <String, dynamic>{
      'receiver_id': instance.receiverId,
      'amount': instance.amount,
      'description': instance.description,
      'comment_id': instance.commentId,
      'article_id': instance.articleId,
    };

_$RequestListTransactionsImpl _$$RequestListTransactionsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListTransactionsImpl(
      limit: (json['limit'] as num).toInt(),
      pagingKey: (json['paging_key'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestListTransactionsImplToJson(
        _$RequestListTransactionsImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'paging_key': instance.pagingKey,
    };

_$CarrotTransactionDTOImpl _$$CarrotTransactionDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CarrotTransactionDTOImpl(
      id: (json['id'] as num).toInt(),
      senderId: (json['sender_id'] as num).toInt(),
      receiverId: (json['receiver_id'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String?,
      commentId: (json['comment_id'] as num?)?.toInt(),
      articleId: (json['article_id'] as num?)?.toInt(),
      createTime: json['create_time'] as String,
    );

Map<String, dynamic> _$$CarrotTransactionDTOImplToJson(
        _$CarrotTransactionDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender_id': instance.senderId,
      'receiver_id': instance.receiverId,
      'amount': instance.amount,
      'description': instance.description,
      'comment_id': instance.commentId,
      'article_id': instance.articleId,
      'create_time': instance.createTime,
    };

_$CarrotBalanceDTOImpl _$$CarrotBalanceDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CarrotBalanceDTOImpl(
      userId: (json['user_id'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
    );

Map<String, dynamic> _$$CarrotBalanceDTOImplToJson(
        _$CarrotBalanceDTOImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'balance': instance.balance,
    };

_$CarrotRankingDTOImpl _$$CarrotRankingDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CarrotRankingDTOImpl(
      topReceivers: (json['top_receivers'] as List<dynamic>)
          .map((e) => CarrotRankingUserDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      topSenders: (json['top_senders'] as List<dynamic>)
          .map((e) => CarrotRankingUserDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CarrotRankingDTOImplToJson(
        _$CarrotRankingDTOImpl instance) =>
    <String, dynamic>{
      'top_receivers': instance.topReceivers,
      'top_senders': instance.topSenders,
    };

_$CarrotRankingUserDTOImpl _$$CarrotRankingUserDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CarrotRankingUserDTOImpl(
      userId: (json['userId'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$$CarrotRankingUserDTOImplToJson(
        _$CarrotRankingUserDTOImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'amount': instance.amount,
    };
