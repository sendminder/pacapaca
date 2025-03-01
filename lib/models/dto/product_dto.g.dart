// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestListProductsImpl _$$RequestListProductsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListProductsImpl(
      platform: json['platform'] as String,
    );

Map<String, dynamic> _$$RequestListProductsImplToJson(
        _$RequestListProductsImpl instance) =>
    <String, dynamic>{
      'platform': instance.platform,
    };

_$RequestListFeaturedProductsImpl _$$RequestListFeaturedProductsImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListFeaturedProductsImpl(
      platform: json['platform'] as String,
    );

Map<String, dynamic> _$$RequestListFeaturedProductsImplToJson(
        _$RequestListFeaturedProductsImpl instance) =>
    <String, dynamic>{
      'platform': instance.platform,
    };

_$ProductDTOImpl _$$ProductDTOImplFromJson(Map<String, dynamic> json) =>
    _$ProductDTOImpl(
      id: (json['id'] as num).toInt(),
      productId: json['product_id'] as String,
      platform: json['platform'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      originalPrice: (json['original_price'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      carrotAmount: (json['carrot_amount'] as num).toInt(),
      discountRate: (json['discount_rate'] as num).toInt(),
      isFeatured: json['is_featured'] as bool,
    );

Map<String, dynamic> _$$ProductDTOImplToJson(_$ProductDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'platform': instance.platform,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'original_price': instance.originalPrice,
      'price': instance.price,
      'carrot_amount': instance.carrotAmount,
      'discount_rate': instance.discountRate,
      'is_featured': instance.isFeatured,
    };

_$ResponseProductListImpl _$$ResponseProductListImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseProductListImpl(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResponseProductListImplToJson(
        _$ResponseProductListImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

_$ResponseProductImpl _$$ResponseProductImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseProductImpl(
      product: ProductDTO.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseProductImplToJson(
        _$ResponseProductImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
    };
