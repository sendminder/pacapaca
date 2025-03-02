import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/payment_dto.dart';
import 'package:pacapaca/models/dto/product_dto.dart';
import 'package:pacapaca/services/in_app_purchase_service.dart';

part 'in_app_purchase_provider.g.dart';

@riverpod
class InAppPurchase extends _$InAppPurchase {
  late final InAppPurchaseService _inAppPurchaseService;

  @override
  Stream<PaymentDTO?> build() {
    _inAppPurchaseService = GetIt.instance<InAppPurchaseService>();
    return _inAppPurchaseService.purchaseResultStream;
  }

  Future<bool> buyProduct(ProductDTO product) async {
    return await _inAppPurchaseService.buyProduct(product);
  }
}
