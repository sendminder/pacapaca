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

_$RequestAdminRewardCarrotsImpl _$$RequestAdminRewardCarrotsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestAdminRewardCarrotsImpl(
      userId: (json['user_id'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$RequestAdminRewardCarrotsImplToJson(
        _$RequestAdminRewardCarrotsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'amount': instance.amount,
      'description': instance.description,
    };

_$RequestListTransactionsImpl _$$RequestListTransactionsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListTransactionsImpl(
      limit: (json['limit'] as num).toInt(),
      pagingKey: (json['pagingKey'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestListTransactionsImplToJson(
        _$RequestListTransactionsImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'pagingKey': instance.pagingKey,
    };

_$RequestListCarrotRankingsImpl _$$RequestListCarrotRankingsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListCarrotRankingsImpl(
      limit: (json['limit'] as num).toInt(),
      pagingKey: (json['pagingKey'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestListCarrotRankingsImplToJson(
        _$RequestListCarrotRankingsImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'pagingKey': instance.pagingKey,
    };

_$ResponseCarrotBalanceImpl _$$ResponseCarrotBalanceImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseCarrotBalanceImpl(
      userId: (json['user_id'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
    );

Map<String, dynamic> _$$ResponseCarrotBalanceImplToJson(
        _$ResponseCarrotBalanceImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'balance': instance.balance,
    };

_$ResponseCarrotTransactionImpl _$$ResponseCarrotTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseCarrotTransactionImpl(
      transaction: CarrotTransactionDTO.fromJson(
          json['transaction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseCarrotTransactionImplToJson(
        _$ResponseCarrotTransactionImpl instance) =>
    <String, dynamic>{
      'transaction': instance.transaction,
    };

_$ResponseCarrotTransactionsImpl _$$ResponseCarrotTransactionsImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseCarrotTransactionsImpl(
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => CarrotTransactionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResponseCarrotTransactionsImplToJson(
        _$ResponseCarrotTransactionsImpl instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
    };

_$ResponseCarrotRankingsImpl _$$ResponseCarrotRankingsImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseCarrotRankingsImpl(
      topReceivers: (json['top_receivers'] as List<dynamic>?)
          ?.map((e) => DisplayUserDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      topSenders: (json['top_senders'] as List<dynamic>?)
          ?.map((e) => DisplayUserDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResponseCarrotRankingsImplToJson(
        _$ResponseCarrotRankingsImpl instance) =>
    <String, dynamic>{
      'top_receivers': instance.topReceivers,
      'top_senders': instance.topSenders,
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
