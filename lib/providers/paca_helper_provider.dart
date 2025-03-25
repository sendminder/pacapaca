import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/paca_helper.dart';
import 'package:pacapaca/services/paca_helper_service.dart';

part 'paca_helper_provider.g.dart';

@riverpod
class PacaHelper extends _$PacaHelper {
  final _pacaHelperService = GetIt.instance<PacaHelperService>();

  @override
  Future<ResponseDefineProblems?> build() async {
    return null;
  }

  /// 고민 정의하기
  Future<ResponseDefineProblems?> defineProblems({
    required List<Message> messages,
  }) async {
    final request = RequestDefineProblems(
      messages: messages,
    );

    return await _pacaHelperService.defineProblems(request);
  }

  /// 고민 요약하기
  Future<ResponseSummarizeConcerns?> summarizeConcerns({
    required List<Message> messages,
  }) async {
    final request = RequestSummarizeConcerns(messages: messages);
    return await _pacaHelperService.summarizeConcerns(request);
  }
}
