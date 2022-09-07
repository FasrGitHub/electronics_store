import 'dart:convert';

import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/details/data/models/product_details_model.dart';
import 'package:http/http.dart' as http;

class ProductDetailsRemoteDataSource {
  final String url =
      "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5";
  final client = http.Client();

  Future<ProductDetailsModel> getProductDetails() => _getProductsFromUrl(url);

  Future<ProductDetailsModel> _getProductsFromUrl(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var result = ProductDetailsModel.fromJson(jsonDecode(response.body));
      return result;
    } else {
      throw ServerFailure();
    }
  }
}
