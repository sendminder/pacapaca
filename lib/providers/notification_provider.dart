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
    if (state.value != null && state.value!.isNotEmpty) {
      return state.value!;
    }
    _lastPagingKey = null;
    // 초기 알림 목록 로드
    final response = await _notificationService.getNotifications(
      limit: _limit,
    );

    if (response != null) {
      return response.notifications ?? [];
    }

    return [];
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

      final response = await _notificationService.getNotifications(
        limit: _limit,
        pagingKey: lastNotification.id,
      );
      _lastPagingKey = lastNotification.id;

      if (response != null) {
        final newNotifications = response.notifications;

        if (newNotifications != null && newNotifications.isNotEmpty) {
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
  @override
  int build() {
    return 0;
  }
}
