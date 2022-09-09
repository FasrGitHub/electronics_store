import 'package:electronics_store/features/cart/domain/entities/product_basket_entity.dart';
import 'package:equatable/equatable.dart';

class BasketEntity extends Equatable {

  final List<ProductBasketEntity> productBasket;
  final String delivery;
  final String id;
  final int total;

  const BasketEntity({
    required this.productBasket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  @override
  List<Object?> get props => [
    productBasket,
    delivery,
    id,
    total,
  ];
}