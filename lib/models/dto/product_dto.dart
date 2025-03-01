import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

// 상품 목록 요청 모델
@freezed
class RequestListProducts with _$RequestListProducts {
  const factory RequestListProducts({
    required String platform,
  }) = _RequestListProducts;

  factory RequestListProducts.fromJson(Map<String, dynamic> json) =>
      _$RequestListProductsFromJson(json);
}

// 추천 상품 목록 요청 모델
@freezed
class RequestListFeaturedProducts with _$RequestListFeaturedProducts {
  const factory RequestListFeaturedProducts({
    required String platform,
  }) = _RequestListFeaturedProducts;

  factory RequestListFeaturedProducts.fromJson(Map<String, dynamic> json) =>
      _$RequestListFeaturedProductsFromJson(json);
}

// 상품 DTO 모델
@freezed
class ProductDTO with _$ProductDTO {
  const factory ProductDTO({
    required int id,
    @JsonKey(name: 'product_id') required String productId,
    required String platform,
    required String name,
    required String description,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'original_price') required int originalPrice,
    required int price,
    @JsonKey(name: 'carrot_amount') required int carrotAmount,
    @JsonKey(name: 'discount_rate') required int discountRate,
    @JsonKey(name: 'is_featured') required bool isFeatured,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);
}

// 상품 목록 응답 모델
@freezed
class ResponseProductList with _$ResponseProductList {
  const factory ResponseProductList({
    required List<ProductDTO> products,
  }) = _ResponseProductList;

  factory ResponseProductList.fromJson(Map<String, dynamic> json) =>
      _$ResponseProductListFromJson(json);
}

// 상품 응답 모델
@freezed
class ResponseProduct with _$ResponseProduct {
  const factory ResponseProduct({
    required ProductDTO product,
  }) = _ResponseProduct;

  factory ResponseProduct.fromJson(Map<String, dynamic> json) =>
      _$ResponseProductFromJson(json);
}
