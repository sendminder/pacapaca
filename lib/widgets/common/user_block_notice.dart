import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacapaca/providers/block_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/router.dart';

final skipBlockNoticeProvider = StateProvider<bool>((ref) => false);

class UserBlockNotice extends ConsumerWidget {
  UserBlockNotice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skipShownBlockNotice = ref.watch(skipBlockNoticeProvider);
    final blockStatus = ref.watch(userBlockStatusProvider);

    return blockStatus.when(
      data: (status) {
        if (status['isBlocked'] == true && !skipShownBlockNotice) {
          return _buildBlockedView(context, status['blockedTime'], ref);
        }
        return const SizedBox.shrink(); // 차단되지 않은 경우 빈 위젯 반환
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildBlockedView(
      BuildContext context, DateTime? blockUntil, WidgetRef ref) {
    final dateFormat = context.locale.languageCode == 'ko'
        ? DateFormat('yyyy년 MM월 dd일 HH시 mm분')
        : DateFormat('MMM dd, yyyy HH:mm');
    final formattedDate = blockUntil != null
        ? dateFormat.format(blockUntil)
        : 'user.block_notice.unblock_time'.tr();

    return Container(
      color: Colors.black.withAlpha(230),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[900]
                : Colors.white,
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
                'user.block_notice.title'.tr(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'user.block_notice.description'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[300]
                          : Colors.black,
                    ),
              ),
              const SizedBox(height: 20),
              Divider(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[700]
                    : Colors.grey[300],
              ),
              const SizedBox(height: 8),
              Text(
                'user.block_notice.unblock_time'.tr(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
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
                'user.block_notice.restrictions'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[400]
                          : Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ref.read(skipBlockNoticeProvider.notifier).state = true;
                  ref.invalidate(userBlockStatusProvider);
                  final router = ref.read(routerProvider);
                  router.go('/articles');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'user.block_notice.confirm'.tr(),
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
