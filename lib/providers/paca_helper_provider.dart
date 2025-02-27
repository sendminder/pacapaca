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
    required String category,
    required List<Message> messages,
  }) async {
    final request = RequestDefineProblems(
      category: category,
      messages: messages,
    );

    return await _pacaHelperService.defineProblems(request);
  }
}
