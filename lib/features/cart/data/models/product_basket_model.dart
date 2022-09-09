import 'package:electronics_store/features/cart/domain/entities/product_basket_entity.dart';

class ProductBasketModel extends ProductBasketEntity {
  ProductBasketModel(
      {required super.id,
      required super.images,
      required super.price,
      required super.title});

  factory ProductBasketModel.fromJson(Map<String, dynamic> json) {
    return ProductBasketModel(
      id: json['id'] as int,
      images: json['images'] as String,
      price: json['price'] as int,
      title: json['title'] as String,
    );
  }
}
