// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointRankingResponseImpl _$$PointRankingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PointRankingResponseImpl(
      topUsers: (json['top_users'] as List<dynamic>)
          .map((e) => PointRankingDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PointRankingResponseImplToJson(
        _$PointRankingResponseImpl instance) =>
    <String, dynamic>{
      'top_users': instance.topUsers,
    };

_$PointHistoryResponseImpl _$$PointHistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PointHistoryResponseImpl(
      histories: (json['histories'] as List<dynamic>)
          .map((e) => PointHistoryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PointHistoryResponseImplToJson(
        _$PointHistoryResponseImpl instance) =>
    <String, dynamic>{
      'histories': instance.histories,
    };

_$PointBalanceResponseImpl _$$PointBalanceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PointBalanceResponseImpl(
      userId: (json['user_id'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
    );

Map<String, dynamic> _$$PointBalanceResponseImplToJson(
        _$PointBalanceResponseImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'balance': instance.balance,
    };

_$PointRankingDTOImpl _$$PointRankingDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$PointRankingDTOImpl(
      userId: (json['user_id'] as num).toInt(),
      nickname: json['nickname'] as String,
      profileUrl: json['profile_url'] as String?,
      balance: (json['balance'] as num).toInt(),
    );

Map<String, dynamic> _$$PointRankingDTOImplToJson(
        _$PointRankingDTOImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'nickname': instance.nickname,
      'profile_url': instance.profileUrl,
      'balance': instance.balance,
    };

_$PointHistoryDTOImpl _$$PointHistoryDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$PointHistoryDTOImpl(
      userId: (json['user_id'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String,
      createTime: json['create_time'] as String,
    );

Map<String, dynamic> _$$PointHistoryDTOImplToJson(
        _$PointHistoryDTOImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'amount': instance.amount,
      'description': instance.description,
      'create_time': instance.createTime,
    };
