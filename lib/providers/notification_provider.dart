import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/notification_dto.dart';
import 'package:pacapaca/services/notification_service.dart';

part 'notification_provider.g.dart';

@Riverpod(keepAlive: true)
Notifications notifications(NotificationsRef ref) => Notifications();

@riverpod
class Notifications extends _$Notifications {
  final _notificationService = GetIt.instance<NotificationService>();
  int _pagingKey = 0;
  static const int _limit = 20;

  @override
  Future<List<NotificationDTO>> build() async {
    if (state.value != null && state.value!.isNotEmpty) {
      return state.value!;
    }
    // 초기 알림 목록 로드
    final response = await _notificationService.getNotifications(
      limit: _limit,
      pagingKey: _pagingKey,
    );

    if (response != null) {
      if (response.notifications != null &&
          response.notifications!.isNotEmpty) {
        _pagingKey = response.notifications!.last.id;
      }
      return response.notifications ?? [];
    }

    return [];
  }

  /// 알림 더 불러오기
  Future<void> loadMore() async {
    try {
      final response = await _notificationService.getNotifications(
        limit: _limit,
        pagingKey: _pagingKey,
      );

      if (response != null) {
        final newNotifications = response.notifications;

        if (newNotifications != null && newNotifications.isNotEmpty) {
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

    state = const AsyncValue.loading();

    try {
      final response = await _notificationService.getNotifications(
        limit: _limit,
        pagingKey: _pagingKey,
      );

      if (response != null) {
        if (response.notifications != null &&
            response.notifications!.isNotEmpty) {
          _pagingKey = response.notifications!.last.id;
        }
        state = AsyncValue.data(response.notifications ?? []);
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
    return 0;
  }
}
