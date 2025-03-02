// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DisplayUserDTO _$DisplayUserDTOFromJson(Map<String, dynamic> json) {
  return _DisplayUserDTO.fromJson(json);
}

/// @nodoc
mixin _$DisplayUserDTO {
  int get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_blocked')
  bool get isBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_official')
  bool get isOfficial => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_type')
  String? get profileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_url')
  String? get profileImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'badge_type')
  String? get badgeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'badge_image_url')
  String? get badgeImageUrl => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  int? get carrots => throw _privateConstructorUsedError;

  /// Serializes this DisplayUserDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DisplayUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisplayUserDTOCopyWith<DisplayUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayUserDTOCopyWith<$Res> {
  factory $DisplayUserDTOCopyWith(
          DisplayUserDTO value, $Res Function(DisplayUserDTO) then) =
      _$DisplayUserDTOCopyWithImpl<$Res, DisplayUserDTO>;
  @useResult
  $Res call(
      {int id,
      String nickname,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_blocked') bool isBlocked,
      @JsonKey(name: 'is_official') bool isOfficial,
      @JsonKey(name: 'profile_type') String? profileType,
      @JsonKey(name: 'profile_image_url') String? profileImageUrl,
      @JsonKey(name: 'badge_type') String? badgeType,
      @JsonKey(name: 'badge_image_url') String? badgeImageUrl,
      int? points,
      int? carrots});
}

/// @nodoc
class _$DisplayUserDTOCopyWithImpl<$Res, $Val extends DisplayUserDTO>
    implements $DisplayUserDTOCopyWith<$Res> {
  _$DisplayUserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisplayUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? isActive = null,
    Object? isBlocked = null,
    Object? isOfficial = null,
    Object? profileType = freezed,
    Object? profileImageUrl = freezed,
    Object? badgeType = freezed,
    Object? badgeImageUrl = freezed,
    Object? points = freezed,
    Object? carrots = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isOfficial: null == isOfficial
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
      profileType: freezed == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeType: freezed == badgeType
          ? _value.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeImageUrl: freezed == badgeImageUrl
          ? _value.badgeImageUrl
          : badgeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      carrots: freezed == carrots
          ? _value.carrots
          : carrots // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisplayUserDTOImplCopyWith<$Res>
    implements $DisplayUserDTOCopyWith<$Res> {
  factory _$$DisplayUserDTOImplCopyWith(_$DisplayUserDTOImpl value,
          $Res Function(_$DisplayUserDTOImpl) then) =
      __$$DisplayUserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nickname,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_blocked') bool isBlocked,
      @JsonKey(name: 'is_official') bool isOfficial,
      @JsonKey(name: 'profile_type') String? profileType,
      @JsonKey(name: 'profile_image_url') String? profileImageUrl,
      @JsonKey(name: 'badge_type') String? badgeType,
      @JsonKey(name: 'badge_image_url') String? badgeImageUrl,
      int? points,
      int? carrots});
}

/// @nodoc
class __$$DisplayUserDTOImplCopyWithImpl<$Res>
    extends _$DisplayUserDTOCopyWithImpl<$Res, _$DisplayUserDTOImpl>
    implements _$$DisplayUserDTOImplCopyWith<$Res> {
  __$$DisplayUserDTOImplCopyWithImpl(
      _$DisplayUserDTOImpl _value, $Res Function(_$DisplayUserDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisplayUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? isActive = null,
    Object? isBlocked = null,
    Object? isOfficial = null,
    Object? profileType = freezed,
    Object? profileImageUrl = freezed,
    Object? badgeType = freezed,
    Object? badgeImageUrl = freezed,
    Object? points = freezed,
    Object? carrots = freezed,
  }) {
    return _then(_$DisplayUserDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isOfficial: null == isOfficial
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
      profileType: freezed == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeType: freezed == badgeType
          ? _value.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeImageUrl: freezed == badgeImageUrl
          ? _value.badgeImageUrl
          : badgeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      carrots: freezed == carrots
          ? _value.carrots
          : carrots // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplayUserDTOImpl implements _DisplayUserDTO {
  const _$DisplayUserDTOImpl(
      {required this.id,
      required this.nickname,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'is_blocked') required this.isBlocked,
      @JsonKey(name: 'is_official') required this.isOfficial,
      @JsonKey(name: 'profile_type') this.profileType,
      @JsonKey(name: 'profile_image_url') this.profileImageUrl,
      @JsonKey(name: 'badge_type') this.badgeType,
      @JsonKey(name: 'badge_image_url') this.badgeImageUrl,
      this.points,
      this.carrots});

  factory _$DisplayUserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplayUserDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String nickname;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_blocked')
  final bool isBlocked;
  @override
  @JsonKey(name: 'is_official')
  final bool isOfficial;
  @override
  @JsonKey(name: 'profile_type')
  final String? profileType;
  @override
  @JsonKey(name: 'profile_image_url')
  final String? profileImageUrl;
  @override
  @JsonKey(name: 'badge_type')
  final String? badgeType;
  @override
  @JsonKey(name: 'badge_image_url')
  final String? badgeImageUrl;
  @override
  final int? points;
  @override
  final int? carrots;

  @override
  String toString() {
    return 'DisplayUserDTO(id: $id, nickname: $nickname, isActive: $isActive, isBlocked: $isBlocked, isOfficial: $isOfficial, profileType: $profileType, profileImageUrl: $profileImageUrl, badgeType: $badgeType, badgeImageUrl: $badgeImageUrl, points: $points, carrots: $carrots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayUserDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.isOfficial, isOfficial) ||
                other.isOfficial == isOfficial) &&
            (identical(other.profileType, profileType) ||
                other.profileType == profileType) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType) &&
            (identical(other.badgeImageUrl, badgeImageUrl) ||
                other.badgeImageUrl == badgeImageUrl) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.carrots, carrots) || other.carrots == carrots));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nickname,
      isActive,
      isBlocked,
      isOfficial,
      profileType,
      profileImageUrl,
      badgeType,
      badgeImageUrl,
      points,
      carrots);

  /// Create a copy of DisplayUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayUserDTOImplCopyWith<_$DisplayUserDTOImpl> get copyWith =>
      __$$DisplayUserDTOImplCopyWithImpl<_$DisplayUserDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplayUserDTOImplToJson(
      this,
    );
  }
}

abstract class _DisplayUserDTO implements DisplayUserDTO {
  const factory _DisplayUserDTO(
      {required final int id,
      required final String nickname,
      @JsonKey(name: 'is_active') required final bool isActive,
      @JsonKey(name: 'is_blocked') required final bool isBlocked,
      @JsonKey(name: 'is_official') required final bool isOfficial,
      @JsonKey(name: 'profile_type') final String? profileType,
      @JsonKey(name: 'profile_image_url') final String? profileImageUrl,
      @JsonKey(name: 'badge_type') final String? badgeType,
      @JsonKey(name: 'badge_image_url') final String? badgeImageUrl,
      final int? points,
      final int? carrots}) = _$DisplayUserDTOImpl;

  factory _DisplayUserDTO.fromJson(Map<String, dynamic> json) =
      _$DisplayUserDTOImpl.fromJson;

  @override
  int get id;
  @override
  String get nickname;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_blocked')
  bool get isBlocked;
  @override
  @JsonKey(name: 'is_official')
  bool get isOfficial;
  @override
  @JsonKey(name: 'profile_type')
  String? get profileType;
  @override
  @JsonKey(name: 'profile_image_url')
  String? get profileImageUrl;
  @override
  @JsonKey(name: 'badge_type')
  String? get badgeType;
  @override
  @JsonKey(name: 'badge_image_url')
  String? get badgeImageUrl;
  @override
  int? get points;
  @override
  int? get carrots;

  /// Create a copy of DisplayUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplayUserDTOImplCopyWith<_$DisplayUserDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return _UserDTO.fromJson(json);
}

/// @nodoc
mixin _$UserDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String? get createTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_time')
  String? get updateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login_time')
  String? get lastLoginTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'block_time')
  String? get blockTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'delete_time')
  String? get deleteTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_user')
  DisplayUserDTO get displayUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'notification_setup_completed')
  bool get notificationSetupCompleted => throw _privateConstructorUsedError;

  /// Serializes this UserDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDTOCopyWith<UserDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDTOCopyWith<$Res> {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) then) =
      _$UserDTOCopyWithImpl<$Res, UserDTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'create_time') String? createTime,
      @JsonKey(name: 'update_time') String? updateTime,
      @JsonKey(name: 'last_login_time') String? lastLoginTime,
      @JsonKey(name: 'block_time') String? blockTime,
      @JsonKey(name: 'delete_time') String? deleteTime,
      @JsonKey(name: 'display_user') DisplayUserDTO displayUser,
      @JsonKey(name: 'notification_setup_completed')
      bool notificationSetupCompleted});

  $DisplayUserDTOCopyWith<$Res> get displayUser;
}

/// @nodoc
class _$UserDTOCopyWithImpl<$Res, $Val extends UserDTO>
    implements $UserDTOCopyWith<$Res> {
  _$UserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createTime = freezed,
    Object? updateTime = freezed,
    Object? lastLoginTime = freezed,
    Object? blockTime = freezed,
    Object? deleteTime = freezed,
    Object? displayUser = null,
    Object? notificationSetupCompleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTime: freezed == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginTime: freezed == lastLoginTime
          ? _value.lastLoginTime
          : lastLoginTime // ignore: cast_nullable_to_non_nullable
              as String?,
      blockTime: freezed == blockTime
          ? _value.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteTime: freezed == deleteTime
          ? _value.deleteTime
          : deleteTime // ignore: cast_nullable_to_non_nullable
              as String?,
      displayUser: null == displayUser
          ? _value.displayUser
          : displayUser // ignore: cast_nullable_to_non_nullable
              as DisplayUserDTO,
      notificationSetupCompleted: null == notificationSetupCompleted
          ? _value.notificationSetupCompleted
          : notificationSetupCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisplayUserDTOCopyWith<$Res> get displayUser {
    return $DisplayUserDTOCopyWith<$Res>(_value.displayUser, (value) {
      return _then(_value.copyWith(displayUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDTOImplCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory _$$UserDTOImplCopyWith(
          _$UserDTOImpl value, $Res Function(_$UserDTOImpl) then) =
      __$$UserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'create_time') String? createTime,
      @JsonKey(name: 'update_time') String? updateTime,
      @JsonKey(name: 'last_login_time') String? lastLoginTime,
      @JsonKey(name: 'block_time') String? blockTime,
      @JsonKey(name: 'delete_time') String? deleteTime,
      @JsonKey(name: 'display_user') DisplayUserDTO displayUser,
      @JsonKey(name: 'notification_setup_completed')
      bool notificationSetupCompleted});

  @override
  $DisplayUserDTOCopyWith<$Res> get displayUser;
}

/// @nodoc
class __$$UserDTOImplCopyWithImpl<$Res>
    extends _$UserDTOCopyWithImpl<$Res, _$UserDTOImpl>
    implements _$$UserDTOImplCopyWith<$Res> {
  __$$UserDTOImplCopyWithImpl(
      _$UserDTOImpl _value, $Res Function(_$UserDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createTime = freezed,
    Object? updateTime = freezed,
    Object? lastLoginTime = freezed,
    Object? blockTime = freezed,
    Object? deleteTime = freezed,
    Object? displayUser = null,
    Object? notificationSetupCompleted = null,
  }) {
    return _then(_$UserDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTime: freezed == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLoginTime: freezed == lastLoginTime
          ? _value.lastLoginTime
          : lastLoginTime // ignore: cast_nullable_to_non_nullable
              as String?,
      blockTime: freezed == blockTime
          ? _value.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteTime: freezed == deleteTime
          ? _value.deleteTime
          : deleteTime // ignore: cast_nullable_to_non_nullable
              as String?,
      displayUser: null == displayUser
          ? _value.displayUser
          : displayUser // ignore: cast_nullable_to_non_nullable
              as DisplayUserDTO,
      notificationSetupCompleted: null == notificationSetupCompleted
          ? _value.notificationSetupCompleted
          : notificationSetupCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDTOImpl implements _UserDTO {
  const _$UserDTOImpl(
      {required this.id,
      @JsonKey(name: 'create_time') this.createTime,
      @JsonKey(name: 'update_time') this.updateTime,
      @JsonKey(name: 'last_login_time') this.lastLoginTime,
      @JsonKey(name: 'block_time') this.blockTime,
      @JsonKey(name: 'delete_time') this.deleteTime,
      @JsonKey(name: 'display_user') required this.displayUser,
      @JsonKey(name: 'notification_setup_completed')
      this.notificationSetupCompleted = false});

  factory _$UserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'create_time')
  final String? createTime;
  @override
  @JsonKey(name: 'update_time')
  final String? updateTime;
  @override
  @JsonKey(name: 'last_login_time')
  final String? lastLoginTime;
  @override
  @JsonKey(name: 'block_time')
  final String? blockTime;
  @override
  @JsonKey(name: 'delete_time')
  final String? deleteTime;
  @override
  @JsonKey(name: 'display_user')
  final DisplayUserDTO displayUser;
  @override
  @JsonKey(name: 'notification_setup_completed')
  final bool notificationSetupCompleted;

  @override
  String toString() {
    return 'UserDTO(id: $id, createTime: $createTime, updateTime: $updateTime, lastLoginTime: $lastLoginTime, blockTime: $blockTime, deleteTime: $deleteTime, displayUser: $displayUser, notificationSetupCompleted: $notificationSetupCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.lastLoginTime, lastLoginTime) ||
                other.lastLoginTime == lastLoginTime) &&
            (identical(other.blockTime, blockTime) ||
                other.blockTime == blockTime) &&
            (identical(other.deleteTime, deleteTime) ||
                other.deleteTime == deleteTime) &&
            (identical(other.displayUser, displayUser) ||
                other.displayUser == displayUser) &&
            (identical(other.notificationSetupCompleted,
                    notificationSetupCompleted) ||
                other.notificationSetupCompleted ==
                    notificationSetupCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createTime,
      updateTime,
      lastLoginTime,
      blockTime,
      deleteTime,
      displayUser,
      notificationSetupCompleted);

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDTOImplCopyWith<_$UserDTOImpl> get copyWith =>
      __$$UserDTOImplCopyWithImpl<_$UserDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDTOImplToJson(
      this,
    );
  }
}

abstract class _UserDTO implements UserDTO {
  const factory _UserDTO(
      {required final int id,
      @JsonKey(name: 'create_time') final String? createTime,
      @JsonKey(name: 'update_time') final String? updateTime,
      @JsonKey(name: 'last_login_time') final String? lastLoginTime,
      @JsonKey(name: 'block_time') final String? blockTime,
      @JsonKey(name: 'delete_time') final String? deleteTime,
      @JsonKey(name: 'display_user') required final DisplayUserDTO displayUser,
      @JsonKey(name: 'notification_setup_completed')
      final bool notificationSetupCompleted}) = _$UserDTOImpl;

  factory _UserDTO.fromJson(Map<String, dynamic> json) = _$UserDTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'create_time')
  String? get createTime;
  @override
  @JsonKey(name: 'update_time')
  String? get updateTime;
  @override
  @JsonKey(name: 'last_login_time')
  String? get lastLoginTime;
  @override
  @JsonKey(name: 'block_time')
  String? get blockTime;
  @override
  @JsonKey(name: 'delete_time')
  String? get deleteTime;
  @override
  @JsonKey(name: 'display_user')
  DisplayUserDTO get displayUser;
  @override
  @JsonKey(name: 'notification_setup_completed')
  bool get notificationSetupCompleted;

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDTOImplCopyWith<_$UserDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestGetUserByID _$RequestGetUserByIDFromJson(Map<String, dynamic> json) {
  return _RequestGetUserByID.fromJson(json);
}

/// @nodoc
mixin _$RequestGetUserByID {
  int get id => throw _privateConstructorUsedError;

  /// Serializes this RequestGetUserByID to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestGetUserByIDCopyWith<RequestGetUserByID> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestGetUserByIDCopyWith<$Res> {
  factory $RequestGetUserByIDCopyWith(
          RequestGetUserByID value, $Res Function(RequestGetUserByID) then) =
      _$RequestGetUserByIDCopyWithImpl<$Res, RequestGetUserByID>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$RequestGetUserByIDCopyWithImpl<$Res, $Val extends RequestGetUserByID>
    implements $RequestGetUserByIDCopyWith<$Res> {
  _$RequestGetUserByIDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestGetUserByIDImplCopyWith<$Res>
    implements $RequestGetUserByIDCopyWith<$Res> {
  factory _$$RequestGetUserByIDImplCopyWith(_$RequestGetUserByIDImpl value,
          $Res Function(_$RequestGetUserByIDImpl) then) =
      __$$RequestGetUserByIDImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$RequestGetUserByIDImplCopyWithImpl<$Res>
    extends _$RequestGetUserByIDCopyWithImpl<$Res, _$RequestGetUserByIDImpl>
    implements _$$RequestGetUserByIDImplCopyWith<$Res> {
  __$$RequestGetUserByIDImplCopyWithImpl(_$RequestGetUserByIDImpl _value,
      $Res Function(_$RequestGetUserByIDImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RequestGetUserByIDImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestGetUserByIDImpl implements _RequestGetUserByID {
  const _$RequestGetUserByIDImpl({required this.id});

  factory _$RequestGetUserByIDImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestGetUserByIDImplFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'RequestGetUserByID(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestGetUserByIDImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of RequestGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestGetUserByIDImplCopyWith<_$RequestGetUserByIDImpl> get copyWith =>
      __$$RequestGetUserByIDImplCopyWithImpl<_$RequestGetUserByIDImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestGetUserByIDImplToJson(
      this,
    );
  }
}

abstract class _RequestGetUserByID implements RequestGetUserByID {
  const factory _RequestGetUserByID({required final int id}) =
      _$RequestGetUserByIDImpl;

  factory _RequestGetUserByID.fromJson(Map<String, dynamic> json) =
      _$RequestGetUserByIDImpl.fromJson;

  @override
  int get id;

  /// Create a copy of RequestGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestGetUserByIDImplCopyWith<_$RequestGetUserByIDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseGetUserByID _$ResponseGetUserByIDFromJson(Map<String, dynamic> json) {
  return _ResponseGetUserByID.fromJson(json);
}

/// @nodoc
mixin _$ResponseGetUserByID {
  UserDTO? get user => throw _privateConstructorUsedError;

  /// Serializes this ResponseGetUserByID to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseGetUserByIDCopyWith<ResponseGetUserByID> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseGetUserByIDCopyWith<$Res> {
  factory $ResponseGetUserByIDCopyWith(
          ResponseGetUserByID value, $Res Function(ResponseGetUserByID) then) =
      _$ResponseGetUserByIDCopyWithImpl<$Res, ResponseGetUserByID>;
  @useResult
  $Res call({UserDTO? user});

  $UserDTOCopyWith<$Res>? get user;
}

/// @nodoc
class _$ResponseGetUserByIDCopyWithImpl<$Res, $Val extends ResponseGetUserByID>
    implements $ResponseGetUserByIDCopyWith<$Res> {
  _$ResponseGetUserByIDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO?,
    ) as $Val);
  }

  /// Create a copy of ResponseGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDTOCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDTOCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseGetUserByIDImplCopyWith<$Res>
    implements $ResponseGetUserByIDCopyWith<$Res> {
  factory _$$ResponseGetUserByIDImplCopyWith(_$ResponseGetUserByIDImpl value,
          $Res Function(_$ResponseGetUserByIDImpl) then) =
      __$$ResponseGetUserByIDImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserDTO? user});

  @override
  $UserDTOCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ResponseGetUserByIDImplCopyWithImpl<$Res>
    extends _$ResponseGetUserByIDCopyWithImpl<$Res, _$ResponseGetUserByIDImpl>
    implements _$$ResponseGetUserByIDImplCopyWith<$Res> {
  __$$ResponseGetUserByIDImplCopyWithImpl(_$ResponseGetUserByIDImpl _value,
      $Res Function(_$ResponseGetUserByIDImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$ResponseGetUserByIDImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseGetUserByIDImpl implements _ResponseGetUserByID {
  const _$ResponseGetUserByIDImpl({this.user});

  factory _$ResponseGetUserByIDImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseGetUserByIDImplFromJson(json);

  @override
  final UserDTO? user;

  @override
  String toString() {
    return 'ResponseGetUserByID(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseGetUserByIDImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of ResponseGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseGetUserByIDImplCopyWith<_$ResponseGetUserByIDImpl> get copyWith =>
      __$$ResponseGetUserByIDImplCopyWithImpl<_$ResponseGetUserByIDImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseGetUserByIDImplToJson(
      this,
    );
  }
}

abstract class _ResponseGetUserByID implements ResponseGetUserByID {
  const factory _ResponseGetUserByID({final UserDTO? user}) =
      _$ResponseGetUserByIDImpl;

  factory _ResponseGetUserByID.fromJson(Map<String, dynamic> json) =
      _$ResponseGetUserByIDImpl.fromJson;

  @override
  UserDTO? get user;

  /// Create a copy of ResponseGetUserByID
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseGetUserByIDImplCopyWith<_$ResponseGetUserByIDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
