import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/payment_dto.dart';
import 'package:pacapaca/services/payment_service.dart';

part 'payment_provider.g.dart';

@riverpod
class Payments extends _$Payments {
  final _paymentService = GetIt.instance<PaymentService>();

  @override
  Future<List<PaymentDTO>> build() async {
    // 초기 결제 내역 로드
    final payments = await _paymentService.getUserPayments();
    return payments ?? [];
  }

  /// 결제 검증하기
  Future<PaymentDTO?> verifyPayment({
    required String productId,
    required String orderId,
    required String purchaseToken,
  }) async {
    final request = RequestVerifyPayment(
      productId: productId,
      orderId: orderId,
      purchaseToken: purchaseToken,
    );

    final payment = await _paymentService.verifyPayment(request);
    if (payment != null) {
      // 결제 내역 업데이트
      refreshPayments();
    }
    return payment;
  }

  /// 결제 내역 새로고침
  Future<void> refreshPayments() async {
    state = const AsyncValue.loading();
    try {
      final payments = await _paymentService.getUserPayments();
      state = AsyncValue.data(payments ?? []);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
