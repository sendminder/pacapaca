import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:pacapaca/models/dto/product_dto.dart';
import 'package:pacapaca/services/product_service.dart';

part 'product_provider.g.dart';

@riverpod
class Products extends _$Products {
  final _productService = GetIt.instance<ProductService>();

  // 현재 선택된 플랫폼 (기본값: android)
  String _currentPlatform = 'android';

  @override
  Future<List<ProductDTO>> build() async {
    // 초기 상품 목록 로드 (기본 플랫폼으로)
    final products = await _productService.getProducts(_currentPlatform);
    return products ?? [];
  }

  /// 플랫폼 설정
  void setPlatform(String platform) {
    _currentPlatform = platform;
    refreshProducts();
  }

  /// 현재 플랫폼 반환
  String getCurrentPlatform() {
    return _currentPlatform;
  }

  /// 상품 목록 조회
  Future<void> getProducts(String platform) async {
    state = const AsyncValue.loading();
    try {
      final products = await _productService.getProducts(platform);
      state = AsyncValue.data(products ?? []);
      _currentPlatform = platform;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// 추천 상품 목록 조회
  Future<List<ProductDTO>> getFeaturedProducts(String platform) async {
    try {
      final products = await _productService.getFeaturedProducts(platform);
      return products ?? [];
    } catch (error) {
      rethrow;
    }
  }

  /// 상품 목록 새로고침
  Future<void> refreshProducts() async {
    state = const AsyncValue.loading();
    try {
      final products = await _productService.getProducts(_currentPlatform);
      state = AsyncValue.data(products ?? []);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

@riverpod
class FeaturedProducts extends _$FeaturedProducts {
  final _productService = GetIt.instance<ProductService>();

  @override
  Future<List<ProductDTO>> build({required String platform}) async {
    // 추천 상품 목록 로드
    final products = await _productService.getFeaturedProducts(platform);
    return products ?? [];
  }

  /// 추천 상품 목록 새로고침
  Future<void> refreshFeaturedProducts(String platform) async {
    state = const AsyncValue.loading();
    try {
      final products = await _productService.getFeaturedProducts(platform);
      state = AsyncValue.data(products ?? []);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
