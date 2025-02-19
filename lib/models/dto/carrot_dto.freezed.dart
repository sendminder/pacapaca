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

RequestListTransactions _$RequestListTransactionsFromJson(
    Map<String, dynamic> json) {
  return _RequestListTransactions.fromJson(json);
}

/// @nodoc
mixin _$RequestListTransactions {
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'paging_key')
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
  $Res call({int limit, @JsonKey(name: 'paging_key') int? pagingKey});
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
  $Res call({int limit, @JsonKey(name: 'paging_key') int? pagingKey});
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
  const _$RequestListTransactionsImpl(
      {required this.limit, @JsonKey(name: 'paging_key') this.pagingKey});

  factory _$RequestListTransactionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestListTransactionsImplFromJson(json);

  @override
  final int limit;
  @override
  @JsonKey(name: 'paging_key')
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
          @JsonKey(name: 'paging_key') final int? pagingKey}) =
      _$RequestListTransactionsImpl;

  factory _RequestListTransactions.fromJson(Map<String, dynamic> json) =
      _$RequestListTransactionsImpl.fromJson;

  @override
  int get limit;
  @override
  @JsonKey(name: 'paging_key')
  int? get pagingKey;

  /// Create a copy of RequestListTransactions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestListTransactionsImplCopyWith<_$RequestListTransactionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CarrotTransactionDTO _$CarrotTransactionDTOFromJson(Map<String, dynamic> json) {
  return _CarrotTransactionDTO.fromJson(json);
}

/// @nodoc
mixin _$CarrotTransactionDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_id')
  int get senderId => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'sender_id') int senderId,
      @JsonKey(name: 'receiver_id') int receiverId,
      int amount,
      String? description,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId,
      @JsonKey(name: 'create_time') String createTime});
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
    Object? senderId = null,
    Object? receiverId = null,
    Object? amount = null,
    Object? description = freezed,
    Object? commentId = freezed,
    Object? articleId = freezed,
    Object? createTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
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
      @JsonKey(name: 'sender_id') int senderId,
      @JsonKey(name: 'receiver_id') int receiverId,
      int amount,
      String? description,
      @JsonKey(name: 'comment_id') int? commentId,
      @JsonKey(name: 'article_id') int? articleId,
      @JsonKey(name: 'create_time') String createTime});
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
    Object? senderId = null,
    Object? receiverId = null,
    Object? amount = null,
    Object? description = freezed,
    Object? commentId = freezed,
    Object? articleId = freezed,
    Object? createTime = null,
  }) {
    return _then(_$CarrotTransactionDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarrotTransactionDTOImpl implements _CarrotTransactionDTO {
  const _$CarrotTransactionDTOImpl(
      {required this.id,
      @JsonKey(name: 'sender_id') required this.senderId,
      @JsonKey(name: 'receiver_id') required this.receiverId,
      required this.amount,
      this.description,
      @JsonKey(name: 'comment_id') this.commentId,
      @JsonKey(name: 'article_id') this.articleId,
      @JsonKey(name: 'create_time') required this.createTime});

  factory _$CarrotTransactionDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarrotTransactionDTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'sender_id')
  final int senderId;
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
  String toString() {
    return 'CarrotTransactionDTO(id: $id, senderId: $senderId, receiverId: $receiverId, amount: $amount, description: $description, commentId: $commentId, articleId: $articleId, createTime: $createTime)';
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
                other.createTime == createTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderId, receiverId, amount,
      description, commentId, articleId, createTime);

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
          @JsonKey(name: 'sender_id') required final int senderId,
          @JsonKey(name: 'receiver_id') required final int receiverId,
          required final int amount,
          final String? description,
          @JsonKey(name: 'comment_id') final int? commentId,
          @JsonKey(name: 'article_id') final int? articleId,
          @JsonKey(name: 'create_time') required final String createTime}) =
      _$CarrotTransactionDTOImpl;

  factory _CarrotTransactionDTO.fromJson(Map<String, dynamic> json) =
      _$CarrotTransactionDTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'sender_id')
  int get senderId;
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

  /// Create a copy of CarrotTransactionDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarrotTransactionDTOImplCopyWith<_$CarrotTransactionDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CarrotBalanceDTO _$CarrotBalanceDTOFromJson(Map<String, dynamic> json) {
  return _CarrotBalanceDTO.fromJson(json);
}

/// @nodoc
mixin _$CarrotBalanceDTO {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;

  /// Serializes this CarrotBalanceDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarrotBalanceDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarrotBalanceDTOCopyWith<CarrotBalanceDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarrotBalanceDTOCopyWith<$Res> {
  factory $CarrotBalanceDTOCopyWith(
          CarrotBalanceDTO value, $Res Function(CarrotBalanceDTO) then) =
      _$CarrotBalanceDTOCopyWithImpl<$Res, CarrotBalanceDTO>;
  @useResult
  $Res call({@JsonKey(name: 'user_id') int userId, int balance});
}

/// @nodoc
class _$CarrotBalanceDTOCopyWithImpl<$Res, $Val extends CarrotBalanceDTO>
    implements $CarrotBalanceDTOCopyWith<$Res> {
  _$CarrotBalanceDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarrotBalanceDTO
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
abstract class _$$CarrotBalanceDTOImplCopyWith<$Res>
    implements $CarrotBalanceDTOCopyWith<$Res> {
  factory _$$CarrotBalanceDTOImplCopyWith(_$CarrotBalanceDTOImpl value,
          $Res Function(_$CarrotBalanceDTOImpl) then) =
      __$$CarrotBalanceDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user_id') int userId, int balance});
}

/// @nodoc
class __$$CarrotBalanceDTOImplCopyWithImpl<$Res>
    extends _$CarrotBalanceDTOCopyWithImpl<$Res, _$CarrotBalanceDTOImpl>
    implements _$$CarrotBalanceDTOImplCopyWith<$Res> {
  __$$CarrotBalanceDTOImplCopyWithImpl(_$CarrotBalanceDTOImpl _value,
      $Res Function(_$CarrotBalanceDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarrotBalanceDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
  }) {
    return _then(_$CarrotBalanceDTOImpl(
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
class _$CarrotBalanceDTOImpl implements _CarrotBalanceDTO {
  const _$CarrotBalanceDTOImpl(
      {@JsonKey(name: 'user_id') required this.userId, required this.balance});

  factory _$CarrotBalanceDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarrotBalanceDTOImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final int balance;

  @override
  String toString() {
    return 'CarrotBalanceDTO(userId: $userId, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarrotBalanceDTOImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, balance);

  /// Create a copy of CarrotBalanceDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarrotBalanceDTOImplCopyWith<_$CarrotBalanceDTOImpl> get copyWith =>
      __$$CarrotBalanceDTOImplCopyWithImpl<_$CarrotBalanceDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarrotBalanceDTOImplToJson(
      this,
    );
  }
}

abstract class _CarrotBalanceDTO implements CarrotBalanceDTO {
  const factory _CarrotBalanceDTO(
      {@JsonKey(name: 'user_id') required final int userId,
      required final int balance}) = _$CarrotBalanceDTOImpl;

  factory _CarrotBalanceDTO.fromJson(Map<String, dynamic> json) =
      _$CarrotBalanceDTOImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  int get balance;

  /// Create a copy of CarrotBalanceDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarrotBalanceDTOImplCopyWith<_$CarrotBalanceDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CarrotRankingDTO _$CarrotRankingDTOFromJson(Map<String, dynamic> json) {
  return _CarrotRankingDTO.fromJson(json);
}

/// @nodoc
mixin _$CarrotRankingDTO {
  @JsonKey(name: 'top_receivers')
  List<CarrotRankingUserDTO> get topReceivers =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'top_senders')
  List<CarrotRankingUserDTO> get topSenders =>
      throw _privateConstructorUsedError;

  /// Serializes this CarrotRankingDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarrotRankingDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarrotRankingDTOCopyWith<CarrotRankingDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarrotRankingDTOCopyWith<$Res> {
  factory $CarrotRankingDTOCopyWith(
          CarrotRankingDTO value, $Res Function(CarrotRankingDTO) then) =
      _$CarrotRankingDTOCopyWithImpl<$Res, CarrotRankingDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'top_receivers') List<CarrotRankingUserDTO> topReceivers,
      @JsonKey(name: 'top_senders') List<CarrotRankingUserDTO> topSenders});
}

/// @nodoc
class _$CarrotRankingDTOCopyWithImpl<$Res, $Val extends CarrotRankingDTO>
    implements $CarrotRankingDTOCopyWith<$Res> {
  _$CarrotRankingDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarrotRankingDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topReceivers = null,
    Object? topSenders = null,
  }) {
    return _then(_value.copyWith(
      topReceivers: null == topReceivers
          ? _value.topReceivers
          : topReceivers // ignore: cast_nullable_to_non_nullable
              as List<CarrotRankingUserDTO>,
      topSenders: null == topSenders
          ? _value.topSenders
          : topSenders // ignore: cast_nullable_to_non_nullable
              as List<CarrotRankingUserDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarrotRankingDTOImplCopyWith<$Res>
    implements $CarrotRankingDTOCopyWith<$Res> {
  factory _$$CarrotRankingDTOImplCopyWith(_$CarrotRankingDTOImpl value,
          $Res Function(_$CarrotRankingDTOImpl) then) =
      __$$CarrotRankingDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'top_receivers') List<CarrotRankingUserDTO> topReceivers,
      @JsonKey(name: 'top_senders') List<CarrotRankingUserDTO> topSenders});
}

/// @nodoc
class __$$CarrotRankingDTOImplCopyWithImpl<$Res>
    extends _$CarrotRankingDTOCopyWithImpl<$Res, _$CarrotRankingDTOImpl>
    implements _$$CarrotRankingDTOImplCopyWith<$Res> {
  __$$CarrotRankingDTOImplCopyWithImpl(_$CarrotRankingDTOImpl _value,
      $Res Function(_$CarrotRankingDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarrotRankingDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topReceivers = null,
    Object? topSenders = null,
  }) {
    return _then(_$CarrotRankingDTOImpl(
      topReceivers: null == topReceivers
          ? _value._topReceivers
          : topReceivers // ignore: cast_nullable_to_non_nullable
              as List<CarrotRankingUserDTO>,
      topSenders: null == topSenders
          ? _value._topSenders
          : topSenders // ignore: cast_nullable_to_non_nullable
              as List<CarrotRankingUserDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarrotRankingDTOImpl implements _CarrotRankingDTO {
  const _$CarrotRankingDTOImpl(
      {@JsonKey(name: 'top_receivers')
      required final List<CarrotRankingUserDTO> topReceivers,
      @JsonKey(name: 'top_senders')
      required final List<CarrotRankingUserDTO> topSenders})
      : _topReceivers = topReceivers,
        _topSenders = topSenders;

  factory _$CarrotRankingDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarrotRankingDTOImplFromJson(json);

  final List<CarrotRankingUserDTO> _topReceivers;
  @override
  @JsonKey(name: 'top_receivers')
  List<CarrotRankingUserDTO> get topReceivers {
    if (_topReceivers is EqualUnmodifiableListView) return _topReceivers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topReceivers);
  }

  final List<CarrotRankingUserDTO> _topSenders;
  @override
  @JsonKey(name: 'top_senders')
  List<CarrotRankingUserDTO> get topSenders {
    if (_topSenders is EqualUnmodifiableListView) return _topSenders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topSenders);
  }

  @override
  String toString() {
    return 'CarrotRankingDTO(topReceivers: $topReceivers, topSenders: $topSenders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarrotRankingDTOImpl &&
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

  /// Create a copy of CarrotRankingDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarrotRankingDTOImplCopyWith<_$CarrotRankingDTOImpl> get copyWith =>
      __$$CarrotRankingDTOImplCopyWithImpl<_$CarrotRankingDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarrotRankingDTOImplToJson(
      this,
    );
  }
}

abstract class _CarrotRankingDTO implements CarrotRankingDTO {
  const factory _CarrotRankingDTO(
          {@JsonKey(name: 'top_receivers')
          required final List<CarrotRankingUserDTO> topReceivers,
          @JsonKey(name: 'top_senders')
          required final List<CarrotRankingUserDTO> topSenders}) =
      _$CarrotRankingDTOImpl;

  factory _CarrotRankingDTO.fromJson(Map<String, dynamic> json) =
      _$CarrotRankingDTOImpl.fromJson;

  @override
  @JsonKey(name: 'top_receivers')
  List<CarrotRankingUserDTO> get topReceivers;
  @override
  @JsonKey(name: 'top_senders')
  List<CarrotRankingUserDTO> get topSenders;

  /// Create a copy of CarrotRankingDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarrotRankingDTOImplCopyWith<_$CarrotRankingDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CarrotRankingUserDTO _$CarrotRankingUserDTOFromJson(Map<String, dynamic> json) {
  return _CarrotRankingUserDTO.fromJson(json);
}

/// @nodoc
mixin _$CarrotRankingUserDTO {
  int get userId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  /// Serializes this CarrotRankingUserDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarrotRankingUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarrotRankingUserDTOCopyWith<CarrotRankingUserDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarrotRankingUserDTOCopyWith<$Res> {
  factory $CarrotRankingUserDTOCopyWith(CarrotRankingUserDTO value,
          $Res Function(CarrotRankingUserDTO) then) =
      _$CarrotRankingUserDTOCopyWithImpl<$Res, CarrotRankingUserDTO>;
  @useResult
  $Res call({int userId, int amount});
}

/// @nodoc
class _$CarrotRankingUserDTOCopyWithImpl<$Res,
        $Val extends CarrotRankingUserDTO>
    implements $CarrotRankingUserDTOCopyWith<$Res> {
  _$CarrotRankingUserDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarrotRankingUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarrotRankingUserDTOImplCopyWith<$Res>
    implements $CarrotRankingUserDTOCopyWith<$Res> {
  factory _$$CarrotRankingUserDTOImplCopyWith(_$CarrotRankingUserDTOImpl value,
          $Res Function(_$CarrotRankingUserDTOImpl) then) =
      __$$CarrotRankingUserDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int amount});
}

/// @nodoc
class __$$CarrotRankingUserDTOImplCopyWithImpl<$Res>
    extends _$CarrotRankingUserDTOCopyWithImpl<$Res, _$CarrotRankingUserDTOImpl>
    implements _$$CarrotRankingUserDTOImplCopyWith<$Res> {
  __$$CarrotRankingUserDTOImplCopyWithImpl(_$CarrotRankingUserDTOImpl _value,
      $Res Function(_$CarrotRankingUserDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarrotRankingUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
  }) {
    return _then(_$CarrotRankingUserDTOImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarrotRankingUserDTOImpl implements _CarrotRankingUserDTO {
  const _$CarrotRankingUserDTOImpl(
      {required this.userId, required this.amount});

  factory _$CarrotRankingUserDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarrotRankingUserDTOImplFromJson(json);

  @override
  final int userId;
  @override
  final int amount;

  @override
  String toString() {
    return 'CarrotRankingUserDTO(userId: $userId, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarrotRankingUserDTOImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, amount);

  /// Create a copy of CarrotRankingUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarrotRankingUserDTOImplCopyWith<_$CarrotRankingUserDTOImpl>
      get copyWith =>
          __$$CarrotRankingUserDTOImplCopyWithImpl<_$CarrotRankingUserDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarrotRankingUserDTOImplToJson(
      this,
    );
  }
}

abstract class _CarrotRankingUserDTO implements CarrotRankingUserDTO {
  const factory _CarrotRankingUserDTO(
      {required final int userId,
      required final int amount}) = _$CarrotRankingUserDTOImpl;

  factory _CarrotRankingUserDTO.fromJson(Map<String, dynamic> json) =
      _$CarrotRankingUserDTOImpl.fromJson;

  @override
  int get userId;
  @override
  int get amount;

  /// Create a copy of CarrotRankingUserDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarrotRankingUserDTOImplCopyWith<_$CarrotRankingUserDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
