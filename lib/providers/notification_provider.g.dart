// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationsHash() => r'fbf4038a7fd66e54a2db7858ecc053958c71432c';

/// See also [Notifications].
@ProviderFor(Notifications)
final notificationsProvider = AutoDisposeAsyncNotifierProvider<Notifications,
    List<NotificationDTO>>.internal(
  Notifications.new,
  name: r'notificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Notifications = AutoDisposeAsyncNotifier<List<NotificationDTO>>;
String _$unreadNotificationCountHash() =>
    r'05c43e0b8f2b877ebf351be60e99dd4c91620283';

/// See also [UnreadNotificationCount].
@ProviderFor(UnreadNotificationCount)
final unreadNotificationCountProvider =
    AutoDisposeNotifierProvider<UnreadNotificationCount, int>.internal(
  UnreadNotificationCount.new,
  name: r'unreadNotificationCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$unreadNotificationCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UnreadNotificationCount = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
