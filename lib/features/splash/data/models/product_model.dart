import 'package:electronics_store/features/splash/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required id,
    required isFavorites,
    required title,
    required priceWithoutDiscount,
    required discountPrice,
    required picture,
  }) : super(
          id: id,
          isFavorites: isFavorites,
          title: title,
          priceWithoutDiscount: priceWithoutDiscount,
          discountPrice: discountPrice,
          picture: picture,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      isFavorites: json['is_favorites'] as bool,
      title: json['title'] as String,

      //TODO цена со скидкой и цена без скидки в бэкэнде сделана не правильно
      priceWithoutDiscount: json['discount_price'] as int,
      discountPrice: json['price_without_discount'] as int,

      picture: json['picture'] as String,
    );
  }
}
