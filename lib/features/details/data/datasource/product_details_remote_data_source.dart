import 'dart:convert';

import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/details/data/models/product_details_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailsRemoteDataSource {
  final http.Client client;
  final String url =
      "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5";

  ProductDetailsRemoteDataSource({required this.client});

  Future<ProductDetailsModel> getProductDetails() => _getProductsFromUrl(url);

  Future<ProductDetailsModel> _getProductsFromUrl(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ProductDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerFailure();
    }
  }
}
