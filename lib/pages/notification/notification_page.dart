import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:pacapaca/models/dto/notification_dto.dart';
import 'package:pacapaca/providers/notification_provider.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('notification.title'.tr()),
        backgroundColor: Theme.of(context).colorScheme.surface,
        scrolledUnderElevation: 0,
        surfaceTintColor: null,
        actions: [
          // 모두 읽음 표시 버튼
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('notification.mark_all_read_title'.tr()),
                  content: Text('notification.mark_all_read_confirm'.tr()),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text('notification.cancel'.tr()),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text('notification.confirm'.tr()),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                await ref.read(notificationsProvider.notifier).markAllAsRead();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('notification.all_marked_read'.tr()),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
      body: notifications.when(
        data: (notificationList) {
          if (notificationList.isEmpty) {
            return Center(
              child: Text(
                'notification.empty'.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () =>
                ref.read(notificationsProvider.notifier).refreshNotifications(),
            child: NotificationListView(
              notifications: notificationList,
              onLoadMore: () =>
                  ref.read(notificationsProvider.notifier).loadMore(),
            ),
          );
        },
        loading: () => const Center(child: RotatingPacaLoader()),
        error: (error, stack) => Center(
          child: Text(
            'notification.error_loading'.tr(args: [error.toString()]),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ),
    );
  }
}

class NotificationListView extends ConsumerWidget {
  final List<NotificationDTO> notifications;
  final VoidCallback onLoadMore;

  const NotificationListView({
    super.key,
    required this.notifications,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ScrollController();

    // 스크롤 이벤트 리스너 추가
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        onLoadMore();
      }
    });

    return ListView.builder(
      controller: scrollController,
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationItem(notification: notification);
      },
    );
  }
}

class NotificationItem extends ConsumerWidget {
  final NotificationDTO notification;

  const NotificationItem({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key('notification-${notification.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.onError,
        ),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('notification.delete'.tr()),
                content: Text('notification.delete_confirm'.tr()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text('notification.cancel'.tr()),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(
                      'notification.delete'.tr(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ) ??
            false;
      },
      onDismissed: (direction) {
        ref
            .read(notificationsProvider.notifier)
            .deleteNotification(notification.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('notification.deleted'.tr()),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          // 알림 읽음 표시
          if (!notification.isRead) {
            ref
                .read(notificationsProvider.notifier)
                .markAsRead(notification.id);
          }

          // 알림 타입에 따라 다른 페이지로 이동
          _navigateByNotificationType(context, notification);
        },
        child: Container(
          color: notification.isRead
              ? null
              : Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1),
          child: ListTile(
            title: Text(
              notification.title,
              style: TextStyle(
                fontWeight:
                    notification.isRead ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.body),
                const SizedBox(height: 4),
                Text(
                  DateFormat('yyyy-MM-dd HH:mm')
                      .format(DateTime.parse(notification.createTime)),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            trailing: !notification.isRead
                ? Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
      ),
    );
  }

  void _navigateByNotificationType(
      BuildContext context, NotificationDTO notification) {
    // 알림 타입에 따라 다른 페이지로 이동
    switch (notification.type) {
      case 'comment':
        context.push('/articles/${notification.refId}');
        break;
      case 'article':
        context.push('/articles/${notification.refId}');
        break;
      case 'system':
        // 시스템 알림은 특별한 처리 없음
        break;
      default:
        // 기본적으로는 아무 동작 없음
        break;
    }
  }
}
