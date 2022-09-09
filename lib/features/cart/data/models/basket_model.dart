import 'package:electronics_store/features/cart/data/models/product_basket_model.dart';
import 'package:electronics_store/features/cart/domain/entities/basket_entity.dart';

class BasketModel extends BasketEntity {
  const BasketModel(
      {required super.productBasket,
      required super.delivery,
      required super.id,
      required super.total});

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
      productBasket: (json['basket'] as List<dynamic>)
          .map((e) => ProductBasketModel.fromJson(e))
          .toList(),
      delivery: json['delivery'] as String,
      id: json['id'] as String,
      total: json['total'] as int,
    );
  }
}
