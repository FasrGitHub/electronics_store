
//Todo сейчас home фича использует модели из splash фичи
import 'package:electronics_store/features/splash/domain/entities/banner_product_entity.dart';
import 'package:electronics_store/features/splash/domain/entities/product_entity.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<BannerProductEntity> bannerProductList;
  final List<ProductEntity> productList;

  const HomeScreen(
      {Key? key, required this.bannerProductList, required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Text("${bannerProductList.reversed}"),
    );
  }
}
