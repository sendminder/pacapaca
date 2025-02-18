import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/report_dto.dart';
import 'package:pacapaca/services/report_service.dart';

part 'report_provider.g.dart';

@riverpod
class ReportState extends _$ReportState {
  final _reportService = GetIt.instance<ReportService>();

  @override
  Future<List<UserReportDTO>> build() async {
    // 초기 신고 목록 로드
    final reports = await _reportService.getReports();
    return reports ?? [];
  }

  /// 사용자 신고하기
  Future<void> reportUser({
    required int userId,
    required String reason,
    int? commentId,
    int? articleId,
  }) async {
    final request = CreateReportRequest(
      reportedId: userId,
      reason: reason,
      commentId: commentId,
      articleId: articleId,
    );

    final report = await _reportService.createReport(request);
    if (report != null) {
      state = AsyncValue.data([...state.value ?? [], report]);
    }
  }

  /// 신고 내역 새로고침
  Future<void> refreshReports() async {
    state = const AsyncValue.loading();
    try {
      final reports = await _reportService.getReports();
      state = AsyncValue.data(reports ?? []);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

/// 특정 사용자에 대한 신고 여부 확인
@riverpod
bool isUserReported(IsUserReportedRef ref, int userId) {
  final reportState = ref.watch(reportStateProvider);
  return reportState.value?.any((report) => report.reportedId == userId) ??
      false;
}

/// 신고된 사용자 ID 목록 제공
@riverpod
List<int> reportedUserIds(ReportedUserIdsRef ref) {
  final reportState = ref.watch(reportStateProvider);
  return reportState.value?.map((report) => report.reportedId).toList() ?? [];
}
