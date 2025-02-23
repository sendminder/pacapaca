// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestListPointRankingsImpl _$$RequestListPointRankingsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListPointRankingsImpl(
      limit: (json['limit'] as num).toInt(),
      pagingUserId: (json['paging_user_id'] as num?)?.toInt(),
      pagingAmount: (json['paging_amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestListPointRankingsImplToJson(
        _$RequestListPointRankingsImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'paging_user_id': instance.pagingUserId,
      'paging_amount': instance.pagingAmount,
    };

_$RequestListPointsHistoryImpl _$$RequestListPointsHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListPointsHistoryImpl(
      limit: (json['limit'] as num).toInt(),
      pagingKey: (json['paging_key'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestListPointsHistoryImplToJson(
        _$RequestListPointsHistoryImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'paging_key': instance.pagingKey,
    };

_$ResponseGetTopPointUsersImpl _$$ResponseGetTopPointUsersImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseGetTopPointUsersImpl(
      topUsers: (json['top_users'] as List<dynamic>?)
          ?.map((e) => DisplayUserDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResponseGetTopPointUsersImplToJson(
        _$ResponseGetTopPointUsersImpl instance) =>
    <String, dynamic>{
      'top_users': instance.topUsers,
    };

_$ResponseGetPointsHistoryImpl _$$ResponseGetPointsHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseGetPointsHistoryImpl(
      histories: (json['histories'] as List<dynamic>?)
          ?.map((e) => PointsHistoryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResponseGetPointsHistoryImplToJson(
        _$ResponseGetPointsHistoryImpl instance) =>
    <String, dynamic>{
      'histories': instance.histories,
    };

_$ResponseGetPointBalanceImpl _$$ResponseGetPointBalanceImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseGetPointBalanceImpl(
      userId: (json['user_id'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
    );

Map<String, dynamic> _$$ResponseGetPointBalanceImplToJson(
        _$ResponseGetPointBalanceImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'balance': instance.balance,
    };

_$PointsHistoryDTOImpl _$$PointsHistoryDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$PointsHistoryDTOImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String,
      createTime: json['create_time'] as String,
    );

Map<String, dynamic> _$$PointsHistoryDTOImplToJson(
        _$PointsHistoryDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'amount': instance.amount,
      'description': instance.description,
      'create_time': instance.createTime,
    };
