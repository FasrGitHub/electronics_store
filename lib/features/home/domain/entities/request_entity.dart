import 'package:electronics_store/features/home/domain/entities/banner_product_entity.dart';
import 'package:electronics_store/features/home/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class RequestEntity extends Equatable {
  final List<BannerProductEntity> bannerProductList;
  final List<ProductEntity> productList;

  const RequestEntity({
    required this.bannerProductList,
    required this.productList,
  });

  @override
  List<Object?> get props =>
      [
        bannerProductList,
        productList,
      ];
}