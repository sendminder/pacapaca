import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/notification_dto.dart';
import 'package:pacapaca/services/notification_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'notification_provider.g.dart';

@riverpod
class Notifications extends _$Notifications {
  final _notificationService = GetIt.instance<NotificationService>();
  int _pagingKey = 0;
  bool _hasMore = true;
  static const int _limit = 20;

  @override
  Future<List<NotificationDTO>> build() async {
    // 초기 알림 목록 로드
    final response = await _notificationService.getNotifications(
      limit: _limit,
      pagingKey: _pagingKey,
    );

    if (response != null) {
      _hasMore = response.notifications.length >= _limit;
      if (response.notifications.isNotEmpty) {
        _pagingKey = response.notifications.last.id;
      }
      return response.notifications;
    }

    return [];
  }

  /// 알림 더 불러오기
  Future<void> loadMore() async {
    if (!_hasMore || state.isLoading) return;

    state = const AsyncValue.loading();

    try {
      final response = await _notificationService.getNotifications(
        limit: _limit,
        pagingKey: _pagingKey,
      );

      if (response != null) {
        final newNotifications = response.notifications;
        _hasMore = newNotifications.length >= _limit;

        if (newNotifications.isNotEmpty) {
          _pagingKey = newNotifications.last.id;
          state = AsyncValue.data([...state.value ?? [], ...newNotifications]);
        } else {
          state = AsyncValue.data(state.value ?? []);
        }
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// 알림 읽음 표시
  Future<void> markAsRead(int notificationId) async {
    await _notificationService.markAsRead(notificationId);

    state = AsyncValue.data(
      state.value?.map((notification) {
            if (notification.id == notificationId) {
              return notification.copyWith(isRead: true);
            }
            return notification;
          }).toList() ??
          [],
    );
  }

  /// 모든 알림 읽음 표시
  Future<void> markAllAsRead() async {
    await _notificationService.markAllAsRead();

    state = AsyncValue.data(
      state.value
              ?.map((notification) => notification.copyWith(isRead: true))
              .toList() ??
          [],
    );
  }

  /// 알림 삭제
  Future<void> deleteNotification(int notificationId) async {
    await _notificationService.deleteNotification(notificationId);

    state = AsyncValue.data(
      state.value
              ?.where((notification) => notification.id != notificationId)
              .toList() ??
          [],
    );
  }

  /// 알림 목록 새로고침
  Future<void> refreshNotifications() async {
    _pagingKey = 0;
    _hasMore = true;

    state = const AsyncValue.loading();

    try {
      final response = await _notificationService.getNotifications(
        limit: _limit,
        pagingKey: _pagingKey,
      );

      if (response != null) {
        _hasMore = response.notifications.length >= _limit;
        if (response.notifications.isNotEmpty) {
          _pagingKey = response.notifications.last.id;
        }
        state = AsyncValue.data(response.notifications);
      } else {
        state = const AsyncValue.data([]);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

@riverpod
class UnreadNotificationCount extends _$UnreadNotificationCount {
  @override
  int build() {
    final notifications = ref.watch(notificationsProvider);
    return notifications.when(
      data: (list) => list.where((notification) => !notification.isRead).length,
      loading: () => 0,
      error: (_, __) => 0,
    );
  }
}
