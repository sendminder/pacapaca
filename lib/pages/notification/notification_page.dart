import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pacapaca/models/dto/notification_dto.dart';
import 'package:pacapaca/providers/notification_provider.dart';
import 'package:pacapaca/widgets/page_title.dart';
import 'package:pacapaca/widgets/shared/rotating_paca_loader.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  final _scrollController = ScrollController();
  final _logger = GetIt.instance<Logger>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      ref.read(notificationsProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final notificationsAsync = ref.watch(notificationsProvider);
    final unreadCount = ref.watch(unreadNotificationCountProvider);

    return Scaffold(
      appBar: PageTitle(
        title: 'notification.title'.tr(),
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle_outline),
            onPressed: () {
              ref.read(notificationsProvider.notifier).markAllAsRead();
            },
            tooltip: 'notification.mark_all_read'.tr(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(notificationsProvider.notifier).refreshNotifications();
        },
        child: notificationsAsync.when(
          data: (notifications) {
            if (notifications.isEmpty) {
              return _buildEmptyState();
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return _buildNotificationItem(notifications[index]);
              },
            );
          },
          loading: () => const Center(child: RotatingPacaLoader()),
          error: (error, stackTrace) => Center(
            child: Text('error.common'.tr()),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
          ),
          const SizedBox(height: 16),
          Text(
            'notification.empty'.tr(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(NotificationDTO notification) {
    final colorScheme = Theme.of(context).colorScheme;
    final dateTime = DateTime.parse(notification.createTime);
    final timeAgo =
        timeago.format(dateTime, locale: context.locale.languageCode);

    return Dismissible(
      key: Key('notification_${notification.id}'),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        ref
            .read(notificationsProvider.notifier)
            .deleteNotification(notification.id);
      },
      child: InkWell(
        onTap: () {
          // 알림 읽음 표시
          if (!notification.isRead) {
            ref
                .read(notificationsProvider.notifier)
                .markAsRead(notification.id);
          }

          // 알림 타입에 따라 적절한 페이지로 이동
          _navigateToContent(notification);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: notification.isRead
                ? null
                : colorScheme.primary.withOpacity(0.05),
            border: Border(
              bottom: BorderSide(
                color: colorScheme.outline.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNotificationIcon(notification.type),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: notification.isRead
                                ? FontWeight.normal
                                : FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.body,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withOpacity(0.7),
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      timeAgo,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withOpacity(0.5),
                          ),
                    ),
                  ],
                ),
              ),
              if (!notification.isRead)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 4, left: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationIcon(String type) {
    final colorScheme = Theme.of(context).colorScheme;

    IconData iconData;
    Color iconColor;

    switch (type) {
      case 'like':
        iconData = Icons.favorite;
        iconColor = Colors.red;
        break;
      case 'comment':
        iconData = Icons.comment;
        iconColor = Colors.blue;
        break;
      case 'carrot':
        iconData = Icons.emoji_food_beverage;
        iconColor = Colors.orange;
        break;
      case 'system':
        iconData = Icons.info;
        iconColor = colorScheme.primary;
        break;
      case 'mention':
        iconData = Icons.alternate_email;
        iconColor = Colors.purple;
        break;
      default:
        iconData = Icons.notifications;
        iconColor = colorScheme.primary;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        size: 20,
        color: iconColor,
      ),
    );
  }

  void _navigateToContent(NotificationDTO notification) {
    try {
      // 알림 타입에 따라 적절한 페이지로 이동
      switch (notification.type) {
        case 'like':
        case 'comment':
        case 'mention':
          // refId가 게시글 ID인 경우
          context.push('/articles/${notification.refId}');
          break;
        case 'carrot':
          // refId가 사용자 ID인 경우
          context.push('/users/${notification.refId}');
          break;
        case 'system':
          // 시스템 알림은 특별한 처리가 필요 없을 수 있음
          break;
        default:
          _logger.i('알 수 없는 알림 타입: ${notification.type}');
          break;
      }
    } catch (e, stackTrace) {
      _logger.e('알림 내용으로 이동 중 오류', error: e, stackTrace: stackTrace);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
