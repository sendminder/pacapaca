// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestCreateUserBlockImpl _$$RequestCreateUserBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestCreateUserBlockImpl(
      reportedId: (json['reported_id'] as num).toInt(),
      reason: json['reason'] as String,
      commentId: (json['comment_id'] as num?)?.toInt(),
      articleId: (json['article_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestCreateUserBlockImplToJson(
        _$RequestCreateUserBlockImpl instance) =>
    <String, dynamic>{
      'reported_id': instance.reportedId,
      'reason': instance.reason,
      'comment_id': instance.commentId,
      'article_id': instance.articleId,
    };

_$UserBlockDTOImpl _$$UserBlockDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserBlockDTOImpl(
      id: (json['id'] as num).toInt(),
      reporterId: (json['reporter_id'] as num).toInt(),
      reportedId: (json['reported_id'] as num).toInt(),
      reason: json['reason'] as String,
      status: json['status'] as String,
      commentId: (json['comment_id'] as num?)?.toInt(),
      articleId: (json['article_id'] as num?)?.toInt(),
      createTime: json['create_time'] as String,
      updateTime: json['update_time'] as String,
    );

Map<String, dynamic> _$$UserBlockDTOImplToJson(_$UserBlockDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reporter_id': instance.reporterId,
      'reported_id': instance.reportedId,
      'reason': instance.reason,
      'status': instance.status,
      'comment_id': instance.commentId,
      'article_id': instance.articleId,
      'create_time': instance.createTime,
      'update_time': instance.updateTime,
    };

_$ResponseUserBlockImpl _$$ResponseUserBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseUserBlockImpl(
      block: UserBlockDTO.fromJson(json['block'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseUserBlockImplToJson(
        _$ResponseUserBlockImpl instance) =>
    <String, dynamic>{
      'block': instance.block,
    };

_$ResponseUserBlocksImpl _$$ResponseUserBlocksImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseUserBlocksImpl(
      blocks: (json['blocks'] as List<dynamic>?)
          ?.map((e) => UserBlockDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResponseUserBlocksImplToJson(
        _$ResponseUserBlocksImpl instance) =>
    <String, dynamic>{
      'blocks': instance.blocks,
    };
