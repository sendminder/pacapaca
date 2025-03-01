import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/payment_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'dart:convert';
import 'package:pacapaca/services/dio_service.dart';

class PaymentService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  /// 결제 검증하기
  Future<PaymentDTO?> verifyPayment(RequestVerifyPayment request) async {
    try {
      final response = await _dio.post(
        '/v1/payments/verify',
        data: jsonEncode(request.toJson()),
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final paymentResponse =
            ResponsePayment.fromJson(responseRest.response!);
        return paymentResponse.payment;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('verify payment', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 사용자 결제 내역 조회하기
  Future<List<PaymentDTO>?> getUserPayments(
      {int? limit, int? pagingKey}) async {
    try {
      Map<String, dynamic> queryParams = {};
      if (limit != null) queryParams['limit'] = limit.toString();
      if (pagingKey != null) queryParams['paging_key'] = pagingKey.toString();

      final response = await _dio.get(
        '/v1/payments',
        queryParameters: queryParams,
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final paymentsResponse =
            ResponsePaymentList.fromJson(responseRest.response!);
        return paymentsResponse.payments;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get user payments', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
