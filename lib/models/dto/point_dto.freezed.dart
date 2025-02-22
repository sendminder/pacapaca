// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PointRankingResponse _$PointRankingResponseFromJson(Map<String, dynamic> json) {
  return _PointRankingResponse.fromJson(json);
}

/// @nodoc
mixin _$PointRankingResponse {
  @JsonKey(name: 'top_users')
  List<PointRankingDTO> get topUsers => throw _privateConstructorUsedError;

  /// Serializes this PointRankingResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointRankingResponseCopyWith<PointRankingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointRankingResponseCopyWith<$Res> {
  factory $PointRankingResponseCopyWith(PointRankingResponse value,
          $Res Function(PointRankingResponse) then) =
      _$PointRankingResponseCopyWithImpl<$Res, PointRankingResponse>;
  @useResult
  $Res call({@JsonKey(name: 'top_users') List<PointRankingDTO> topUsers});
}

/// @nodoc
class _$PointRankingResponseCopyWithImpl<$Res,
        $Val extends PointRankingResponse>
    implements $PointRankingResponseCopyWith<$Res> {
  _$PointRankingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topUsers = null,
  }) {
    return _then(_value.copyWith(
      topUsers: null == topUsers
          ? _value.topUsers
          : topUsers // ignore: cast_nullable_to_non_nullable
              as List<PointRankingDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointRankingResponseImplCopyWith<$Res>
    implements $PointRankingResponseCopyWith<$Res> {
  factory _$$PointRankingResponseImplCopyWith(_$PointRankingResponseImpl value,
          $Res Function(_$PointRankingResponseImpl) then) =
      __$$PointRankingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'top_users') List<PointRankingDTO> topUsers});
}

/// @nodoc
class __$$PointRankingResponseImplCopyWithImpl<$Res>
    extends _$PointRankingResponseCopyWithImpl<$Res, _$PointRankingResponseImpl>
    implements _$$PointRankingResponseImplCopyWith<$Res> {
  __$$PointRankingResponseImplCopyWithImpl(_$PointRankingResponseImpl _value,
      $Res Function(_$PointRankingResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topUsers = null,
  }) {
    return _then(_$PointRankingResponseImpl(
      topUsers: null == topUsers
          ? _value._topUsers
          : topUsers // ignore: cast_nullable_to_non_nullable
              as List<PointRankingDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointRankingResponseImpl implements _PointRankingResponse {
  const _$PointRankingResponseImpl(
      {@JsonKey(name: 'top_users')
      required final List<PointRankingDTO> topUsers})
      : _topUsers = topUsers;

  factory _$PointRankingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointRankingResponseImplFromJson(json);

  final List<PointRankingDTO> _topUsers;
  @override
  @JsonKey(name: 'top_users')
  List<PointRankingDTO> get topUsers {
    if (_topUsers is EqualUnmodifiableListView) return _topUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topUsers);
  }

  @override
  String toString() {
    return 'PointRankingResponse(topUsers: $topUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointRankingResponseImpl &&
            const DeepCollectionEquality().equals(other._topUsers, _topUsers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_topUsers));

  /// Create a copy of PointRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointRankingResponseImplCopyWith<_$PointRankingResponseImpl>
      get copyWith =>
          __$$PointRankingResponseImplCopyWithImpl<_$PointRankingResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointRankingResponseImplToJson(
      this,
    );
  }
}

abstract class _PointRankingResponse implements PointRankingResponse {
  const factory _PointRankingResponse(
          {@JsonKey(name: 'top_users')
          required final List<PointRankingDTO> topUsers}) =
      _$PointRankingResponseImpl;

  factory _PointRankingResponse.fromJson(Map<String, dynamic> json) =
      _$PointRankingResponseImpl.fromJson;

  @override
  @JsonKey(name: 'top_users')
  List<PointRankingDTO> get topUsers;

  /// Create a copy of PointRankingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointRankingResponseImplCopyWith<_$PointRankingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PointHistoryResponse _$PointHistoryResponseFromJson(Map<String, dynamic> json) {
  return _PointHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$PointHistoryResponse {
  @JsonKey(name: 'histories')
  List<PointHistoryDTO> get histories => throw _privateConstructorUsedError;

  /// Serializes this PointHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointHistoryResponseCopyWith<PointHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointHistoryResponseCopyWith<$Res> {
  factory $PointHistoryResponseCopyWith(PointHistoryResponse value,
          $Res Function(PointHistoryResponse) then) =
      _$PointHistoryResponseCopyWithImpl<$Res, PointHistoryResponse>;
  @useResult
  $Res call({@JsonKey(name: 'histories') List<PointHistoryDTO> histories});
}

/// @nodoc
class _$PointHistoryResponseCopyWithImpl<$Res,
        $Val extends PointHistoryResponse>
    implements $PointHistoryResponseCopyWith<$Res> {
  _$PointHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? histories = null,
  }) {
    return _then(_value.copyWith(
      histories: null == histories
          ? _value.histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<PointHistoryDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointHistoryResponseImplCopyWith<$Res>
    implements $PointHistoryResponseCopyWith<$Res> {
  factory _$$PointHistoryResponseImplCopyWith(_$PointHistoryResponseImpl value,
          $Res Function(_$PointHistoryResponseImpl) then) =
      __$$PointHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'histories') List<PointHistoryDTO> histories});
}

/// @nodoc
class __$$PointHistoryResponseImplCopyWithImpl<$Res>
    extends _$PointHistoryResponseCopyWithImpl<$Res, _$PointHistoryResponseImpl>
    implements _$$PointHistoryResponseImplCopyWith<$Res> {
  __$$PointHistoryResponseImplCopyWithImpl(_$PointHistoryResponseImpl _value,
      $Res Function(_$PointHistoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? histories = null,
  }) {
    return _then(_$PointHistoryResponseImpl(
      histories: null == histories
          ? _value._histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<PointHistoryDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointHistoryResponseImpl implements _PointHistoryResponse {
  const _$PointHistoryResponseImpl(
      {@JsonKey(name: 'histories')
      required final List<PointHistoryDTO> histories})
      : _histories = histories;

  factory _$PointHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointHistoryResponseImplFromJson(json);

  final List<PointHistoryDTO> _histories;
  @override
  @JsonKey(name: 'histories')
  List<PointHistoryDTO> get histories {
    if (_histories is EqualUnmodifiableListView) return _histories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_histories);
  }

  @override
  String toString() {
    return 'PointHistoryResponse(histories: $histories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointHistoryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._histories, _histories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_histories));

  /// Create a copy of PointHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointHistoryResponseImplCopyWith<_$PointHistoryResponseImpl>
      get copyWith =>
          __$$PointHistoryResponseImplCopyWithImpl<_$PointHistoryResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointHistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _PointHistoryResponse implements PointHistoryResponse {
  const factory _PointHistoryResponse(
          {@JsonKey(name: 'histories')
          required final List<PointHistoryDTO> histories}) =
      _$PointHistoryResponseImpl;

  factory _PointHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$PointHistoryResponseImpl.fromJson;

  @override
  @JsonKey(name: 'histories')
  List<PointHistoryDTO> get histories;

  /// Create a copy of PointHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointHistoryResponseImplCopyWith<_$PointHistoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PointBalanceResponse _$PointBalanceResponseFromJson(Map<String, dynamic> json) {
  return _PointBalanceResponse.fromJson(json);
}

/// @nodoc
mixin _$PointBalanceResponse {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance')
  int get balance => throw _privateConstructorUsedError;

  /// Serializes this PointBalanceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointBalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointBalanceResponseCopyWith<PointBalanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointBalanceResponseCopyWith<$Res> {
  factory $PointBalanceResponseCopyWith(PointBalanceResponse value,
          $Res Function(PointBalanceResponse) then) =
      _$PointBalanceResponseCopyWithImpl<$Res, PointBalanceResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'balance') int balance});
}

/// @nodoc
class _$PointBalanceResponseCopyWithImpl<$Res,
        $Val extends PointBalanceResponse>
    implements $PointBalanceResponseCopyWith<$Res> {
  _$PointBalanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointBalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointBalanceResponseImplCopyWith<$Res>
    implements $PointBalanceResponseCopyWith<$Res> {
  factory _$$PointBalanceResponseImplCopyWith(_$PointBalanceResponseImpl value,
          $Res Function(_$PointBalanceResponseImpl) then) =
      __$$PointBalanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'balance') int balance});
}

/// @nodoc
class __$$PointBalanceResponseImplCopyWithImpl<$Res>
    extends _$PointBalanceResponseCopyWithImpl<$Res, _$PointBalanceResponseImpl>
    implements _$$PointBalanceResponseImplCopyWith<$Res> {
  __$$PointBalanceResponseImplCopyWithImpl(_$PointBalanceResponseImpl _value,
      $Res Function(_$PointBalanceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointBalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
  }) {
    return _then(_$PointBalanceResponseImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointBalanceResponseImpl implements _PointBalanceResponse {
  const _$PointBalanceResponseImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'balance') required this.balance});

  factory _$PointBalanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointBalanceResponseImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'balance')
  final int balance;

  @override
  String toString() {
    return 'PointBalanceResponse(userId: $userId, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointBalanceResponseImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, balance);

  /// Create a copy of PointBalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointBalanceResponseImplCopyWith<_$PointBalanceResponseImpl>
      get copyWith =>
          __$$PointBalanceResponseImplCopyWithImpl<_$PointBalanceResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointBalanceResponseImplToJson(
      this,
    );
  }
}

abstract class _PointBalanceResponse implements PointBalanceResponse {
  const factory _PointBalanceResponse(
          {@JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'balance') required final int balance}) =
      _$PointBalanceResponseImpl;

  factory _PointBalanceResponse.fromJson(Map<String, dynamic> json) =
      _$PointBalanceResponseImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'balance')
  int get balance;

  /// Create a copy of PointBalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointBalanceResponseImplCopyWith<_$PointBalanceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PointRankingDTO _$PointRankingDTOFromJson(Map<String, dynamic> json) {
  return _PointRankingDTO.fromJson(json);
}

/// @nodoc
mixin _$PointRankingDTO {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_url')
  String? get profileUrl => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;

  /// Serializes this PointRankingDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointRankingDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointRankingDTOCopyWith<PointRankingDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointRankingDTOCopyWith<$Res> {
  factory $PointRankingDTOCopyWith(
          PointRankingDTO value, $Res Function(PointRankingDTO) then) =
      _$PointRankingDTOCopyWithImpl<$Res, PointRankingDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      String nickname,
      @JsonKey(name: 'profile_url') String? profileUrl,
      int balance});
}

/// @nodoc
class _$PointRankingDTOCopyWithImpl<$Res, $Val extends PointRankingDTO>
    implements $PointRankingDTOCopyWith<$Res> {
  _$PointRankingDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointRankingDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = null,
    Object? profileUrl = freezed,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointRankingDTOImplCopyWith<$Res>
    implements $PointRankingDTOCopyWith<$Res> {
  factory _$$PointRankingDTOImplCopyWith(_$PointRankingDTOImpl value,
          $Res Function(_$PointRankingDTOImpl) then) =
      __$$PointRankingDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      String nickname,
      @JsonKey(name: 'profile_url') String? profileUrl,
      int balance});
}

/// @nodoc
class __$$PointRankingDTOImplCopyWithImpl<$Res>
    extends _$PointRankingDTOCopyWithImpl<$Res, _$PointRankingDTOImpl>
    implements _$$PointRankingDTOImplCopyWith<$Res> {
  __$$PointRankingDTOImplCopyWithImpl(
      _$PointRankingDTOImpl _value, $Res Function(_$PointRankingDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointRankingDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = null,
    Object? profileUrl = freezed,
    Object? balance = null,
  }) {
    return _then(_$PointRankingDTOImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileUrl: freezed == profileUrl
          ? _value.profileUrl
          : profileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointRankingDTOImpl implements _PointRankingDTO {
  const _$PointRankingDTOImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      required this.nickname,
      @JsonKey(name: 'profile_url') this.profileUrl,
      required this.balance});

  factory _$PointRankingDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointRankingDTOImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final String nickname;
  @override
  @JsonKey(name: 'profile_url')
  final String? profileUrl;
  @override
  final int balance;

  @override
  String toString() {
    return 'PointRankingDTO(userId: $userId, nickname: $nickname, profileUrl: $profileUrl, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointRankingDTOImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileUrl, profileUrl) ||
                other.profileUrl == profileUrl) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, nickname, profileUrl, balance);

  /// Create a copy of PointRankingDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointRankingDTOImplCopyWith<_$PointRankingDTOImpl> get copyWith =>
      __$$PointRankingDTOImplCopyWithImpl<_$PointRankingDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointRankingDTOImplToJson(
      this,
    );
  }
}

abstract class _PointRankingDTO implements PointRankingDTO {
  const factory _PointRankingDTO(
      {@JsonKey(name: 'user_id') required final int userId,
      required final String nickname,
      @JsonKey(name: 'profile_url') final String? profileUrl,
      required final int balance}) = _$PointRankingDTOImpl;

  factory _PointRankingDTO.fromJson(Map<String, dynamic> json) =
      _$PointRankingDTOImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  String get nickname;
  @override
  @JsonKey(name: 'profile_url')
  String? get profileUrl;
  @override
  int get balance;

  /// Create a copy of PointRankingDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointRankingDTOImplCopyWith<_$PointRankingDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PointHistoryDTO _$PointHistoryDTOFromJson(Map<String, dynamic> json) {
  return _PointHistoryDTO.fromJson(json);
}

/// @nodoc
mixin _$PointHistoryDTO {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String get createTime => throw _privateConstructorUsedError;

  /// Serializes this PointHistoryDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointHistoryDTOCopyWith<PointHistoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointHistoryDTOCopyWith<$Res> {
  factory $PointHistoryDTOCopyWith(
          PointHistoryDTO value, $Res Function(PointHistoryDTO) then) =
      _$PointHistoryDTOCopyWithImpl<$Res, PointHistoryDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      int amount,
      String description,
      @JsonKey(name: 'create_time') String createTime});
}

/// @nodoc
class _$PointHistoryDTOCopyWithImpl<$Res, $Val extends PointHistoryDTO>
    implements $PointHistoryDTOCopyWith<$Res> {
  _$PointHistoryDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? description = null,
    Object? createTime = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointHistoryDTOImplCopyWith<$Res>
    implements $PointHistoryDTOCopyWith<$Res> {
  factory _$$PointHistoryDTOImplCopyWith(_$PointHistoryDTOImpl value,
          $Res Function(_$PointHistoryDTOImpl) then) =
      __$$PointHistoryDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      int amount,
      String description,
      @JsonKey(name: 'create_time') String createTime});
}

/// @nodoc
class __$$PointHistoryDTOImplCopyWithImpl<$Res>
    extends _$PointHistoryDTOCopyWithImpl<$Res, _$PointHistoryDTOImpl>
    implements _$$PointHistoryDTOImplCopyWith<$Res> {
  __$$PointHistoryDTOImplCopyWithImpl(
      _$PointHistoryDTOImpl _value, $Res Function(_$PointHistoryDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? description = null,
    Object? createTime = null,
  }) {
    return _then(_$PointHistoryDTOImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointHistoryDTOImpl implements _PointHistoryDTO {
  const _$PointHistoryDTOImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      required this.amount,
      required this.description,
      @JsonKey(name: 'create_time') required this.createTime});

  factory _$PointHistoryDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointHistoryDTOImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final int amount;
  @override
  final String description;
  @override
  @JsonKey(name: 'create_time')
  final String createTime;

  @override
  String toString() {
    return 'PointHistoryDTO(userId: $userId, amount: $amount, description: $description, createTime: $createTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointHistoryDTOImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, amount, description, createTime);

  /// Create a copy of PointHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointHistoryDTOImplCopyWith<_$PointHistoryDTOImpl> get copyWith =>
      __$$PointHistoryDTOImplCopyWithImpl<_$PointHistoryDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointHistoryDTOImplToJson(
      this,
    );
  }
}

abstract class _PointHistoryDTO implements PointHistoryDTO {
  const factory _PointHistoryDTO(
          {@JsonKey(name: 'user_id') required final int userId,
          required final int amount,
          required final String description,
          @JsonKey(name: 'create_time') required final String createTime}) =
      _$PointHistoryDTOImpl;

  factory _PointHistoryDTO.fromJson(Map<String, dynamic> json) =
      _$PointHistoryDTOImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  int get amount;
  @override
  String get description;
  @override
  @JsonKey(name: 'create_time')
  String get createTime;

  /// Create a copy of PointHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointHistoryDTOImplCopyWith<_$PointHistoryDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
