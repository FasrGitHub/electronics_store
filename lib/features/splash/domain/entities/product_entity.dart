import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final bool isFavorites;
  final String title;
  final String priceWithoutDiscount;
  final String discountPrice;
  final String picture;

  const ProductEntity({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  @override
  List<Object?> get props => [
        id,
        isFavorites,
        title,
        priceWithoutDiscount,
        discountPrice,
        picture,
      ];
}
