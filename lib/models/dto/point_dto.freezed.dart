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

ResponseGetTopPointUsers _$ResponseGetTopPointUsersFromJson(
    Map<String, dynamic> json) {
  return _ResponseGetTopPointUsers.fromJson(json);
}

/// @nodoc
mixin _$ResponseGetTopPointUsers {
  @JsonKey(name: 'top_users')
  List<DisplayUserDTO> get topUsers => throw _privateConstructorUsedError;

  /// Serializes this ResponseGetTopPointUsers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseGetTopPointUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseGetTopPointUsersCopyWith<ResponseGetTopPointUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseGetTopPointUsersCopyWith<$Res> {
  factory $ResponseGetTopPointUsersCopyWith(ResponseGetTopPointUsers value,
          $Res Function(ResponseGetTopPointUsers) then) =
      _$ResponseGetTopPointUsersCopyWithImpl<$Res, ResponseGetTopPointUsers>;
  @useResult
  $Res call({@JsonKey(name: 'top_users') List<DisplayUserDTO> topUsers});
}

/// @nodoc
class _$ResponseGetTopPointUsersCopyWithImpl<$Res,
        $Val extends ResponseGetTopPointUsers>
    implements $ResponseGetTopPointUsersCopyWith<$Res> {
  _$ResponseGetTopPointUsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseGetTopPointUsers
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
              as List<DisplayUserDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseGetTopPointUsersImplCopyWith<$Res>
    implements $ResponseGetTopPointUsersCopyWith<$Res> {
  factory _$$ResponseGetTopPointUsersImplCopyWith(
          _$ResponseGetTopPointUsersImpl value,
          $Res Function(_$ResponseGetTopPointUsersImpl) then) =
      __$$ResponseGetTopPointUsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'top_users') List<DisplayUserDTO> topUsers});
}

/// @nodoc
class __$$ResponseGetTopPointUsersImplCopyWithImpl<$Res>
    extends _$ResponseGetTopPointUsersCopyWithImpl<$Res,
        _$ResponseGetTopPointUsersImpl>
    implements _$$ResponseGetTopPointUsersImplCopyWith<$Res> {
  __$$ResponseGetTopPointUsersImplCopyWithImpl(
      _$ResponseGetTopPointUsersImpl _value,
      $Res Function(_$ResponseGetTopPointUsersImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseGetTopPointUsers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topUsers = null,
  }) {
    return _then(_$ResponseGetTopPointUsersImpl(
      topUsers: null == topUsers
          ? _value._topUsers
          : topUsers // ignore: cast_nullable_to_non_nullable
              as List<DisplayUserDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseGetTopPointUsersImpl implements _ResponseGetTopPointUsers {
  const _$ResponseGetTopPointUsersImpl(
      {@JsonKey(name: 'top_users')
      required final List<DisplayUserDTO> topUsers})
      : _topUsers = topUsers;

  factory _$ResponseGetTopPointUsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseGetTopPointUsersImplFromJson(json);

  final List<DisplayUserDTO> _topUsers;
  @override
  @JsonKey(name: 'top_users')
  List<DisplayUserDTO> get topUsers {
    if (_topUsers is EqualUnmodifiableListView) return _topUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topUsers);
  }

  @override
  String toString() {
    return 'ResponseGetTopPointUsers(topUsers: $topUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseGetTopPointUsersImpl &&
            const DeepCollectionEquality().equals(other._topUsers, _topUsers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_topUsers));

  /// Create a copy of ResponseGetTopPointUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseGetTopPointUsersImplCopyWith<_$ResponseGetTopPointUsersImpl>
      get copyWith => __$$ResponseGetTopPointUsersImplCopyWithImpl<
          _$ResponseGetTopPointUsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseGetTopPointUsersImplToJson(
      this,
    );
  }
}

abstract class _ResponseGetTopPointUsers implements ResponseGetTopPointUsers {
  const factory _ResponseGetTopPointUsers(
          {@JsonKey(name: 'top_users')
          required final List<DisplayUserDTO> topUsers}) =
      _$ResponseGetTopPointUsersImpl;

  factory _ResponseGetTopPointUsers.fromJson(Map<String, dynamic> json) =
      _$ResponseGetTopPointUsersImpl.fromJson;

  @override
  @JsonKey(name: 'top_users')
  List<DisplayUserDTO> get topUsers;

  /// Create a copy of ResponseGetTopPointUsers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseGetTopPointUsersImplCopyWith<_$ResponseGetTopPointUsersImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseGetPointsHistory _$ResponseGetPointsHistoryFromJson(
    Map<String, dynamic> json) {
  return _ResponseGetPointsHistory.fromJson(json);
}

/// @nodoc
mixin _$ResponseGetPointsHistory {
  @JsonKey(name: 'histories')
  List<PointsHistoryDTO> get histories => throw _privateConstructorUsedError;

  /// Serializes this ResponseGetPointsHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseGetPointsHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseGetPointsHistoryCopyWith<ResponseGetPointsHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseGetPointsHistoryCopyWith<$Res> {
  factory $ResponseGetPointsHistoryCopyWith(ResponseGetPointsHistory value,
          $Res Function(ResponseGetPointsHistory) then) =
      _$ResponseGetPointsHistoryCopyWithImpl<$Res, ResponseGetPointsHistory>;
  @useResult
  $Res call({@JsonKey(name: 'histories') List<PointsHistoryDTO> histories});
}

/// @nodoc
class _$ResponseGetPointsHistoryCopyWithImpl<$Res,
        $Val extends ResponseGetPointsHistory>
    implements $ResponseGetPointsHistoryCopyWith<$Res> {
  _$ResponseGetPointsHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseGetPointsHistory
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
              as List<PointsHistoryDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseGetPointsHistoryImplCopyWith<$Res>
    implements $ResponseGetPointsHistoryCopyWith<$Res> {
  factory _$$ResponseGetPointsHistoryImplCopyWith(
          _$ResponseGetPointsHistoryImpl value,
          $Res Function(_$ResponseGetPointsHistoryImpl) then) =
      __$$ResponseGetPointsHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'histories') List<PointsHistoryDTO> histories});
}

/// @nodoc
class __$$ResponseGetPointsHistoryImplCopyWithImpl<$Res>
    extends _$ResponseGetPointsHistoryCopyWithImpl<$Res,
        _$ResponseGetPointsHistoryImpl>
    implements _$$ResponseGetPointsHistoryImplCopyWith<$Res> {
  __$$ResponseGetPointsHistoryImplCopyWithImpl(
      _$ResponseGetPointsHistoryImpl _value,
      $Res Function(_$ResponseGetPointsHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseGetPointsHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? histories = null,
  }) {
    return _then(_$ResponseGetPointsHistoryImpl(
      histories: null == histories
          ? _value._histories
          : histories // ignore: cast_nullable_to_non_nullable
              as List<PointsHistoryDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseGetPointsHistoryImpl implements _ResponseGetPointsHistory {
  const _$ResponseGetPointsHistoryImpl(
      {@JsonKey(name: 'histories')
      required final List<PointsHistoryDTO> histories})
      : _histories = histories;

  factory _$ResponseGetPointsHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseGetPointsHistoryImplFromJson(json);

  final List<PointsHistoryDTO> _histories;
  @override
  @JsonKey(name: 'histories')
  List<PointsHistoryDTO> get histories {
    if (_histories is EqualUnmodifiableListView) return _histories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_histories);
  }

  @override
  String toString() {
    return 'ResponseGetPointsHistory(histories: $histories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseGetPointsHistoryImpl &&
            const DeepCollectionEquality()
                .equals(other._histories, _histories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_histories));

  /// Create a copy of ResponseGetPointsHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseGetPointsHistoryImplCopyWith<_$ResponseGetPointsHistoryImpl>
      get copyWith => __$$ResponseGetPointsHistoryImplCopyWithImpl<
          _$ResponseGetPointsHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseGetPointsHistoryImplToJson(
      this,
    );
  }
}

abstract class _ResponseGetPointsHistory implements ResponseGetPointsHistory {
  const factory _ResponseGetPointsHistory(
          {@JsonKey(name: 'histories')
          required final List<PointsHistoryDTO> histories}) =
      _$ResponseGetPointsHistoryImpl;

  factory _ResponseGetPointsHistory.fromJson(Map<String, dynamic> json) =
      _$ResponseGetPointsHistoryImpl.fromJson;

  @override
  @JsonKey(name: 'histories')
  List<PointsHistoryDTO> get histories;

  /// Create a copy of ResponseGetPointsHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseGetPointsHistoryImplCopyWith<_$ResponseGetPointsHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseGetPointBalance _$ResponseGetPointBalanceFromJson(
    Map<String, dynamic> json) {
  return _ResponseGetPointBalance.fromJson(json);
}

/// @nodoc
mixin _$ResponseGetPointBalance {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance')
  int get balance => throw _privateConstructorUsedError;

  /// Serializes this ResponseGetPointBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseGetPointBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseGetPointBalanceCopyWith<ResponseGetPointBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseGetPointBalanceCopyWith<$Res> {
  factory $ResponseGetPointBalanceCopyWith(ResponseGetPointBalance value,
          $Res Function(ResponseGetPointBalance) then) =
      _$ResponseGetPointBalanceCopyWithImpl<$Res, ResponseGetPointBalance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'balance') int balance});
}

/// @nodoc
class _$ResponseGetPointBalanceCopyWithImpl<$Res,
        $Val extends ResponseGetPointBalance>
    implements $ResponseGetPointBalanceCopyWith<$Res> {
  _$ResponseGetPointBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseGetPointBalance
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
abstract class _$$ResponseGetPointBalanceImplCopyWith<$Res>
    implements $ResponseGetPointBalanceCopyWith<$Res> {
  factory _$$ResponseGetPointBalanceImplCopyWith(
          _$ResponseGetPointBalanceImpl value,
          $Res Function(_$ResponseGetPointBalanceImpl) then) =
      __$$ResponseGetPointBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'balance') int balance});
}

/// @nodoc
class __$$ResponseGetPointBalanceImplCopyWithImpl<$Res>
    extends _$ResponseGetPointBalanceCopyWithImpl<$Res,
        _$ResponseGetPointBalanceImpl>
    implements _$$ResponseGetPointBalanceImplCopyWith<$Res> {
  __$$ResponseGetPointBalanceImplCopyWithImpl(
      _$ResponseGetPointBalanceImpl _value,
      $Res Function(_$ResponseGetPointBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseGetPointBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
  }) {
    return _then(_$ResponseGetPointBalanceImpl(
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
class _$ResponseGetPointBalanceImpl implements _ResponseGetPointBalance {
  const _$ResponseGetPointBalanceImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'balance') required this.balance});

  factory _$ResponseGetPointBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseGetPointBalanceImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'balance')
  final int balance;

  @override
  String toString() {
    return 'ResponseGetPointBalance(userId: $userId, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseGetPointBalanceImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, balance);

  /// Create a copy of ResponseGetPointBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseGetPointBalanceImplCopyWith<_$ResponseGetPointBalanceImpl>
      get copyWith => __$$ResponseGetPointBalanceImplCopyWithImpl<
          _$ResponseGetPointBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseGetPointBalanceImplToJson(
      this,
    );
  }
}

abstract class _ResponseGetPointBalance implements ResponseGetPointBalance {
  const factory _ResponseGetPointBalance(
          {@JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'balance') required final int balance}) =
      _$ResponseGetPointBalanceImpl;

  factory _ResponseGetPointBalance.fromJson(Map<String, dynamic> json) =
      _$ResponseGetPointBalanceImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'balance')
  int get balance;

  /// Create a copy of ResponseGetPointBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseGetPointBalanceImplCopyWith<_$ResponseGetPointBalanceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PointsHistoryDTO _$PointsHistoryDTOFromJson(Map<String, dynamic> json) {
  return _PointsHistoryDTO.fromJson(json);
}

/// @nodoc
mixin _$PointsHistoryDTO {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String get createTime => throw _privateConstructorUsedError;

  /// Serializes this PointsHistoryDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointsHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointsHistoryDTOCopyWith<PointsHistoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointsHistoryDTOCopyWith<$Res> {
  factory $PointsHistoryDTOCopyWith(
          PointsHistoryDTO value, $Res Function(PointsHistoryDTO) then) =
      _$PointsHistoryDTOCopyWithImpl<$Res, PointsHistoryDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      int amount,
      String description,
      @JsonKey(name: 'create_time') String createTime});
}

/// @nodoc
class _$PointsHistoryDTOCopyWithImpl<$Res, $Val extends PointsHistoryDTO>
    implements $PointsHistoryDTOCopyWith<$Res> {
  _$PointsHistoryDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointsHistoryDTO
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
abstract class _$$PointsHistoryDTOImplCopyWith<$Res>
    implements $PointsHistoryDTOCopyWith<$Res> {
  factory _$$PointsHistoryDTOImplCopyWith(_$PointsHistoryDTOImpl value,
          $Res Function(_$PointsHistoryDTOImpl) then) =
      __$$PointsHistoryDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      int amount,
      String description,
      @JsonKey(name: 'create_time') String createTime});
}

/// @nodoc
class __$$PointsHistoryDTOImplCopyWithImpl<$Res>
    extends _$PointsHistoryDTOCopyWithImpl<$Res, _$PointsHistoryDTOImpl>
    implements _$$PointsHistoryDTOImplCopyWith<$Res> {
  __$$PointsHistoryDTOImplCopyWithImpl(_$PointsHistoryDTOImpl _value,
      $Res Function(_$PointsHistoryDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointsHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? description = null,
    Object? createTime = null,
  }) {
    return _then(_$PointsHistoryDTOImpl(
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
class _$PointsHistoryDTOImpl implements _PointsHistoryDTO {
  const _$PointsHistoryDTOImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      required this.amount,
      required this.description,
      @JsonKey(name: 'create_time') required this.createTime});

  factory _$PointsHistoryDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointsHistoryDTOImplFromJson(json);

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
    return 'PointsHistoryDTO(userId: $userId, amount: $amount, description: $description, createTime: $createTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointsHistoryDTOImpl &&
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

  /// Create a copy of PointsHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointsHistoryDTOImplCopyWith<_$PointsHistoryDTOImpl> get copyWith =>
      __$$PointsHistoryDTOImplCopyWithImpl<_$PointsHistoryDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointsHistoryDTOImplToJson(
      this,
    );
  }
}

abstract class _PointsHistoryDTO implements PointsHistoryDTO {
  const factory _PointsHistoryDTO(
          {@JsonKey(name: 'user_id') required final int userId,
          required final int amount,
          required final String description,
          @JsonKey(name: 'create_time') required final String createTime}) =
      _$PointsHistoryDTOImpl;

  factory _PointsHistoryDTO.fromJson(Map<String, dynamic> json) =
      _$PointsHistoryDTOImpl.fromJson;

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

  /// Create a copy of PointsHistoryDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointsHistoryDTOImplCopyWith<_$PointsHistoryDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
