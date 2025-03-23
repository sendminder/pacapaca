import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/payment_dto.dart';
import 'package:pacapaca/models/dto/product_dto.dart';
import 'package:pacapaca/services/payment_service.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'dart:io' show Platform;

class InAppPurchaseService {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final PaymentService _paymentService = GetIt.instance<PaymentService>();
  final logger = GetIt.instance<Logger>();

  StreamSubscription<List<PurchaseDetails>>? _subscription;
  final StreamController<PaymentDTO?> _purchaseResultController =
      StreamController<PaymentDTO?>.broadcast();

  Stream<PaymentDTO?> get purchaseResultStream =>
      _purchaseResultController.stream;

  InAppPurchaseService() {
    _initInAppPurchase();
  }

  void _initInAppPurchase() {
    final purchaseUpdated = _inAppPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _listenToPurchaseUpdated,
      onDone: () {
        _subscription?.cancel();
      },
      onError: (error) {
        logger.e('인앱 결제 스트림 오류', error: error);
      },
    );
  }

  void _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // 결제 진행 중
        logger.i('결제 진행 중: ${purchaseDetails.productID}');
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        // 결제 완료 또는 복원됨
        logger.i('결제 완료: ${purchaseDetails.productID}');

        // 서버에 결제 검증 요청
        try {
          final payment = await _paymentService.verifyPayment(
            RequestVerifyPayment(
              productId: purchaseDetails.productID,
              orderId: purchaseDetails.purchaseID ?? '',
              purchaseToken: Platform.isAndroid
                  ? (purchaseDetails as GooglePlayPurchaseDetails)
                      .billingClientPurchase
                      .purchaseToken
                  : (purchaseDetails as AppStorePurchaseDetails)
                          .skPaymentTransaction
                          .transactionIdentifier ??
                      '',
            ),
          );

          // 결제 결과 스트림에 전달
          _purchaseResultController.add(payment);

          // 결제 완료 처리
          if (purchaseDetails.pendingCompletePurchase) {
            await _inAppPurchase.completePurchase(purchaseDetails);
          }
        } catch (e) {
          logger.e('결제 검증 오류', error: e);
          _purchaseResultController.add(null);
        }
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        // 결제 오류
        logger.e('결제 오류: ${purchaseDetails.error?.message}');
        _purchaseResultController.add(null);

        // 오류 처리
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      } else if (purchaseDetails.status == PurchaseStatus.canceled) {
        // 결제 취소
        logger.i('결제 취소: ${purchaseDetails.productID}');
        _purchaseResultController.add(null);
      }
    }
  }

  Future<bool> buyProduct(ProductDTO product) async {
    try {
      // 상품 정보 확인
      final bool available = await _inAppPurchase.isAvailable();
      if (!available) {
        logger.e('인앱 결제를 사용할 수 없습니다.');
        return false;
      }

      // 상품 ID로 구매 요청
      final ProductDetails? productDetails =
          await _queryProductDetails(product.productId);
      if (productDetails == null) {
        logger.e('상품 정보를 찾을 수 없습니다: ${product.productId}');
        return false;
      }

      // 구매 요청
      final PurchaseParam purchaseParam = PurchaseParam(
        productDetails: productDetails,
        applicationUserName: null,
      );

      // 소모품(consumable) 상품으로 처리
      return await _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
    } catch (e) {
      logger.e('상품 구매 오류', error: e);
      return false;
    }
  }

  Future<ProductDetails?> _queryProductDetails(String productId) async {
    try {
      final ProductDetailsResponse response =
          await _inAppPurchase.queryProductDetails({productId});

      if (response.error != null) {
        logger.e('상품 정보 조회 오류: ${response.error}');
        return null;
      }

      if (response.productDetails.isEmpty) {
        logger.e('상품 정보가 없습니다: $productId');
        return null;
      }

      return response.productDetails.first;
    } catch (e) {
      logger.e('상품 정보 조회 중 오류 발생', error: e);
      return null;
    }
  }

  void dispose() {
    _subscription?.cancel();
    _purchaseResultController.close();
  }
}
