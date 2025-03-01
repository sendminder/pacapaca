// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestVerifyPayment _$RequestVerifyPaymentFromJson(Map<String, dynamic> json) {
  return _RequestVerifyPayment.fromJson(json);
}

/// @nodoc
mixin _$RequestVerifyPayment {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_token')
  String get purchaseToken => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;

  /// Serializes this RequestVerifyPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestVerifyPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestVerifyPaymentCopyWith<RequestVerifyPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestVerifyPaymentCopyWith<$Res> {
  factory $RequestVerifyPaymentCopyWith(RequestVerifyPayment value,
          $Res Function(RequestVerifyPayment) then) =
      _$RequestVerifyPaymentCopyWithImpl<$Res, RequestVerifyPayment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'purchase_token') String purchaseToken,
      String platform});
}

/// @nodoc
class _$RequestVerifyPaymentCopyWithImpl<$Res,
        $Val extends RequestVerifyPayment>
    implements $RequestVerifyPaymentCopyWith<$Res> {
  _$RequestVerifyPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestVerifyPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? orderId = null,
    Object? purchaseToken = null,
    Object? platform = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseToken: null == purchaseToken
          ? _value.purchaseToken
          : purchaseToken // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestVerifyPaymentImplCopyWith<$Res>
    implements $RequestVerifyPaymentCopyWith<$Res> {
  factory _$$RequestVerifyPaymentImplCopyWith(_$RequestVerifyPaymentImpl value,
          $Res Function(_$RequestVerifyPaymentImpl) then) =
      __$$RequestVerifyPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'purchase_token') String purchaseToken,
      String platform});
}

/// @nodoc
class __$$RequestVerifyPaymentImplCopyWithImpl<$Res>
    extends _$RequestVerifyPaymentCopyWithImpl<$Res, _$RequestVerifyPaymentImpl>
    implements _$$RequestVerifyPaymentImplCopyWith<$Res> {
  __$$RequestVerifyPaymentImplCopyWithImpl(_$RequestVerifyPaymentImpl _value,
      $Res Function(_$RequestVerifyPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestVerifyPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? orderId = null,
    Object? purchaseToken = null,
    Object? platform = null,
  }) {
    return _then(_$RequestVerifyPaymentImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseToken: null == purchaseToken
          ? _value.purchaseToken
          : purchaseToken // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestVerifyPaymentImpl implements _RequestVerifyPayment {
  const _$RequestVerifyPaymentImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'purchase_token') required this.purchaseToken,
      required this.platform});

  factory _$RequestVerifyPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestVerifyPaymentImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'purchase_token')
  final String purchaseToken;
  @override
  final String platform;

  @override
  String toString() {
    return 'RequestVerifyPayment(productId: $productId, orderId: $orderId, purchaseToken: $purchaseToken, platform: $platform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestVerifyPaymentImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.purchaseToken, purchaseToken) ||
                other.purchaseToken == purchaseToken) &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, orderId, purchaseToken, platform);

  /// Create a copy of RequestVerifyPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestVerifyPaymentImplCopyWith<_$RequestVerifyPaymentImpl>
      get copyWith =>
          __$$RequestVerifyPaymentImplCopyWithImpl<_$RequestVerifyPaymentImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestVerifyPaymentImplToJson(
      this,
    );
  }
}

abstract class _RequestVerifyPayment implements RequestVerifyPayment {
  const factory _RequestVerifyPayment(
      {@JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'order_id') required final String orderId,
      @JsonKey(name: 'purchase_token') required final String purchaseToken,
      required final String platform}) = _$RequestVerifyPaymentImpl;

  factory _RequestVerifyPayment.fromJson(Map<String, dynamic> json) =
      _$RequestVerifyPaymentImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'purchase_token')
  String get purchaseToken;
  @override
  String get platform;

  /// Create a copy of RequestVerifyPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestVerifyPaymentImplCopyWith<_$RequestVerifyPaymentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestListPayments _$RequestListPaymentsFromJson(Map<String, dynamic> json) {
  return _RequestListPayments.fromJson(json);
}

/// @nodoc
mixin _$RequestListPayments {
  int? get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'paging_key')
  int? get pagingKey => throw _privateConstructorUsedError;

  /// Serializes this RequestListPayments to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestListPayments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestListPaymentsCopyWith<RequestListPayments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestListPaymentsCopyWith<$Res> {
  factory $RequestListPaymentsCopyWith(
          RequestListPayments value, $Res Function(RequestListPayments) then) =
      _$RequestListPaymentsCopyWithImpl<$Res, RequestListPayments>;
  @useResult
  $Res call({int? limit, @JsonKey(name: 'paging_key') int? pagingKey});
}

/// @nodoc
class _$RequestListPaymentsCopyWithImpl<$Res, $Val extends RequestListPayments>
    implements $RequestListPaymentsCopyWith<$Res> {
  _$RequestListPaymentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestListPayments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? pagingKey = freezed,
  }) {
    return _then(_value.copyWith(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestListPaymentsImplCopyWith<$Res>
    implements $RequestListPaymentsCopyWith<$Res> {
  factory _$$RequestListPaymentsImplCopyWith(_$RequestListPaymentsImpl value,
          $Res Function(_$RequestListPaymentsImpl) then) =
      __$$RequestListPaymentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? limit, @JsonKey(name: 'paging_key') int? pagingKey});
}

/// @nodoc
class __$$RequestListPaymentsImplCopyWithImpl<$Res>
    extends _$RequestListPaymentsCopyWithImpl<$Res, _$RequestListPaymentsImpl>
    implements _$$RequestListPaymentsImplCopyWith<$Res> {
  __$$RequestListPaymentsImplCopyWithImpl(_$RequestListPaymentsImpl _value,
      $Res Function(_$RequestListPaymentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestListPayments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? pagingKey = freezed,
  }) {
    return _then(_$RequestListPaymentsImpl(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      pagingKey: freezed == pagingKey
          ? _value.pagingKey
          : pagingKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestListPaymentsImpl implements _RequestListPayments {
  const _$RequestListPaymentsImpl(
      {this.limit, @JsonKey(name: 'paging_key') this.pagingKey});

  factory _$RequestListPaymentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestListPaymentsImplFromJson(json);

  @override
  final int? limit;
  @override
  @JsonKey(name: 'paging_key')
  final int? pagingKey;

  @override
  String toString() {
    return 'RequestListPayments(limit: $limit, pagingKey: $pagingKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestListPaymentsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.pagingKey, pagingKey) ||
                other.pagingKey == pagingKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, pagingKey);

  /// Create a copy of RequestListPayments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestListPaymentsImplCopyWith<_$RequestListPaymentsImpl> get copyWith =>
      __$$RequestListPaymentsImplCopyWithImpl<_$RequestListPaymentsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestListPaymentsImplToJson(
      this,
    );
  }
}

abstract class _RequestListPayments implements RequestListPayments {
  const factory _RequestListPayments(
          {final int? limit,
          @JsonKey(name: 'paging_key') final int? pagingKey}) =
      _$RequestListPaymentsImpl;

  factory _RequestListPayments.fromJson(Map<String, dynamic> json) =
      _$RequestListPaymentsImpl.fromJson;

  @override
  int? get limit;
  @override
  @JsonKey(name: 'paging_key')
  int? get pagingKey;

  /// Create a copy of RequestListPayments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestListPaymentsImplCopyWith<_$RequestListPaymentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentDTO _$PaymentDTOFromJson(Map<String, dynamic> json) {
  return _PaymentDTO.fromJson(json);
}

/// @nodoc
mixin _$PaymentDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'carrot_amount')
  int get carrotAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_time')
  String? get paymentTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  String get createTime => throw _privateConstructorUsedError;

  /// Serializes this PaymentDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentDTOCopyWith<PaymentDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDTOCopyWith<$Res> {
  factory $PaymentDTOCopyWith(
          PaymentDTO value, $Res Function(PaymentDTO) then) =
      _$PaymentDTOCopyWithImpl<$Res, PaymentDTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'order_id') String orderId,
      String platform,
      int price,
      @JsonKey(name: 'carrot_amount') int carrotAmount,
      String status,
      @JsonKey(name: 'payment_time') String? paymentTime,
      @JsonKey(name: 'create_time') String createTime});
}

/// @nodoc
class _$PaymentDTOCopyWithImpl<$Res, $Val extends PaymentDTO>
    implements $PaymentDTOCopyWith<$Res> {
  _$PaymentDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? productId = null,
    Object? orderId = null,
    Object? platform = null,
    Object? price = null,
    Object? carrotAmount = null,
    Object? status = null,
    Object? paymentTime = freezed,
    Object? createTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      carrotAmount: null == carrotAmount
          ? _value.carrotAmount
          : carrotAmount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTime: freezed == paymentTime
          ? _value.paymentTime
          : paymentTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentDTOImplCopyWith<$Res>
    implements $PaymentDTOCopyWith<$Res> {
  factory _$$PaymentDTOImplCopyWith(
          _$PaymentDTOImpl value, $Res Function(_$PaymentDTOImpl) then) =
      __$$PaymentDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'order_id') String orderId,
      String platform,
      int price,
      @JsonKey(name: 'carrot_amount') int carrotAmount,
      String status,
      @JsonKey(name: 'payment_time') String? paymentTime,
      @JsonKey(name: 'create_time') String createTime});
}

/// @nodoc
class __$$PaymentDTOImplCopyWithImpl<$Res>
    extends _$PaymentDTOCopyWithImpl<$Res, _$PaymentDTOImpl>
    implements _$$PaymentDTOImplCopyWith<$Res> {
  __$$PaymentDTOImplCopyWithImpl(
      _$PaymentDTOImpl _value, $Res Function(_$PaymentDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? productId = null,
    Object? orderId = null,
    Object? platform = null,
    Object? price = null,
    Object? carrotAmount = null,
    Object? status = null,
    Object? paymentTime = freezed,
    Object? createTime = null,
  }) {
    return _then(_$PaymentDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      carrotAmount: null == carrotAmount
          ? _value.carrotAmount
          : carrotAmount // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTime: freezed == paymentTime
          ? _value.paymentTime
          : paymentTime // ignore: cast_nullable_to_non_nullable
              as String?,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentDTOImpl implements _PaymentDTO {
  const _$PaymentDTOImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'order_id') required this.orderId,
      required this.platform,
      required this.price,
      @JsonKey(name: 'carrot_amount') required this.carrotAmount,
      required this.status,
      @JsonKey(name: 'payment_time') this.paymentTime,
      @JsonKey(name: 'create_time') required this.createTime});

  factory _$PaymentDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  final String platform;
  @override
  final int price;
  @override
  @JsonKey(name: 'carrot_amount')
  final int carrotAmount;
  @override
  final String status;
  @override
  @JsonKey(name: 'payment_time')
  final String? paymentTime;
  @override
  @JsonKey(name: 'create_time')
  final String createTime;

  @override
  String toString() {
    return 'PaymentDTO(id: $id, userId: $userId, productId: $productId, orderId: $orderId, platform: $platform, price: $price, carrotAmount: $carrotAmount, status: $status, paymentTime: $paymentTime, createTime: $createTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.carrotAmount, carrotAmount) ||
                other.carrotAmount == carrotAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentTime, paymentTime) ||
                other.paymentTime == paymentTime) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, productId, orderId,
      platform, price, carrotAmount, status, paymentTime, createTime);

  /// Create a copy of PaymentDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDTOImplCopyWith<_$PaymentDTOImpl> get copyWith =>
      __$$PaymentDTOImplCopyWithImpl<_$PaymentDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDTOImplToJson(
      this,
    );
  }
}

abstract class _PaymentDTO implements PaymentDTO {
  const factory _PaymentDTO(
          {required final int id,
          @JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'product_id') required final String productId,
          @JsonKey(name: 'order_id') required final String orderId,
          required final String platform,
          required final int price,
          @JsonKey(name: 'carrot_amount') required final int carrotAmount,
          required final String status,
          @JsonKey(name: 'payment_time') final String? paymentTime,
          @JsonKey(name: 'create_time') required final String createTime}) =
      _$PaymentDTOImpl;

  factory _PaymentDTO.fromJson(Map<String, dynamic> json) =
      _$PaymentDTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  String get platform;
  @override
  int get price;
  @override
  @JsonKey(name: 'carrot_amount')
  int get carrotAmount;
  @override
  String get status;
  @override
  @JsonKey(name: 'payment_time')
  String? get paymentTime;
  @override
  @JsonKey(name: 'create_time')
  String get createTime;

  /// Create a copy of PaymentDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentDTOImplCopyWith<_$PaymentDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponsePayment _$ResponsePaymentFromJson(Map<String, dynamic> json) {
  return _ResponsePayment.fromJson(json);
}

/// @nodoc
mixin _$ResponsePayment {
  PaymentDTO get payment => throw _privateConstructorUsedError;

  /// Serializes this ResponsePayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponsePayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponsePaymentCopyWith<ResponsePayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponsePaymentCopyWith<$Res> {
  factory $ResponsePaymentCopyWith(
          ResponsePayment value, $Res Function(ResponsePayment) then) =
      _$ResponsePaymentCopyWithImpl<$Res, ResponsePayment>;
  @useResult
  $Res call({PaymentDTO payment});

  $PaymentDTOCopyWith<$Res> get payment;
}

/// @nodoc
class _$ResponsePaymentCopyWithImpl<$Res, $Val extends ResponsePayment>
    implements $ResponsePaymentCopyWith<$Res> {
  _$ResponsePaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponsePayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
  }) {
    return _then(_value.copyWith(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentDTO,
    ) as $Val);
  }

  /// Create a copy of ResponsePayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentDTOCopyWith<$Res> get payment {
    return $PaymentDTOCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponsePaymentImplCopyWith<$Res>
    implements $ResponsePaymentCopyWith<$Res> {
  factory _$$ResponsePaymentImplCopyWith(_$ResponsePaymentImpl value,
          $Res Function(_$ResponsePaymentImpl) then) =
      __$$ResponsePaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentDTO payment});

  @override
  $PaymentDTOCopyWith<$Res> get payment;
}

/// @nodoc
class __$$ResponsePaymentImplCopyWithImpl<$Res>
    extends _$ResponsePaymentCopyWithImpl<$Res, _$ResponsePaymentImpl>
    implements _$$ResponsePaymentImplCopyWith<$Res> {
  __$$ResponsePaymentImplCopyWithImpl(
      _$ResponsePaymentImpl _value, $Res Function(_$ResponsePaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponsePayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment = null,
  }) {
    return _then(_$ResponsePaymentImpl(
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponsePaymentImpl implements _ResponsePayment {
  const _$ResponsePaymentImpl({required this.payment});

  factory _$ResponsePaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponsePaymentImplFromJson(json);

  @override
  final PaymentDTO payment;

  @override
  String toString() {
    return 'ResponsePayment(payment: $payment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponsePaymentImpl &&
            (identical(other.payment, payment) || other.payment == payment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, payment);

  /// Create a copy of ResponsePayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponsePaymentImplCopyWith<_$ResponsePaymentImpl> get copyWith =>
      __$$ResponsePaymentImplCopyWithImpl<_$ResponsePaymentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponsePaymentImplToJson(
      this,
    );
  }
}

abstract class _ResponsePayment implements ResponsePayment {
  const factory _ResponsePayment({required final PaymentDTO payment}) =
      _$ResponsePaymentImpl;

  factory _ResponsePayment.fromJson(Map<String, dynamic> json) =
      _$ResponsePaymentImpl.fromJson;

  @override
  PaymentDTO get payment;

  /// Create a copy of ResponsePayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponsePaymentImplCopyWith<_$ResponsePaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponsePaymentList _$ResponsePaymentListFromJson(Map<String, dynamic> json) {
  return _ResponsePaymentList.fromJson(json);
}

/// @nodoc
mixin _$ResponsePaymentList {
  List<PaymentDTO> get payments => throw _privateConstructorUsedError;

  /// Serializes this ResponsePaymentList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponsePaymentList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponsePaymentListCopyWith<ResponsePaymentList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponsePaymentListCopyWith<$Res> {
  factory $ResponsePaymentListCopyWith(
          ResponsePaymentList value, $Res Function(ResponsePaymentList) then) =
      _$ResponsePaymentListCopyWithImpl<$Res, ResponsePaymentList>;
  @useResult
  $Res call({List<PaymentDTO> payments});
}

/// @nodoc
class _$ResponsePaymentListCopyWithImpl<$Res, $Val extends ResponsePaymentList>
    implements $ResponsePaymentListCopyWith<$Res> {
  _$ResponsePaymentListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponsePaymentList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payments = null,
  }) {
    return _then(_value.copyWith(
      payments: null == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponsePaymentListImplCopyWith<$Res>
    implements $ResponsePaymentListCopyWith<$Res> {
  factory _$$ResponsePaymentListImplCopyWith(_$ResponsePaymentListImpl value,
          $Res Function(_$ResponsePaymentListImpl) then) =
      __$$ResponsePaymentListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PaymentDTO> payments});
}

/// @nodoc
class __$$ResponsePaymentListImplCopyWithImpl<$Res>
    extends _$ResponsePaymentListCopyWithImpl<$Res, _$ResponsePaymentListImpl>
    implements _$$ResponsePaymentListImplCopyWith<$Res> {
  __$$ResponsePaymentListImplCopyWithImpl(_$ResponsePaymentListImpl _value,
      $Res Function(_$ResponsePaymentListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponsePaymentList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payments = null,
  }) {
    return _then(_$ResponsePaymentListImpl(
      payments: null == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponsePaymentListImpl implements _ResponsePaymentList {
  const _$ResponsePaymentListImpl({required final List<PaymentDTO> payments})
      : _payments = payments;

  factory _$ResponsePaymentListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponsePaymentListImplFromJson(json);

  final List<PaymentDTO> _payments;
  @override
  List<PaymentDTO> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  @override
  String toString() {
    return 'ResponsePaymentList(payments: $payments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponsePaymentListImpl &&
            const DeepCollectionEquality().equals(other._payments, _payments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payments));

  /// Create a copy of ResponsePaymentList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponsePaymentListImplCopyWith<_$ResponsePaymentListImpl> get copyWith =>
      __$$ResponsePaymentListImplCopyWithImpl<_$ResponsePaymentListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponsePaymentListImplToJson(
      this,
    );
  }
}

abstract class _ResponsePaymentList implements ResponsePaymentList {
  const factory _ResponsePaymentList(
      {required final List<PaymentDTO> payments}) = _$ResponsePaymentListImpl;

  factory _ResponsePaymentList.fromJson(Map<String, dynamic> json) =
      _$ResponsePaymentListImpl.fromJson;

  @override
  List<PaymentDTO> get payments;

  /// Create a copy of ResponsePaymentList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponsePaymentListImplCopyWith<_$ResponsePaymentListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
