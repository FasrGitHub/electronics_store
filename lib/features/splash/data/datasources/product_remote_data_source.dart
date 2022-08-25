import 'dart:convert';

import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/splash/data/models/product_model.dart';
import 'package:http/http.dart' as http;


class ProductRemoteDataSource {
  final http.Client client;
  final String url = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175";

  ProductRemoteDataSource({required this.client});

  Future<List<ProductModel>> getAllProducts() => _getProductsFromUrl(url);

  Future<List<ProductModel>> _getProductsFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url));
    if (response.statusCode == 200) {
      final products = json.decode(response.body);
      return (products['best_seller'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } else {
      throw ServerFailure();
    }
  }
}
