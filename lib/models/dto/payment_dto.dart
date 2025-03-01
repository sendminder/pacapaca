import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_dto.freezed.dart';
part 'payment_dto.g.dart';

// 결제 검증 요청 모델
@freezed
class RequestVerifyPayment with _$RequestVerifyPayment {
  const factory RequestVerifyPayment({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'purchase_token') required String purchaseToken,
    required String platform,
  }) = _RequestVerifyPayment;

  factory RequestVerifyPayment.fromJson(Map<String, dynamic> json) =>
      _$RequestVerifyPaymentFromJson(json);
}

// 결제 목록 요청 모델
@freezed
class RequestListPayments with _$RequestListPayments {
  const factory RequestListPayments({
    int? limit,
    @JsonKey(name: 'paging_key') int? pagingKey,
  }) = _RequestListPayments;

  factory RequestListPayments.fromJson(Map<String, dynamic> json) =>
      _$RequestListPaymentsFromJson(json);
}

// 결제 DTO 모델
@freezed
class PaymentDTO with _$PaymentDTO {
  const factory PaymentDTO({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'order_id') required String orderId,
    required String platform,
    required int price,
    @JsonKey(name: 'carrot_amount') required int carrotAmount,
    required String status,
    @JsonKey(name: 'payment_time') String? paymentTime,
    @JsonKey(name: 'create_time') required String createTime,
  }) = _PaymentDTO;

  factory PaymentDTO.fromJson(Map<String, dynamic> json) =>
      _$PaymentDTOFromJson(json);
}

// 결제 응답 모델
@freezed
class ResponsePayment with _$ResponsePayment {
  const factory ResponsePayment({
    required PaymentDTO payment,
  }) = _ResponsePayment;

  factory ResponsePayment.fromJson(Map<String, dynamic> json) =>
      _$ResponsePaymentFromJson(json);
}

// 결제 목록 응답 모델
@freezed
class ResponsePaymentList with _$ResponsePaymentList {
  const factory ResponsePaymentList({
    required List<PaymentDTO> payments,
  }) = _ResponsePaymentList;

  factory ResponsePaymentList.fromJson(Map<String, dynamic> json) =>
      _$ResponsePaymentListFromJson(json);
}
