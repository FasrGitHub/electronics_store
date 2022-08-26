import 'package:electronics_store/features/splash/data/models/banner_product_model.dart';
import 'package:electronics_store/features/splash/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

class RequestModel extends Equatable {
  final List<BannerProductModel> bannerProductList;
  final List<ProductModel> productList;

  const RequestModel({
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
