// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carrot_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestSendCarrots _$RequestSendCarrotsFromJson(Map<String, dynamic> json) {
  return _RequestSendCarrots.fromJson(json);
}

/// @nodoc
mixin _$RequestSendCarrots {
  @JsonKey(name: 'receiver_id')
  int get receiverId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_id')
  int? get commentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'article_id')
  int? get articleId => throw _privateConstructorUsedError;

  /// Serializes this RequestSendCarrots to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestSendCarrots
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestSendCarrotsCopyWith<RequestSendCarrots> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestSendCarrotsCopyWith<$Res> {
  factory $RequestSendCarrotsCopyWith(
          RequestSendCarrots value, $Res Function(RequestSendCarrots) then) =
      _$RequestSendCarrotsCopyWithImpl<$Res, RequestSendCarrots>;
  @useResult
  $Res call(
      {@JsonKey(name: 'receiver_id') int receiverId,
      int amount,
      String? description,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId});
}

/// @nodoc
class _$RequestSendCarrotsCopyWithImpl<$Res, $Val extends RequestSendCarrots>
    implements $RequestSendCarrotsCopyWith<$Res> {
  _$RequestSendCarrotsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestSendCarrots
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverId = null,
    Object? amount = null,
    Object? description = freezed,
    Object? commentId = freezed,
    Object? articleId = freezed,
  }) {
    return _then(_value.copyWith(
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestSendCarrotsImplCopyWith<$Res>
    implements $RequestSendCarrotsCopyWith<$Res> {
  factory _$$RequestSendCarrotsImplCopyWith(_$RequestSendCarrotsImpl value,
          $Res Function(_$RequestSendCarrotsImpl) then) =
      __$$RequestSendCarrotsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'receiver_id') int receiverId,
      int amount,
      String? description,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId});
}

/// @nodoc
class __$$RequestSendCarrotsImplCopyWithImpl<$Res>
    extends _$RequestSendCarrotsCopyWithImpl<$Res, _$RequestSendCarrotsImpl>
    implements _$$RequestSendCarrotsImplCopyWith<$Res> {
  __$$RequestSendCarrotsImplCopyWithImpl(_$RequestSendCarrotsImpl _value,
      $Res Function(_$RequestSendCarrotsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestSendCarrots
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverId = null,
    Object? amount = null,
    Object? description = freezed,
    Object? commentId = freezed,
    Object? articleId = freezed,
  }) {
    return _then(_$RequestSendCarrotsImpl(
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestSendCarrotsImpl implements _RequestSendCarrots {
  const _$RequestSendCarrotsImpl(
      {@JsonKey(name: 'receiver_id') required this.receiverId,
      required this.amount,
      this.description,
      @JsonKey(name: 'comment_id') this.commentId,
      @JsonKey(name: 'article_id') this.articleId});

  factory _$RequestSendCarrotsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestSendCarrotsImplFromJson(json);

  @override
  @JsonKey(name: 'receiver_id')
  final int receiverId;
  @override
  final int amount;
  @override
  final String? description;
  @override
  @JsonKey(name: 'comment_id')
  final int? commentId;
  @override
  @JsonKey(name: 'article_id')
  final int? articleId;

  @override
  String toString() {
    return 'RequestSendCarrots(receiverId: $receiverId, amount: $amount, description: $description, commentId: $commentId, articleId: $articleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestSendCarrotsImpl &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, receiverId, amount, description, commentId, articleId);

  /// Create a copy of RequestSendCarrots
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestSendCarrotsImplCopyWith<_$RequestSendCarrotsImpl> get copyWith =>
      __$$RequestSendCarrotsImplCopyWithImpl<_$RequestSendCarrotsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestSendCarrotsImplToJson(
      this,
    );
  }
}

abstract class _RequestSendCarrots implements RequestSendCarrots {
  const factory _RequestSendCarrots(
          {@JsonKey(name: 'receiver_id') required final int receiverId,
          required final int amount,
          final String? description,
          @JsonKey(name: 'comment_id') final int? commentId,
          @JsonKey(name: 'article_id') final int? articleId}) =
      _$RequestSendCarrotsImpl;

  factory _RequestSendCarrots.fromJson(Map<String, dynamic> json) =
      _$RequestSendCarrotsImpl.fromJson;

  @override
  @JsonKey(name: 'receiver_id')
  int get receiverId;
  @override
  int get amount;
  @override
  String? get description;
  @override
  @JsonKey(name: 'comment_id')
  int? get commentId;
  @override
  @JsonKey(name: 'article_id')
  int? get articleId;

  /// Create a copy of RequestSendCarrots
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestSendCarrotsImplCopyWith<_$RequestSendCarrotsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestAdminRewardCarrots _$RequestAdminRewardCarrotsFromJson(
    Map<String, dynamic> json) {
  return _RequestAdminRewardCarrots.fromJson(json);
}

/// @nodoc
mixin _$RequestAdminRewardCarrots {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this RequestAdminRewardCarrots to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestAdminRewardCarrots
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestAdminRewardCarrotsCopyWith<RequestAdminRewardCarrots> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestAdminRewardCarrotsCopyWith<$Res> {
  factory $RequestAdminRewardCarrotsCopyWith(RequestAdminRewardCarrots value,
          $Res Function(RequestAdminRewardCarrots) then) =
      _$RequestAdminRewardCarrotsCopyWithImpl<$Res, RequestAdminRewardCarrots>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId, int amount, String description});
}

/// @nodoc
class _$RequestAdminRewardCarrotsCopyWithImpl<$Res,
        $Val extends RequestAdminRewardCarrots>
    implements $RequestAdminRewardCarrotsCopyWith<$Res> {
  _$RequestAdminRewardCarrotsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestAdminRewardCarrots
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? description = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestAdminRewardCarrotsImplCopyWith<$Res>
    implements $RequestAdminRewardCarrotsCopyWith<$Res> {
  factory _$$RequestAdminRewardCarrotsImplCopyWith(
          _$RequestAdminRewardCarrotsImpl value,
          $Res Function(_$RequestAdminRewardCarrotsImpl) then) =
      __$$RequestAdminRewardCarrotsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId, int amount, String description});
}

/// @nodoc
class __$$RequestAdminRewardCarrotsImplCopyWithImpl<$Res>
    extends _$RequestAdminRewardCarrotsCopyWithImpl<$Res,
        _$RequestAdminRewardCarrotsImpl>
    implements _$$RequestAdminRewardCarrotsImplCopyWith<$Res> {
  __$$RequestAdminRewardCarrotsImplCopyWithImpl(
      _$RequestAdminRewardCarrotsImpl _value,
      $Res Function(_$RequestAdminRewardCarrotsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestAdminRewardCarrots
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? description = null,
  }) {
    return _then(_$RequestAdminRewardCarrotsImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestAdminRewardCarrotsImpl implements _RequestAdminRewardCarrots {
  const _$RequestAdminRewardCarrotsImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      required this.amount,
      required this.description});

  factory _$RequestAdminRewardCarrotsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestAdminRewardCarrotsImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final int amount;
  @override
  final String description;

  @override
  String toString() {
    return 'RequestAdminRewardCarrots(userId: $userId, amount: $amount, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestAdminRewardCarrotsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, amount, description);

  /// Create a copy of RequestAdminRewardCarrots
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestAdminRewardCarrotsImplCopyWith<_$RequestAdminRewardCarrotsImpl>
      get copyWith => __$$RequestAdminRewardCarrotsImplCopyWithImpl<
          _$RequestAdminRewardCarrotsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestAdminRewardCarrotsImplToJson(
      this,
    );
  }
}

abstract class _RequestAdminRewardCarrots implements RequestAdminRewardCarrots {
  const factory _RequestAdminRewardCarrots(
      {@JsonKey(name: 'user_id') required final int userId,
      required final int amount,
      required final String description}) = _$RequestAdminRewardCarrotsImpl;

  factory _RequestAdminRewardCarrots.fromJson(Map<String, dynamic> json) =
      _$RequestAdminRewardCarrotsImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  int get amount;
  @override
  String get description;

  /// Create a copy of RequestAdminRewardCarrots
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestAdminRewardCarrotsImplCopyWith<_$RequestAdminRewardCarrotsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestListTransactions _$RequestListTransactionsFromJson(
    Map<String, dynamic> json) {
  return _RequestListTransactions.fromJson(json);
}

/// @nodoc
mixin _$RequestListTransactions {
  int get limit => throw _privateConstructorUsedError;
  int? get pagingKey => throw _privateConstructorUsedError;

  /// Serializes this RequestListTransactions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestListTransactions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestListTransactionsCopyWith<RequestListTransactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestListTransactionsCopyWith<$Res> {
  factory $RequestListTransactionsCopyWith(RequestListTransactions value,
          $Res Function(RequestListTransactions) then) =
      _$RequestListTransactionsCopyWithImpl<$Res, RequestListTransactions>;
  @useResult
  $Res call({int limit, int? pagingKey});
}

/// @nodoc
class _$RequestListTransactionsCopyWithImpl<$Res,
        $Val extends RequestListTransactions>
    implements $RequestListTransactionsCopyWith<$Res> {
  _$RequestListTransactionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestListTransactions
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
abstract class _$$RequestListTransactionsImplCopyWith<$Res>
    implements $RequestListTransactionsCopyWith<$Res> {
  factory _$$RequestListTransactionsImplCopyWith(
          _$RequestListTransactionsImpl value,
          $Res Function(_$RequestListTransactionsImpl) then) =
      __$$RequestListTransactionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int? pagingKey});
}

/// @nodoc
class __$$RequestListTransactionsImplCopyWithImpl<$Res>
    extends _$RequestListTransactionsCopyWithImpl<$Res,
        _$RequestListTransactionsImpl>
    implements _$$RequestListTransactionsImplCopyWith<$Res> {
  __$$RequestListTransactionsImplCopyWithImpl(
      _$RequestListTransactionsImpl _value,
      $Res Function(_$RequestListTransactionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestListTransactions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? pagingKey = freezed,
  }) {
    return _then(_$RequestListTransactionsImpl(
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
class _$RequestListTransactionsImpl implements _RequestListTransactions {
  const _$RequestListTransactionsImpl({required this.limit, this.pagingKey});

  factory _$RequestListTransactionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestListTransactionsImplFromJson(json);

  @override
  final int limit;
  @override
  final int? pagingKey;

  @override
  String toString() {
    return 'RequestListTransactions(limit: $limit, pagingKey: $pagingKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestListTransactionsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.pagingKey, pagingKey) ||
                other.pagingKey == pagingKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, pagingKey);

  /// Create a copy of RequestListTransactions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestListTransactionsImplCopyWith<_$RequestListTransactionsImpl>
      get copyWith => __$$RequestListTransactionsImplCopyWithImpl<
          _$RequestListTransactionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestListTransactionsImplToJson(
      this,
    );
  }
}

abstract class _RequestListTransactions implements RequestListTransactions {
  const factory _RequestListTransactions(
      {required final int limit,
      final int? pagingKey}) = _$RequestListTransactionsImpl;

  factory _RequestListTransactions.fromJson(Map<String, dynamic> json) =
      _$RequestListTransactionsImpl.fromJson;

  @override
  int get limit;
  @override
  int? get pagingKey;

  /// Create a copy of RequestListTransactions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestListTransactionsImplCopyWith<_$RequestListTransactionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestListCarrotRankings _$RequestListCarrotRankingsFromJson(
    Map<String, dynamic> json) {
  return _RequestListCarrotRankings.fromJson(json);
}

/// @nodoc
mixin _$RequestListCarrotRankings {
  int get limit => throw _privateConstructorUsedError;
  int? get pagingKey => throw _privateConstructorUsedError;

  /// Serializes this RequestListCarrotRankings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestListCarrotRankings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestListCarrotRankingsCopyWith<RequestListCarrotRankings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestListCarrotRankingsCopyWith<$Res> {
  factory $RequestListCarrotRankingsCopyWith(RequestListCarrotRankings value,
          $Res Function(RequestListCarrotRankings) then) =
      _$RequestListCarrotRankingsCopyWithImpl<$Res, RequestListCarrotRankings>;
  @useResult
  $Res call({int limit, int? pagingKey});
}

/// @nodoc
class _$RequestListCarrotRankingsCopyWithImpl<$Res,
        $Val extends RequestListCarrotRankings>
    implements $RequestListCarrotRankingsCopyWith<$Res> {
  _$RequestListCarrotRankingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestListCarrotRankings
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
abstract class _$$RequestListCarrotRankingsImplCopyWith<$Res>
    implements $RequestListCarrotRankingsCopyWith<$Res> {
  factory _$$RequestListCarrotRankingsImplCopyWith(
          _$RequestListCarrotRankingsImpl value,
          $Res Function(_$RequestListCarrotRankingsImpl) then) =
      __$$RequestListCarrotRankingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int? pagingKey});
}

/// @nodoc
class __$$RequestListCarrotRankingsImplCopyWithImpl<$Res>
    extends _$RequestListCarrotRankingsCopyWithImpl<$Res,
        _$RequestListCarrotRankingsImpl>
    implements _$$RequestListCarrotRankingsImplCopyWith<$Res> {
  __$$RequestListCarrotRankingsImplCopyWithImpl(
      _$RequestListCarrotRankingsImpl _value,
      $Res Function(_$RequestListCarrotRankingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestListCarrotRankings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? pagingKey = freezed,
  }) {
    return _then(_$RequestListCarrotRankingsImpl(
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
class _$RequestListCarrotRankingsImpl implements _RequestListCarrotRankings {
  const _$RequestListCarrotRankingsImpl({required this.limit, this.pagingKey});

  factory _$RequestListCarrotRankingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestListCarrotRankingsImplFromJson(json);

  @override
  final int limit;
  @override
  final int? pagingKey;

  @override
  String toString() {
    return 'RequestListCarrotRankings(limit: $limit, pagingKey: $pagingKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestListCarrotRankingsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.pagingKey, pagingKey) ||
                other.pagingKey == pagingKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, pagingKey);

  /// Create a copy of RequestListCarrotRankings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestListCarrotRankingsImplCopyWith<_$RequestListCarrotRankingsImpl>
      get copyWith => __$$RequestListCarrotRankingsImplCopyWithImpl<
          _$RequestListCarrotRankingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestListCarrotRankingsImplToJson(
      this,
    );
  }
}

abstract class _RequestListCarrotRankings implements RequestListCarrotRankings {
  const factory _RequestListCarrotRankings(
      {required final int limit,
      final int? pagingKey}) = _$RequestListCarrotRankingsImpl;

  factory _RequestListCarrotRankings.fromJson(Map<String, dynamic> json) =
      _$RequestListCarrotRankingsImpl.fromJson;

  @override
  int get limit;
  @override
  int? get pagingKey;

  /// Create a copy of RequestListCarrotRankings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestListCarrotRankingsImplCopyWith<_$RequestListCarrotRankingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseCarrotBalance _$ResponseCarrotBalanceFromJson(
    Map<String, dynamic> json) {
  return _ResponseCarrotBalance.fromJson(json);
}

/// @nodoc
mixin _$ResponseCarrotBalance {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;

  /// Serializes this ResponseCarrotBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseCarrotBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseCarrotBalanceCopyWith<ResponseCarrotBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCarrotBalanceCopyWith<$Res> {
  factory $ResponseCarrotBalanceCopyWith(ResponseCarrotBalance value,
          $Res Function(ResponseCarrotBalance) then) =
      _$ResponseCarrotBalanceCopyWithImpl<$Res, ResponseCarrotBalance>;
  @useResult
  $Res call({@JsonKey(name: 'user_id') int userId, int balance});
}

/// @nodoc
class _$ResponseCarrotBalanceCopyWithImpl<$Res,
        $Val extends ResponseCarrotBalance>
    implements $ResponseCarrotBalanceCopyWith<$Res> {
  _$ResponseCarrotBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseCarrotBalance
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
abstract class _$$ResponseCarrotBalanceImplCopyWith<$Res>
    implements $ResponseCarrotBalanceCopyWith<$Res> {
  factory _$$ResponseCarrotBalanceImplCopyWith(
          _$ResponseCarrotBalanceImpl value,
          $Res Function(_$ResponseCarrotBalanceImpl) then) =
      __$$ResponseCarrotBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user_id') int userId, int balance});
}

/// @nodoc
class __$$ResponseCarrotBalanceImplCopyWithImpl<$Res>
    extends _$ResponseCarrotBalanceCopyWithImpl<$Res,
        _$ResponseCarrotBalanceImpl>
    implements _$$ResponseCarrotBalanceImplCopyWith<$Res> {
  __$$ResponseCarrotBalanceImplCopyWithImpl(_$ResponseCarrotBalanceImpl _value,
      $Res Function(_$ResponseCarrotBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseCarrotBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
  }) {
    return _then(_$ResponseCarrotBalanceImpl(
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
class _$ResponseCarrotBalanceImpl implements _ResponseCarrotBalance {
  const _$ResponseCarrotBalanceImpl(
      {@JsonKey(name: 'user_id') required this.userId, required this.balance});

  factory _$ResponseCarrotBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseCarrotBalanceImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final int balance;

  @override
  String toString() {
    return 'ResponseCarrotBalance(userId: $userId, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseCarrotBalanceImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, balance);

  /// Create a copy of ResponseCarrotBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseCarrotBalanceImplCopyWith<_$ResponseCarrotBalanceImpl>
      get copyWith => __$$ResponseCarrotBalanceImplCopyWithImpl<
          _$ResponseCarrotBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseCarrotBalanceImplToJson(
      this,
    );
  }
}

abstract class _ResponseCarrotBalance implements ResponseCarrotBalance {
  const factory _ResponseCarrotBalance(
      {@JsonKey(name: 'user_id') required final int userId,
      required final int balance}) = _$ResponseCarrotBalanceImpl;

  factory _ResponseCarrotBalance.fromJson(Map<String, dynamic> json) =
      _$ResponseCarrotBalanceImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  int get balance;

  /// Create a copy of ResponseCarrotBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseCarrotBalanceImplCopyWith<_$ResponseCarrotBalanceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseCarrotTransaction _$ResponseCarrotTransactionFromJson(
    Map<String, dynamic> json) {
  return _ResponseCarrotTransaction.fromJson(json);
}

/// @nodoc
mixin _$ResponseCarrotTransaction {
  CarrotTransactionDTO get transaction => throw _privateConstructorUsedError;

  /// Serializes this ResponseCarrotTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseCarrotTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseCarrotTransactionCopyWith<ResponseCarrotTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCarrotTransactionCopyWith<$Res> {
  factory $ResponseCarrotTransactionCopyWith(ResponseCarrotTransaction value,
          $Res Function(ResponseCarrotTransaction) then) =
      _$ResponseCarrotTransactionCopyWithImpl<$Res, ResponseCarrotTransaction>;
  @useResult
  $Res call({CarrotTransactionDTO transaction});

  $CarrotTransactionDTOCopyWith<$Res> get transaction;
}

/// @nodoc
class _$ResponseCarrotTransactionCopyWithImpl<$Res,
        $Val extends ResponseCarrotTransaction>
    implements $ResponseCarrotTransactionCopyWith<$Res> {
  _$ResponseCarrotTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseCarrotTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_value.copyWith(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as CarrotTransactionDTO,
    ) as $Val);
  }

  /// Create a copy of ResponseCarrotTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CarrotTransactionDTOCopyWith<$Res> get transaction {
    return $CarrotTransactionDTOCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseCarrotTransactionImplCopyWith<$Res>
    implements $ResponseCarrotTransactionCopyWith<$Res> {
  factory _$$ResponseCarrotTransactionImplCopyWith(
          _$ResponseCarrotTransactionImpl value,
          $Res Function(_$ResponseCarrotTransactionImpl) then) =
      __$$ResponseCarrotTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CarrotTransactionDTO transaction});

  @override
  $CarrotTransactionDTOCopyWith<$Res> get transaction;
}

/// @nodoc
class __$$ResponseCarrotTransactionImplCopyWithImpl<$Res>
    extends _$ResponseCarrotTransactionCopyWithImpl<$Res,
        _$ResponseCarrotTransactionImpl>
    implements _$$ResponseCarrotTransactionImplCopyWith<$Res> {
  __$$ResponseCarrotTransactionImplCopyWithImpl(
      _$ResponseCarrotTransactionImpl _value,
      $Res Function(_$ResponseCarrotTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseCarrotTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$ResponseCarrotTransactionImpl(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as CarrotTransactionDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseCarrotTransactionImpl implements _ResponseCarrotTransaction {
  const _$ResponseCarrotTransactionImpl({required this.transaction});

  factory _$ResponseCarrotTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseCarrotTransactionImplFromJson(json);

  @override
  final CarrotTransactionDTO transaction;

  @override
  String toString() {
    return 'ResponseCarrotTransaction(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseCarrotTransactionImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  /// Create a copy of ResponseCarrotTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseCarrotTransactionImplCopyWith<_$ResponseCarrotTransactionImpl>
      get copyWith => __$$ResponseCarrotTransactionImplCopyWithImpl<
          _$ResponseCarrotTransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseCarrotTransactionImplToJson(
      this,
    );
  }
}

abstract class _ResponseCarrotTransaction implements ResponseCarrotTransaction {
  const factory _ResponseCarrotTransaction(
          {required final CarrotTransactionDTO transaction}) =
      _$ResponseCarrotTransactionImpl;

  factory _ResponseCarrotTransaction.fromJson(Map<String, dynamic> json) =
      _$ResponseCarrotTransactionImpl.fromJson;

  @override
  CarrotTransactionDTO get transaction;

  /// Create a copy of ResponseCarrotTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseCarrotTransactionImplCopyWith<_$ResponseCarrotTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseCarrotTransactions _$ResponseCarrotTransactionsFromJson(
    Map<String, dynamic> json) {
  return _ResponseCarrotTransactions.fromJson(json);
}

/// @nodoc
mixin _$ResponseCarrotTransactions {
  List<CarrotTransactionDTO>? get transactions =>
      throw _privateConstructorUsedError;

  /// Serializes this ResponseCarrotTransactions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseCarrotTransactions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseCarrotTransactionsCopyWith<ResponseCarrotTransactions>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCarrotTransactionsCopyWith<$Res> {
  factory $ResponseCarrotTransactionsCopyWith(ResponseCarrotTransactions value,
          $Res Function(ResponseCarrotTransactions) then) =
      _$ResponseCarrotTransactionsCopyWithImpl<$Res,
          ResponseCarrotTransactions>;
  @useResult
  $Res call({List<CarrotTransactionDTO>? transactions});
}

/// @nodoc
class _$ResponseCarrotTransactionsCopyWithImpl<$Res,
        $Val extends ResponseCarrotTransactions>
    implements $ResponseCarrotTransactionsCopyWith<$Res> {
  _$ResponseCarrotTransactionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseCarrotTransactions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = freezed,
  }) {
    return _then(_value.copyWith(
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<CarrotTransactionDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseCarrotTransactionsImplCopyWith<$Res>
    implements $ResponseCarrotTransactionsCopyWith<$Res> {
  factory _$$ResponseCarrotTransactionsImplCopyWith(
          _$ResponseCarrotTransactionsImpl value,
          $Res Function(_$ResponseCarrotTransactionsImpl) then) =
      __$$ResponseCarrotTransactionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CarrotTransactionDTO>? transactions});
}

/// @nodoc
class __$$ResponseCarrotTransactionsImplCopyWithImpl<$Res>
    extends _$ResponseCarrotTransactionsCopyWithImpl<$Res,
        _$ResponseCarrotTransactionsImpl>
    implements _$$ResponseCarrotTransactionsImplCopyWith<$Res> {
  __$$ResponseCarrotTransactionsImplCopyWithImpl(
      _$ResponseCarrotTransactionsImpl _value,
      $Res Function(_$ResponseCarrotTransactionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseCarrotTransactions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = freezed,
  }) {
    return _then(_$ResponseCarrotTransactionsImpl(
      transactions: freezed == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<CarrotTransactionDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseCarrotTransactionsImpl implements _ResponseCarrotTransactions {
  const _$ResponseCarrotTransactionsImpl(
      {final List<CarrotTransactionDTO>? transactions})
      : _transactions = transactions;

  factory _$ResponseCarrotTransactionsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseCarrotTransactionsImplFromJson(json);

  final List<CarrotTransactionDTO>? _transactions;
  @override
  List<CarrotTransactionDTO>? get transactions {
    final value = _transactions;
    if (value == null) return null;
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResponseCarrotTransactions(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseCarrotTransactionsImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  /// Create a copy of ResponseCarrotTransactions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseCarrotTransactionsImplCopyWith<_$ResponseCarrotTransactionsImpl>
      get copyWith => __$$ResponseCarrotTransactionsImplCopyWithImpl<
          _$ResponseCarrotTransactionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseCarrotTransactionsImplToJson(
      this,
    );
  }
}

abstract class _ResponseCarrotTransactions
    implements ResponseCarrotTransactions {
  const factory _ResponseCarrotTransactions(
          {final List<CarrotTransactionDTO>? transactions}) =
      _$ResponseCarrotTransactionsImpl;

  factory _ResponseCarrotTransactions.fromJson(Map<String, dynamic> json) =
      _$ResponseCarrotTransactionsImpl.fromJson;

  @override
  List<CarrotTransactionDTO>? get transactions;

  /// Create a copy of ResponseCarrotTransactions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseCarrotTransactionsImplCopyWith<_$ResponseCarrotTransactionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseCarrotRankings _$ResponseCarrotRankingsFromJson(
    Map<String, dynamic> json) {
  return _ResponseCarrotRankings.fromJson(json);
}

/// @nodoc
mixin _$ResponseCarrotRankings {
  @JsonKey(name: 'top_receivers')
  List<DisplayUserDTO>? get topReceivers => throw _privateConstructorUsedError;
  @JsonKey(name: 'top_senders')
  List<DisplayUserDTO>? get topSenders => throw _privateConstructorUsedError;

  /// Serializes this ResponseCarrotRankings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseCarrotRankings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseCarrotRankingsCopyWith<ResponseCarrotRankings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCarrotRankingsCopyWith<$Res> {
  factory $ResponseCarrotRankingsCopyWith(ResponseCarrotRankings value,
          $Res Function(ResponseCarrotRankings) then) =
      _$ResponseCarrotRankingsCopyWithImpl<$Res, ResponseCarrotRankings>;
  @useResult
  $Res call(
      {@JsonKey(name: 'top_receivers') List<DisplayUserDTO>? topReceivers,
      @JsonKey(name: 'top_senders') List<DisplayUserDTO>? topSenders});
}

/// @nodoc
class _$ResponseCarrotRankingsCopyWithImpl<$Res,
        $Val extends ResponseCarrotRankings>
    implements $ResponseCarrotRankingsCopyWith<$Res> {
  _$ResponseCarrotRankingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseCarrotRankings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topReceivers = freezed,
    Object? topSenders = freezed,
  }) {
    return _then(_value.copyWith(
      topReceivers: freezed == topReceivers
          ? _value.topReceivers
          : topReceivers // ignore: cast_nullable_to_non_nullable
              as List<DisplayUserDTO>?,
      topSenders: freezed == topSenders
          ? _value.topSenders
          : topSenders // ignore: cast_nullable_to_non_nullable
              as List<DisplayUserDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseCarrotRankingsImplCopyWith<$Res>
    implements $ResponseCarrotRankingsCopyWith<$Res> {
  factory _$$ResponseCarrotRankingsImplCopyWith(
          _$ResponseCarrotRankingsImpl value,
          $Res Function(_$ResponseCarrotRankingsImpl) then) =
      __$$ResponseCarrotRankingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'top_receivers') List<DisplayUserDTO>? topReceivers,
      @JsonKey(name: 'top_senders') List<DisplayUserDTO>? topSenders});
}

/// @nodoc
class __$$ResponseCarrotRankingsImplCopyWithImpl<$Res>
    extends _$ResponseCarrotRankingsCopyWithImpl<$Res,
        _$ResponseCarrotRankingsImpl>
    implements _$$ResponseCarrotRankingsImplCopyWith<$Res> {
  __$$ResponseCarrotRankingsImplCopyWithImpl(
      _$ResponseCarrotRankingsImpl _value,
      $Res Function(_$ResponseCarrotRankingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseCarrotRankings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topReceivers = freezed,
    Object? topSenders = freezed,
  }) {
    return _then(_$ResponseCarrotRankingsImpl(
      topReceivers: freezed == topReceivers
          ? _value._topReceivers
          : topReceivers // ignore: cast_nullable_to_non_nullable
              as List<DisplayUserDTO>?,
      topSenders: freezed == topSenders
          ? _value._topSenders
          : topSenders // ignore: cast_nullable_to_non_nullable
              as List<DisplayUserDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseCarrotRankingsImpl implements _ResponseCarrotRankings {
  const _$ResponseCarrotRankingsImpl(
      {@JsonKey(name: 'top_receivers') final List<DisplayUserDTO>? topReceivers,
      @JsonKey(name: 'top_senders') final List<DisplayUserDTO>? topSenders})
      : _topReceivers = topReceivers,
        _topSenders = topSenders;

  factory _$ResponseCarrotRankingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseCarrotRankingsImplFromJson(json);

  final List<DisplayUserDTO>? _topReceivers;
  @override
  @JsonKey(name: 'top_receivers')
  List<DisplayUserDTO>? get topReceivers {
    final value = _topReceivers;
    if (value == null) return null;
    if (_topReceivers is EqualUnmodifiableListView) return _topReceivers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DisplayUserDTO>? _topSenders;
  @override
  @JsonKey(name: 'top_senders')
  List<DisplayUserDTO>? get topSenders {
    final value = _topSenders;
    if (value == null) return null;
    if (_topSenders is EqualUnmodifiableListView) return _topSenders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResponseCarrotRankings(topReceivers: $topReceivers, topSenders: $topSenders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseCarrotRankingsImpl &&
            const DeepCollectionEquality()
                .equals(other._topReceivers, _topReceivers) &&
            const DeepCollectionEquality()
                .equals(other._topSenders, _topSenders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topReceivers),
      const DeepCollectionEquality().hash(_topSenders));

  /// Create a copy of ResponseCarrotRankings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseCarrotRankingsImplCopyWith<_$ResponseCarrotRankingsImpl>
      get copyWith => __$$ResponseCarrotRankingsImplCopyWithImpl<
          _$ResponseCarrotRankingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseCarrotRankingsImplToJson(
      this,
    );
  }
}

abstract class _ResponseCarrotRankings implements ResponseCarrotRankings {
  const factory _ResponseCarrotRankings(
      {@JsonKey(name: 'top_receivers') final List<DisplayUserDTO>? topReceivers,
      @JsonKey(name: 'top_senders')
      final List<DisplayUserDTO>? topSenders}) = _$ResponseCarrotRankingsImpl;

  factory _ResponseCarrotRankings.fromJson(Map<String, dynamic> json) =
      _$ResponseCarrotRankingsImpl.fromJson;

  @override
  @JsonKey(name: 'top_receivers')
  List<DisplayUserDTO>? get topReceivers;
  @override
  @JsonKey(name: 'top_senders')
  List<DisplayUserDTO>? get topSenders;

  /// Create a copy of ResponseCarrotRankings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseCarrotRankingsImplCopyWith<_$ResponseCarrotRankingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CarrotTransactionDTO _$CarrotTransactionDTOFromJson(Map<String, dynamic> json) {
  return _CarrotTransactionDTO.fromJson(json);
}

/// @nodoc
mixin _$CarrotTransactionDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_id')
  int? get senderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_id')
  int get receiverId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_id')
  int? get commentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'article_id')
  int? get articleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String get createTime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this CarrotTransactionDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarrotTransactionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarrotTransactionDTOCopyWith<CarrotTransactionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarrotTransactionDTOCopyWith<$Res> {
  factory $CarrotTransactionDTOCopyWith(CarrotTransactionDTO value,
          $Res Function(CarrotTransactionDTO) then) =
      _$CarrotTransactionDTOCopyWithImpl<$Res, CarrotTransactionDTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sender_id') int? senderId,
      @JsonKey(name: 'receiver_id') int receiverId,
      int amount,
      String? description,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId,
      @JsonKey(name: 'create_time') String createTime,
      String type});
}

/// @nodoc
class _$CarrotTransactionDTOCopyWithImpl<$Res,
        $Val extends CarrotTransactionDTO>
    implements $CarrotTransactionDTOCopyWith<$Res> {
  _$CarrotTransactionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarrotTransactionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = freezed,
    Object? receiverId = null,
    Object? amount = null,
    Object? description = freezed,
    Object? commentId = freezed,
    Object? articleId = freezed,
    Object? createTime = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int?,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarrotTransactionDTOImplCopyWith<$Res>
    implements $CarrotTransactionDTOCopyWith<$Res> {
  factory _$$CarrotTransactionDTOImplCopyWith(_$CarrotTransactionDTOImpl value,
          $Res Function(_$CarrotTransactionDTOImpl) then) =
      __$$CarrotTransactionDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'sender_id') int? senderId,
      @JsonKey(name: 'receiver_id') int receiverId,
      int amount,
      String? description,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId,
      @JsonKey(name: 'create_time') String createTime,
      String type});
}

/// @nodoc
class __$$CarrotTransactionDTOImplCopyWithImpl<$Res>
    extends _$CarrotTransactionDTOCopyWithImpl<$Res, _$CarrotTransactionDTOImpl>
    implements _$$CarrotTransactionDTOImplCopyWith<$Res> {
  __$$CarrotTransactionDTOImplCopyWithImpl(_$CarrotTransactionDTOImpl _value,
      $Res Function(_$CarrotTransactionDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarrotTransactionDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = freezed,
    Object? receiverId = null,
    Object? amount = null,
    Object? description = freezed,
    Object? commentId = freezed,
    Object? articleId = freezed,
    Object? createTime = null,
    Object? type = null,
  }) {
    return _then(_$CarrotTransactionDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int?,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      articleId: freezed == articleId
          ? _value.articleId
          : articleId // ignore: cast_nullable_to_non_nullable
              as int?,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarrotTransactionDTOImpl implements _CarrotTransactionDTO {
  const _$CarrotTransactionDTOImpl(
      {required this.id,
      @JsonKey(name: 'sender_id') this.senderId,
      @JsonKey(name: 'receiver_id') required this.receiverId,
      required this.amount,
      this.description,
      @JsonKey(name: 'comment_id') this.commentId,
      @JsonKey(name: 'article_id') this.articleId,
      @JsonKey(name: 'create_time') required this.createTime,
      required this.type});

  factory _$CarrotTransactionDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarrotTransactionDTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'sender_id')
  final int? senderId;
  @override
  @JsonKey(name: 'receiver_id')
  final int receiverId;
  @override
  final int amount;
  @override
  final String? description;
  @override
  @JsonKey(name: 'comment_id')
  final int? commentId;
  @override
  @JsonKey(name: 'article_id')
  final int? articleId;
  @override
  @JsonKey(name: 'create_time')
  final String createTime;
  @override
  final String type;

  @override
  String toString() {
    return 'CarrotTransactionDTO(id: $id, senderId: $senderId, receiverId: $receiverId, amount: $amount, description: $description, commentId: $commentId, articleId: $articleId, createTime: $createTime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarrotTransactionDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.articleId, articleId) ||
                other.articleId == articleId) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderId, receiverId, amount,
      description, commentId, articleId, createTime, type);

  /// Create a copy of CarrotTransactionDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarrotTransactionDTOImplCopyWith<_$CarrotTransactionDTOImpl>
      get copyWith =>
          __$$CarrotTransactionDTOImplCopyWithImpl<_$CarrotTransactionDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarrotTransactionDTOImplToJson(
      this,
    );
  }
}

abstract class _CarrotTransactionDTO implements CarrotTransactionDTO {
  const factory _CarrotTransactionDTO(
      {required final int id,
      @JsonKey(name: 'sender_id') final int? senderId,
      @JsonKey(name: 'receiver_id') required final int receiverId,
      required final int amount,
      final String? description,
      @JsonKey(name: 'comment_id') final int? commentId,
      @JsonKey(name: 'article_id') final int? articleId,
      @JsonKey(name: 'create_time') required final String createTime,
      required final String type}) = _$CarrotTransactionDTOImpl;

  factory _CarrotTransactionDTO.fromJson(Map<String, dynamic> json) =
      _$CarrotTransactionDTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'sender_id')
  int? get senderId;
  @override
  @JsonKey(name: 'receiver_id')
  int get receiverId;
  @override
  int get amount;
  @override
  String? get description;
  @override
  @JsonKey(name: 'comment_id')
  int? get commentId;
  @override
  @JsonKey(name: 'article_id')
  int? get articleId;
  @override
  @JsonKey(name: 'create_time')
  String get createTime;
  @override
  String get type;

  /// Create a copy of CarrotTransactionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarrotTransactionDTOImplCopyWith<_$CarrotTransactionDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
