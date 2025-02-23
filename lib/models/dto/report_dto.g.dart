// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateReportRequestImpl _$$CreateReportRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReportRequestImpl(
      reportedId: (json['reported_id'] as num).toInt(),
      reason: json['reason'] as String,
      commentId: (json['comment_id'] as num?)?.toInt(),
      articleId: (json['article_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CreateReportRequestImplToJson(
        _$CreateReportRequestImpl instance) =>
    <String, dynamic>{
      'reported_id': instance.reportedId,
      'reason': instance.reason,
      'comment_id': instance.commentId,
      'article_id': instance.articleId,
    };

_$UserReportDTOImpl _$$UserReportDTOImplFromJson(Map<String, dynamic> json) =>
    _$UserReportDTOImpl(
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

Map<String, dynamic> _$$UserReportDTOImplToJson(_$UserReportDTOImpl instance) =>
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
