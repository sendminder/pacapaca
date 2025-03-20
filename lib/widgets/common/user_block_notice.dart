import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/block_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

class UserBlockNotice extends ConsumerWidget {
  const UserBlockNotice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockStatus = ref.watch(userBlockStatusProvider);

    return blockStatus.when(
      data: (status) {
        if (status['isBlocked'] == true) {
          return _buildBlockedView(context, status['blockUntil']);
        }
        return const SizedBox.shrink(); // 차단되지 않은 경우 빈 위젯 반환
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildBlockedView(BuildContext context, DateTime blockUntil) {
    final dateFormat = DateFormat('yyyy년 MM월 dd일 HH시 mm분', 'ko');
    final formattedDate = dateFormat.format(blockUntil);

    return Container(
      color: Colors.black.withAlpha(230),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.block,
                color: Colors.red,
                size: 64,
              ),
              const SizedBox(height: 20),
              Text(
                '계정 이용 제한 안내',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                '안녕하세요.\n커뮤니티 가이드라인 위반으로 일시적으로 서비스 이용이 제한되었습니다.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                '제한 해제 시간',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                formattedDate,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                '제한 기간 동안에는 글쓰기, 댓글 작성, 좋아요 등의 활동이 제한됩니다.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  '확인',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
