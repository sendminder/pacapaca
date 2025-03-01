import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pacapaca/models/dto/product_dto.dart';
import 'package:pacapaca/models/dto/common_dto.dart';
import 'package:pacapaca/services/dio_service.dart';

class ProductService {
  final Dio _dio = DioService.instance;
  final logger = GetIt.instance<Logger>();

  /// 플랫폼별 상품 목록 조회하기
  Future<List<ProductDTO>?> getProducts(String platform) async {
    try {
      final response = await _dio.get(
        '/v1/payments/products/$platform',
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final productsResponse =
            ResponseProductList.fromJson(responseRest.response!);
        return productsResponse.products;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get products', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// 플랫폼별 추천 상품 목록 조회하기
  Future<List<ProductDTO>?> getFeaturedProducts(String platform) async {
    try {
      final response = await _dio.get(
        '/v1/payments/products/featured/$platform',
      );

      final responseRest = RestResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json as Map<String, dynamic>,
      );

      if (responseRest.response != null) {
        final productsResponse =
            ResponseProductList.fromJson(responseRest.response!);
        return productsResponse.products;
      }
      return null;
    } catch (e, stackTrace) {
      logger.e('get featured products', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
