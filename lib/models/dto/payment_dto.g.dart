// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestVerifyPaymentImpl _$$RequestVerifyPaymentImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestVerifyPaymentImpl(
      productId: json['product_id'] as String,
      orderId: json['order_id'] as String,
      purchaseToken: json['purchase_token'] as String,
    );

Map<String, dynamic> _$$RequestVerifyPaymentImplToJson(
        _$RequestVerifyPaymentImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'order_id': instance.orderId,
      'purchase_token': instance.purchaseToken,
    };

_$RequestListPaymentsImpl _$$RequestListPaymentsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListPaymentsImpl(
      limit: (json['limit'] as num?)?.toInt(),
      pagingKey: (json['paging_key'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RequestListPaymentsImplToJson(
        _$RequestListPaymentsImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'paging_key': instance.pagingKey,
    };

_$PaymentDTOImpl _$$PaymentDTOImplFromJson(Map<String, dynamic> json) =>
    _$PaymentDTOImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      productId: json['product_id'] as String,
      orderId: json['order_id'] as String,
      platform: json['platform'] as String,
      price: (json['price'] as num).toInt(),
      carrotAmount: (json['carrot_amount'] as num).toInt(),
      status: json['status'] as String,
      paymentTime: json['payment_time'] as String?,
      createTime: json['create_time'] as String,
    );

Map<String, dynamic> _$$PaymentDTOImplToJson(_$PaymentDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'product_id': instance.productId,
      'order_id': instance.orderId,
      'platform': instance.platform,
      'price': instance.price,
      'carrot_amount': instance.carrotAmount,
      'status': instance.status,
      'payment_time': instance.paymentTime,
      'create_time': instance.createTime,
    };

_$ResponsePaymentImpl _$$ResponsePaymentImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponsePaymentImpl(
      payment: PaymentDTO.fromJson(json['payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponsePaymentImplToJson(
        _$ResponsePaymentImpl instance) =>
    <String, dynamic>{
      'payment': instance.payment,
    };

_$ResponsePaymentListImpl _$$ResponsePaymentListImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponsePaymentListImpl(
      payments: (json['payments'] as List<dynamic>)
          .map((e) => PaymentDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResponsePaymentListImplToJson(
        _$ResponsePaymentListImpl instance) =>
    <String, dynamic>{
      'payments': instance.payments,
    };
