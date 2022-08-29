import 'dart:convert';

import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/splash/data/models/banner_product_model.dart';
import 'package:electronics_store/features/splash/data/models/product_model.dart';
import 'package:electronics_store/features/splash/data/models/request_model.dart';
import 'package:http/http.dart' as http;

class ProductsRemoteDataSource {
  final String url =
      "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175";
  final client = http.Client();

  Future<RequestModel> getAllProducts() => _getProductsFromUrl(url);

  Future<RequestModel> _getProductsFromUrl(String url) async {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final products = json.decode(response.body);
      final productList = (products['best_seller'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();

      final bannerProducts = json.decode(response.body);
      final bannerProductList = (bannerProducts['home_store'] as List)
          .map((bannerProduct) => BannerProductModel.fromJson(bannerProduct))
          .toList();

      return RequestModel(
          bannerProductList: bannerProductList, productList: productList);
    } else {
      throw ServerFailure();
    }
  }
}
