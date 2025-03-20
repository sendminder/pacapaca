import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/block_provider.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

/// 사용자 차단 기능 확인 유틸리티
///
/// 글쓰기, 좋아요, 댓글 등의 기능을 사용할 때 사용자가 차단된 상태인지 확인하고
/// 차단된 경우 알림 다이얼로그를 표시합니다.
class BlockCheckUtil {
  /// 사용자가 차단되었는지 확인하고, 차단된 경우 알림 다이얼로그를 표시합니다.
  ///
  /// [context] 다이얼로그를 표시할 컨텍스트
  /// [ref] 리버팟 참조 객체
  ///
  /// 차단되지 않은 경우 true, 차단된 경우 false 반환
  static Future<bool> canPerformAction(
      BuildContext context, WidgetRef ref) async {
    final blockStatus = ref.read(userBlockStatusProvider);

    return blockStatus.when(
      data: (status) {
        if (status['isBlocked'] == true) {
          // 차단된 경우 알림 다이얼로그 표시
          _showBlockedDialog(context, status['blockUntil']);
          return false;
        }
        return true;
      },
      loading: () => false, // 로딩 중에는 작업 불가
      error: (_, __) => true, // 오류 발생 시에는 작업 허용 (UX 측면에서)
    );
  }

  /// 차단 알림 다이얼로그를 표시합니다.
  static void _showBlockedDialog(BuildContext context, DateTime blockUntil) {
    final dateFormat = context.locale.languageCode == 'ko'
        ? DateFormat('yyyy년 MM월 dd일 HH시 mm분')
        : DateFormat('MMM dd, yyyy HH:mm');
    final formattedDate = dateFormat.format(blockUntil);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.block, color: Colors.red),
            const SizedBox(width: 8),
            Text('user.block_notice.title_short'.tr()),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('user.block_notice.dialog_description'.tr()),
            const SizedBox(height: 16),
            Text(
              'user.block_notice.unblock_time_with_date'
                  .tr(args: [formattedDate]),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red.withAlpha(200),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('user.block_notice.confirm'.tr()),
          ),
        ],
      ),
    );
  }
}
