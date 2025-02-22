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

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return _UserDTO.fromJson(json);
}

/// @nodoc
mixin _$UserDTO {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_blocked')
  bool get isBlocked => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_official')
  bool get isOfficial => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_url')
  String? get profileImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_type')
  String? get profileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'badge_image_url')
  String? get badgeImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'badge_type')
  String? get badgeType => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  int? get carrots => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String? get createTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'update_time')
  String? get updateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'delete_time')
  String? get deleteTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'block_time')
  String? get blockTime => throw _privateConstructorUsedError;

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
      String email,
      String nickname,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_blocked') bool isBlocked,
      @JsonKey(name: 'is_official') bool isOfficial,
      @JsonKey(name: 'profile_image_url') String? profileImageUrl,
      @JsonKey(name: 'profile_type') String? profileType,
      @JsonKey(name: 'badge_image_url') String? badgeImageUrl,
      @JsonKey(name: 'badge_type') String? badgeType,
      int? points,
      int? carrots,
      @JsonKey(name: 'create_time') String? createTime,
      @JsonKey(name: 'update_time') String? updateTime,
      @JsonKey(name: 'delete_time') String? deleteTime,
      @JsonKey(name: 'block_time') String? blockTime});
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
    Object? email = null,
    Object? nickname = null,
    Object? isActive = null,
    Object? isBlocked = null,
    Object? isOfficial = null,
    Object? profileImageUrl = freezed,
    Object? profileType = freezed,
    Object? badgeImageUrl = freezed,
    Object? badgeType = freezed,
    Object? points = freezed,
    Object? carrots = freezed,
    Object? createTime = freezed,
    Object? updateTime = freezed,
    Object? deleteTime = freezed,
    Object? blockTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
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
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileType: freezed == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeImageUrl: freezed == badgeImageUrl
          ? _value.badgeImageUrl
          : badgeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeType: freezed == badgeType
          ? _value.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      carrots: freezed == carrots
          ? _value.carrots
          : carrots // ignore: cast_nullable_to_non_nullable
              as int?,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTime: freezed == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteTime: freezed == deleteTime
          ? _value.deleteTime
          : deleteTime // ignore: cast_nullable_to_non_nullable
              as String?,
      blockTime: freezed == blockTime
          ? _value.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      String email,
      String nickname,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_blocked') bool isBlocked,
      @JsonKey(name: 'is_official') bool isOfficial,
      @JsonKey(name: 'profile_image_url') String? profileImageUrl,
      @JsonKey(name: 'profile_type') String? profileType,
      @JsonKey(name: 'badge_image_url') String? badgeImageUrl,
      @JsonKey(name: 'badge_type') String? badgeType,
      int? points,
      int? carrots,
      @JsonKey(name: 'create_time') String? createTime,
      @JsonKey(name: 'update_time') String? updateTime,
      @JsonKey(name: 'delete_time') String? deleteTime,
      @JsonKey(name: 'block_time') String? blockTime});
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
    Object? email = null,
    Object? nickname = null,
    Object? isActive = null,
    Object? isBlocked = null,
    Object? isOfficial = null,
    Object? profileImageUrl = freezed,
    Object? profileType = freezed,
    Object? badgeImageUrl = freezed,
    Object? badgeType = freezed,
    Object? points = freezed,
    Object? carrots = freezed,
    Object? createTime = freezed,
    Object? updateTime = freezed,
    Object? deleteTime = freezed,
    Object? blockTime = freezed,
  }) {
    return _then(_$UserDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
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
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileType: freezed == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeImageUrl: freezed == badgeImageUrl
          ? _value.badgeImageUrl
          : badgeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeType: freezed == badgeType
          ? _value.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      carrots: freezed == carrots
          ? _value.carrots
          : carrots // ignore: cast_nullable_to_non_nullable
              as int?,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTime: freezed == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteTime: freezed == deleteTime
          ? _value.deleteTime
          : deleteTime // ignore: cast_nullable_to_non_nullable
              as String?,
      blockTime: freezed == blockTime
          ? _value.blockTime
          : blockTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDTOImpl implements _UserDTO {
  const _$UserDTOImpl(
      {required this.id,
      required this.email,
      required this.nickname,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'is_blocked') required this.isBlocked,
      @JsonKey(name: 'is_official') required this.isOfficial,
      @JsonKey(name: 'profile_image_url') this.profileImageUrl,
      @JsonKey(name: 'profile_type') this.profileType,
      @JsonKey(name: 'badge_image_url') this.badgeImageUrl,
      @JsonKey(name: 'badge_type') this.badgeType,
      this.points,
      this.carrots,
      @JsonKey(name: 'create_time') this.createTime,
      @JsonKey(name: 'update_time') this.updateTime,
      @JsonKey(name: 'delete_time') this.deleteTime,
      @JsonKey(name: 'block_time') this.blockTime});

  factory _$UserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDTOImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
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
  @JsonKey(name: 'profile_image_url')
  final String? profileImageUrl;
  @override
  @JsonKey(name: 'profile_type')
  final String? profileType;
  @override
  @JsonKey(name: 'badge_image_url')
  final String? badgeImageUrl;
  @override
  @JsonKey(name: 'badge_type')
  final String? badgeType;
  @override
  final int? points;
  @override
  final int? carrots;
  @override
  @JsonKey(name: 'create_time')
  final String? createTime;
  @override
  @JsonKey(name: 'update_time')
  final String? updateTime;
  @override
  @JsonKey(name: 'delete_time')
  final String? deleteTime;
  @override
  @JsonKey(name: 'block_time')
  final String? blockTime;

  @override
  String toString() {
    return 'UserDTO(id: $id, email: $email, nickname: $nickname, isActive: $isActive, isBlocked: $isBlocked, isOfficial: $isOfficial, profileImageUrl: $profileImageUrl, profileType: $profileType, badgeImageUrl: $badgeImageUrl, badgeType: $badgeType, points: $points, carrots: $carrots, createTime: $createTime, updateTime: $updateTime, deleteTime: $deleteTime, blockTime: $blockTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.isOfficial, isOfficial) ||
                other.isOfficial == isOfficial) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.profileType, profileType) ||
                other.profileType == profileType) &&
            (identical(other.badgeImageUrl, badgeImageUrl) ||
                other.badgeImageUrl == badgeImageUrl) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.carrots, carrots) || other.carrots == carrots) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.deleteTime, deleteTime) ||
                other.deleteTime == deleteTime) &&
            (identical(other.blockTime, blockTime) ||
                other.blockTime == blockTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      nickname,
      isActive,
      isBlocked,
      isOfficial,
      profileImageUrl,
      profileType,
      badgeImageUrl,
      badgeType,
      points,
      carrots,
      createTime,
      updateTime,
      deleteTime,
      blockTime);

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
      required final String email,
      required final String nickname,
      @JsonKey(name: 'is_active') required final bool isActive,
      @JsonKey(name: 'is_blocked') required final bool isBlocked,
      @JsonKey(name: 'is_official') required final bool isOfficial,
      @JsonKey(name: 'profile_image_url') final String? profileImageUrl,
      @JsonKey(name: 'profile_type') final String? profileType,
      @JsonKey(name: 'badge_image_url') final String? badgeImageUrl,
      @JsonKey(name: 'badge_type') final String? badgeType,
      final int? points,
      final int? carrots,
      @JsonKey(name: 'create_time') final String? createTime,
      @JsonKey(name: 'update_time') final String? updateTime,
      @JsonKey(name: 'delete_time') final String? deleteTime,
      @JsonKey(name: 'block_time') final String? blockTime}) = _$UserDTOImpl;

  factory _UserDTO.fromJson(Map<String, dynamic> json) = _$UserDTOImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
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
  @JsonKey(name: 'profile_image_url')
  String? get profileImageUrl;
  @override
  @JsonKey(name: 'profile_type')
  String? get profileType;
  @override
  @JsonKey(name: 'badge_image_url')
  String? get badgeImageUrl;
  @override
  @JsonKey(name: 'badge_type')
  String? get badgeType;
  @override
  int? get points;
  @override
  int? get carrots;
  @override
  @JsonKey(name: 'create_time')
  String? get createTime;
  @override
  @JsonKey(name: 'update_time')
  String? get updateTime;
  @override
  @JsonKey(name: 'delete_time')
  String? get deleteTime;
  @override
  @JsonKey(name: 'block_time')
  String? get blockTime;

  /// Create a copy of UserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDTOImplCopyWith<_$UserDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
