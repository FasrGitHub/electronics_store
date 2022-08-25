import 'dart:convert';

import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/splash/data/models/banner_product_model.dart';
import 'package:http/http.dart' as http;

class BannerProductRemoteDataSource {
  final http.Client client;
  final String url =
      "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175";

  BannerProductRemoteDataSource({required this.client});

  Future<List<BannerProductModel>> getAllBannerProduct() =>
      _getBannerProductFromUrl(url);

  Future<List<BannerProductModel>> _getBannerProductFromUrl(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final products = json.decode(response.body);
      return (products['home_store'] as List)
          .map((product) => BannerProductModel.fromJson(product))
          .toList();
    } else {
      throw ServerFailure();
    }
  }
}
