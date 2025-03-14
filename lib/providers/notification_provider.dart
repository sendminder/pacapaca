import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/notification_dto.dart';
import 'package:pacapaca/services/notification_service.dart';

part 'notification_provider.g.dart';

@riverpod
class Notifications extends _$Notifications {
  final _notificationService = GetIt.instance<NotificationService>();
  int? _lastPagingKey;
  static const int _limit = 20;

  @override
  Future<List<NotificationDTO>> build() async {
    _lastPagingKey = null;
    // 초기 알림 목록 로드
    final response = await _notificationService.getNotifications(
      limit: _limit,
    );

    return response?.notifications ?? [];
  }

  /// 알림 더 불러오기
  Future<void> loadMore() async {
    try {
      if (state.value == null || state.value!.isEmpty) {
        return;
      }

      final lastNotification = state.value!.last;
      // 이전과 같은 페이징 키면 요청하지 않음
      if (lastNotification.id == _lastPagingKey) return;
      _lastPagingKey = lastNotification.id;

      final response = await _notificationService.getNotifications(
        limit: _limit,
        pagingKey: lastNotification.id,
      );

      if (response != null) {
        final newNotifications = response.notifications;
        if (newNotifications == null || newNotifications.isEmpty) return;

        state = AsyncValue.data([...state.value!, ...newNotifications]);
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
    _lastPagingKey = null;

    state = const AsyncValue.loading();

    try {
      final response = await _notificationService.getNotifications(
        limit: _limit,
      );

      if (response != null) {
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
  final _notificationService = GetIt.instance<NotificationService>();
  static const int _limit = 20;

  @override
  int build() {
    // 알림 목록 상태 감시
    ref.watch(notificationsProvider);
    return _getUnreadCount();
  }

  /// 읽지 않은 알림 개수 가져오기
  int _getUnreadCount() {
    final notifications = ref.read(notificationsProvider).valueOrNull;
    if (notifications == null) return 0;

    return notifications.where((notification) => !notification.isRead).length;
  }

  /// 읽지 않은 알림 개수 새로고침
  Future<void> refreshUnreadCount() async {
    try {
      final response = await _notificationService.getNotifications(
        limit: _limit + 1,
      );
      final count = response?.notifications
              ?.where((notification) => !notification.isRead)
              .length ??
          0;

      state = count;
    } catch (e) {
      // 오류 발생 시 현재 상태 유지
    }
  }

  Future<void> addNotificationCount() async {
    state = state + 1;
  }

  Future<void> set(int count) async {
    state = count;
  }
}
