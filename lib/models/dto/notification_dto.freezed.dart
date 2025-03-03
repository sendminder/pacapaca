// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestListNotifications _$RequestListNotificationsFromJson(
    Map<String, dynamic> json) {
  return _RequestListNotifications.fromJson(json);
}

/// @nodoc
mixin _$RequestListNotifications {
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'paging_key')
  int? get pagingKey => throw _privateConstructorUsedError;

  /// Serializes this RequestListNotifications to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestListNotifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestListNotificationsCopyWith<RequestListNotifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestListNotificationsCopyWith<$Res> {
  factory $RequestListNotificationsCopyWith(RequestListNotifications value,
          $Res Function(RequestListNotifications) then) =
      _$RequestListNotificationsCopyWithImpl<$Res, RequestListNotifications>;
  @useResult
  $Res call({int limit, @JsonKey(name: 'paging_key') int? pagingKey});
}

/// @nodoc
class _$RequestListNotificationsCopyWithImpl<$Res,
        $Val extends RequestListNotifications>
    implements $RequestListNotificationsCopyWith<$Res> {
  _$RequestListNotificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestListNotifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? pagingKey = freezed,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestListNotificationsImplCopyWith<$Res>
    implements $RequestListNotificationsCopyWith<$Res> {
  factory _$$RequestListNotificationsImplCopyWith(
          _$RequestListNotificationsImpl value,
          $Res Function(_$RequestListNotificationsImpl) then) =
      __$$RequestListNotificationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, @JsonKey(name: 'paging_key') int? pagingKey});
}

/// @nodoc
class __$$RequestListNotificationsImplCopyWithImpl<$Res>
    extends _$RequestListNotificationsCopyWithImpl<$Res,
        _$RequestListNotificationsImpl>
    implements _$$RequestListNotificationsImplCopyWith<$Res> {
  __$$RequestListNotificationsImplCopyWithImpl(
      _$RequestListNotificationsImpl _value,
      $Res Function(_$RequestListNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestListNotifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? pagingKey = freezed,
  }) {
    return _then(_$RequestListNotificationsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestListNotificationsImpl implements _RequestListNotifications {
  const _$RequestListNotificationsImpl(
      {required this.limit, @JsonKey(name: 'paging_key') this.pagingKey});

  factory _$RequestListNotificationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestListNotificationsImplFromJson(json);

  @override
  final int limit;
  @override
  @JsonKey(name: 'paging_key')
  final int? pagingKey;

  @override
  String toString() {
    return 'RequestListNotifications(limit: $limit, pagingKey: $pagingKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestListNotificationsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.pagingKey, pagingKey) ||
                other.pagingKey == pagingKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, pagingKey);

  /// Create a copy of RequestListNotifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestListNotificationsImplCopyWith<_$RequestListNotificationsImpl>
      get copyWith => __$$RequestListNotificationsImplCopyWithImpl<
          _$RequestListNotificationsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestListNotificationsImplToJson(
      this,
    );
  }
}

abstract class _RequestListNotifications implements RequestListNotifications {
  const factory _RequestListNotifications(
          {required final int limit,
          @JsonKey(name: 'paging_key') final int? pagingKey}) =
      _$RequestListNotificationsImpl;

  factory _RequestListNotifications.fromJson(Map<String, dynamic> json) =
      _$RequestListNotificationsImpl.fromJson;

  @override
  int get limit;
  @override
  @JsonKey(name: 'paging_key')
  int? get pagingKey;

  /// Create a copy of RequestListNotifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestListNotificationsImplCopyWith<_$RequestListNotificationsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NotificationDTO _$NotificationDTOFromJson(Map<String, dynamic> json) {
  return _NotificationDTO.fromJson(json);
}

/// @nodoc
mixin _$NotificationDTO {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'ref_id')
  int get refId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String get createTime => throw _privateConstructorUsedError;

  /// Serializes this NotificationDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationDTOCopyWith<NotificationDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDTOCopyWith<$Res> {
  factory $NotificationDTOCopyWith(
          NotificationDTO value, $Res Function(NotificationDTO) then) =
      _$NotificationDTOCopyWithImpl<$Res, NotificationDTO>;
  @useResult
  $Res call(
      {int id,
      String title,
      String body,
      String type,
      @JsonKey(name: 'ref_id') int refId,
      @JsonKey(name: 'is_read') bool isRead,
      @JsonKey(name: 'create_time') String createTime});
}

/// @nodoc
class _$NotificationDTOCopyWithImpl<$Res, $Val extends NotificationDTO>
    implements $NotificationDTOCopyWith<$Res> {
  _$NotificationDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? type = null,
    Object? refId = null,
    Object? isRead = null,
    Object? createTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      refId: null == refId
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as int,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationDTOImplCopyWith<$Res>
    implements $NotificationDTOCopyWith<$Res> {
  factory _$$NotificationDTOImplCopyWith(_$NotificationDTOImpl value,
          $Res Function(_$NotificationDTOImpl) then) =
      __$$NotificationDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String body,
      String type,
      @JsonKey(name: 'ref_id') int refId,
      @JsonKey(name: 'is_read') bool isRead,
      @JsonKey(name: 'create_time') String createTime});
}

/// @nodoc
class __$$NotificationDTOImplCopyWithImpl<$Res>
    extends _$NotificationDTOCopyWithImpl<$Res, _$NotificationDTOImpl>
    implements _$$NotificationDTOImplCopyWith<$Res> {
  __$$NotificationDTOImplCopyWithImpl(
      _$NotificationDTOImpl _value, $Res Function(_$NotificationDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? type = null,
    Object? refId = null,
    Object? isRead = null,
    Object? createTime = null,
  }) {
    return _then(_$NotificationDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      refId: null == refId
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as int,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDTOImpl implements _NotificationDTO {
  const _$NotificationDTOImpl(
      {required this.id,
      required this.title,
      required this.body,
      required this.type,
      @JsonKey(name: 'ref_id') required this.refId,
      @JsonKey(name: 'is_read') required this.isRead,
      @JsonKey(name: 'create_time') required this.createTime});

  factory _$NotificationDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String body;
  @override
  final String type;
  @override
  @JsonKey(name: 'ref_id')
  final int refId;
  @override
  @JsonKey(name: 'is_read')
  final bool isRead;
  @override
  @JsonKey(name: 'create_time')
  final String createTime;

  @override
  String toString() {
    return 'NotificationDTO(id: $id, title: $title, body: $body, type: $type, refId: $refId, isRead: $isRead, createTime: $createTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.refId, refId) || other.refId == refId) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, body, type, refId, isRead, createTime);

  /// Create a copy of NotificationDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDTOImplCopyWith<_$NotificationDTOImpl> get copyWith =>
      __$$NotificationDTOImplCopyWithImpl<_$NotificationDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDTOImplToJson(
      this,
    );
  }
}

abstract class _NotificationDTO implements NotificationDTO {
  const factory _NotificationDTO(
          {required final int id,
          required final String title,
          required final String body,
          required final String type,
          @JsonKey(name: 'ref_id') required final int refId,
          @JsonKey(name: 'is_read') required final bool isRead,
          @JsonKey(name: 'create_time') required final String createTime}) =
      _$NotificationDTOImpl;

  factory _NotificationDTO.fromJson(Map<String, dynamic> json) =
      _$NotificationDTOImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get body;
  @override
  String get type;
  @override
  @JsonKey(name: 'ref_id')
  int get refId;
  @override
  @JsonKey(name: 'is_read')
  bool get isRead;
  @override
  @JsonKey(name: 'create_time')
  String get createTime;

  /// Create a copy of NotificationDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationDTOImplCopyWith<_$NotificationDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseNotification _$ResponseNotificationFromJson(Map<String, dynamic> json) {
  return _ResponseNotification.fromJson(json);
}

/// @nodoc
mixin _$ResponseNotification {
  NotificationDTO get notification => throw _privateConstructorUsedError;

  /// Serializes this ResponseNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseNotificationCopyWith<ResponseNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseNotificationCopyWith<$Res> {
  factory $ResponseNotificationCopyWith(ResponseNotification value,
          $Res Function(ResponseNotification) then) =
      _$ResponseNotificationCopyWithImpl<$Res, ResponseNotification>;
  @useResult
  $Res call({NotificationDTO notification});

  $NotificationDTOCopyWith<$Res> get notification;
}

/// @nodoc
class _$ResponseNotificationCopyWithImpl<$Res,
        $Val extends ResponseNotification>
    implements $ResponseNotificationCopyWith<$Res> {
  _$ResponseNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
  }) {
    return _then(_value.copyWith(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationDTO,
    ) as $Val);
  }

  /// Create a copy of ResponseNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationDTOCopyWith<$Res> get notification {
    return $NotificationDTOCopyWith<$Res>(_value.notification, (value) {
      return _then(_value.copyWith(notification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseNotificationImplCopyWith<$Res>
    implements $ResponseNotificationCopyWith<$Res> {
  factory _$$ResponseNotificationImplCopyWith(_$ResponseNotificationImpl value,
          $Res Function(_$ResponseNotificationImpl) then) =
      __$$ResponseNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotificationDTO notification});

  @override
  $NotificationDTOCopyWith<$Res> get notification;
}

/// @nodoc
class __$$ResponseNotificationImplCopyWithImpl<$Res>
    extends _$ResponseNotificationCopyWithImpl<$Res, _$ResponseNotificationImpl>
    implements _$$ResponseNotificationImplCopyWith<$Res> {
  __$$ResponseNotificationImplCopyWithImpl(_$ResponseNotificationImpl _value,
      $Res Function(_$ResponseNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
  }) {
    return _then(_$ResponseNotificationImpl(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseNotificationImpl implements _ResponseNotification {
  const _$ResponseNotificationImpl({required this.notification});

  factory _$ResponseNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseNotificationImplFromJson(json);

  @override
  final NotificationDTO notification;

  @override
  String toString() {
    return 'ResponseNotification(notification: $notification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseNotificationImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notification);

  /// Create a copy of ResponseNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseNotificationImplCopyWith<_$ResponseNotificationImpl>
      get copyWith =>
          __$$ResponseNotificationImplCopyWithImpl<_$ResponseNotificationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseNotificationImplToJson(
      this,
    );
  }
}

abstract class _ResponseNotification implements ResponseNotification {
  const factory _ResponseNotification(
          {required final NotificationDTO notification}) =
      _$ResponseNotificationImpl;

  factory _ResponseNotification.fromJson(Map<String, dynamic> json) =
      _$ResponseNotificationImpl.fromJson;

  @override
  NotificationDTO get notification;

  /// Create a copy of ResponseNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseNotificationImplCopyWith<_$ResponseNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseNotificationList _$ResponseNotificationListFromJson(
    Map<String, dynamic> json) {
  return _ResponseNotificationList.fromJson(json);
}

/// @nodoc
mixin _$ResponseNotificationList {
  List<NotificationDTO>? get notifications =>
      throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  /// Serializes this ResponseNotificationList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseNotificationList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseNotificationListCopyWith<ResponseNotificationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseNotificationListCopyWith<$Res> {
  factory $ResponseNotificationListCopyWith(ResponseNotificationList value,
          $Res Function(ResponseNotificationList) then) =
      _$ResponseNotificationListCopyWithImpl<$Res, ResponseNotificationList>;
  @useResult
  $Res call({List<NotificationDTO>? notifications, int? total});
}

/// @nodoc
class _$ResponseNotificationListCopyWithImpl<$Res,
        $Val extends ResponseNotificationList>
    implements $ResponseNotificationListCopyWith<$Res> {
  _$ResponseNotificationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseNotificationList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDTO>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseNotificationListImplCopyWith<$Res>
    implements $ResponseNotificationListCopyWith<$Res> {
  factory _$$ResponseNotificationListImplCopyWith(
          _$ResponseNotificationListImpl value,
          $Res Function(_$ResponseNotificationListImpl) then) =
      __$$ResponseNotificationListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NotificationDTO>? notifications, int? total});
}

/// @nodoc
class __$$ResponseNotificationListImplCopyWithImpl<$Res>
    extends _$ResponseNotificationListCopyWithImpl<$Res,
        _$ResponseNotificationListImpl>
    implements _$$ResponseNotificationListImplCopyWith<$Res> {
  __$$ResponseNotificationListImplCopyWithImpl(
      _$ResponseNotificationListImpl _value,
      $Res Function(_$ResponseNotificationListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseNotificationList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = freezed,
    Object? total = freezed,
  }) {
    return _then(_$ResponseNotificationListImpl(
      notifications: freezed == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDTO>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseNotificationListImpl implements _ResponseNotificationList {
  const _$ResponseNotificationListImpl(
      {final List<NotificationDTO>? notifications, this.total})
      : _notifications = notifications;

  factory _$ResponseNotificationListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseNotificationListImplFromJson(json);

  final List<NotificationDTO>? _notifications;
  @override
  List<NotificationDTO>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? total;

  @override
  String toString() {
    return 'ResponseNotificationList(notifications: $notifications, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseNotificationListImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications), total);

  /// Create a copy of ResponseNotificationList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseNotificationListImplCopyWith<_$ResponseNotificationListImpl>
      get copyWith => __$$ResponseNotificationListImplCopyWithImpl<
          _$ResponseNotificationListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseNotificationListImplToJson(
      this,
    );
  }
}

abstract class _ResponseNotificationList implements ResponseNotificationList {
  const factory _ResponseNotificationList(
      {final List<NotificationDTO>? notifications,
      final int? total}) = _$ResponseNotificationListImpl;

  factory _ResponseNotificationList.fromJson(Map<String, dynamic> json) =
      _$ResponseNotificationListImpl.fromJson;

  @override
  List<NotificationDTO>? get notifications;
  @override
  int? get total;

  /// Create a copy of ResponseNotificationList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseNotificationListImplCopyWith<_$ResponseNotificationListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestRegisterFCMToken _$RequestRegisterFCMTokenFromJson(
    Map<String, dynamic> json) {
  return _RequestRegisterFCMToken.fromJson(json);
}

/// @nodoc
mixin _$RequestRegisterFCMToken {
  @JsonKey(name: 'fcm_token')
  String get fcmToken => throw _privateConstructorUsedError;

  /// Serializes this RequestRegisterFCMToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestRegisterFCMToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestRegisterFCMTokenCopyWith<RequestRegisterFCMToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestRegisterFCMTokenCopyWith<$Res> {
  factory $RequestRegisterFCMTokenCopyWith(RequestRegisterFCMToken value,
          $Res Function(RequestRegisterFCMToken) then) =
      _$RequestRegisterFCMTokenCopyWithImpl<$Res, RequestRegisterFCMToken>;
  @useResult
  $Res call({@JsonKey(name: 'fcm_token') String fcmToken});
}

/// @nodoc
class _$RequestRegisterFCMTokenCopyWithImpl<$Res,
        $Val extends RequestRegisterFCMToken>
    implements $RequestRegisterFCMTokenCopyWith<$Res> {
  _$RequestRegisterFCMTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestRegisterFCMToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
  }) {
    return _then(_value.copyWith(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestRegisterFCMTokenImplCopyWith<$Res>
    implements $RequestRegisterFCMTokenCopyWith<$Res> {
  factory _$$RequestRegisterFCMTokenImplCopyWith(
          _$RequestRegisterFCMTokenImpl value,
          $Res Function(_$RequestRegisterFCMTokenImpl) then) =
      __$$RequestRegisterFCMTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'fcm_token') String fcmToken});
}

/// @nodoc
class __$$RequestRegisterFCMTokenImplCopyWithImpl<$Res>
    extends _$RequestRegisterFCMTokenCopyWithImpl<$Res,
        _$RequestRegisterFCMTokenImpl>
    implements _$$RequestRegisterFCMTokenImplCopyWith<$Res> {
  __$$RequestRegisterFCMTokenImplCopyWithImpl(
      _$RequestRegisterFCMTokenImpl _value,
      $Res Function(_$RequestRegisterFCMTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestRegisterFCMToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
  }) {
    return _then(_$RequestRegisterFCMTokenImpl(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestRegisterFCMTokenImpl implements _RequestRegisterFCMToken {
  const _$RequestRegisterFCMTokenImpl(
      {@JsonKey(name: 'fcm_token') required this.fcmToken});

  factory _$RequestRegisterFCMTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestRegisterFCMTokenImplFromJson(json);

  @override
  @JsonKey(name: 'fcm_token')
  final String fcmToken;

  @override
  String toString() {
    return 'RequestRegisterFCMToken(fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestRegisterFCMTokenImpl &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken);

  /// Create a copy of RequestRegisterFCMToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestRegisterFCMTokenImplCopyWith<_$RequestRegisterFCMTokenImpl>
      get copyWith => __$$RequestRegisterFCMTokenImplCopyWithImpl<
          _$RequestRegisterFCMTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestRegisterFCMTokenImplToJson(
      this,
    );
  }
}

abstract class _RequestRegisterFCMToken implements RequestRegisterFCMToken {
  const factory _RequestRegisterFCMToken(
          {@JsonKey(name: 'fcm_token') required final String fcmToken}) =
      _$RequestRegisterFCMTokenImpl;

  factory _RequestRegisterFCMToken.fromJson(Map<String, dynamic> json) =
      _$RequestRegisterFCMTokenImpl.fromJson;

  @override
  @JsonKey(name: 'fcm_token')
  String get fcmToken;

  /// Create a copy of RequestRegisterFCMToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestRegisterFCMTokenImplCopyWith<_$RequestRegisterFCMTokenImpl>
      get copyWith => throw _privateConstructorUsedError;
}
