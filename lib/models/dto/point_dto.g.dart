// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseGetTopPointUsersImpl _$$ResponseGetTopPointUsersImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseGetTopPointUsersImpl(
      topUsers: (json['top_users'] as List<dynamic>)
          .map((e) => DisplayUserDTO.fromJson(e as Map<String, dynamic>))
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
      histories: (json['histories'] as List<dynamic>)
          .map((e) => PointsHistoryDTO.fromJson(e as Map<String, dynamic>))
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
      userId: (json['user_id'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      description: json['description'] as String,
      createTime: json['create_time'] as String,
    );

Map<String, dynamic> _$$PointsHistoryDTOImplToJson(
        _$PointsHistoryDTOImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'amount': instance.amount,
      'description': instance.description,
      'create_time': instance.createTime,
    };
