import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/report_dto.dart';
import 'package:pacapaca/services/report_service.dart';

part 'report_provider.g.dart';

@riverpod
class UserReport extends _$UserReport {
  final _reportService = GetIt.instance<ReportService>();

  @override
  Future<UserReportDTO?> build() async {
    return null;
  }

  /// 사용자 신고하기
  Future<UserReportDTO?> reportUser({
    required int userId,
    required String reason,
    int? commentId,
    int? articleId,
  }) async {
    final request = RequestCreateUserReport(
      reportedId: userId,
      reason: reason,
      commentId: commentId,
      articleId: articleId,
    );

    return await _reportService.createReport(request);
  }
}
