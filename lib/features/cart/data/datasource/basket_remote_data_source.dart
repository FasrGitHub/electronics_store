import 'dart:convert';

import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/cart/data/models/basket_model.dart';
import 'package:http/http.dart' as http;

class BasketRemoteDataSource {
  final String url =
      "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149";
  final client = http.Client();

  Future<BasketModel> getBasket() => _getBasketFromUrl(url);

  Future<BasketModel> _getBasketFromUrl(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final basket = BasketModel.fromJson(jsonDecode(response.body));
      return basket;
    } else {
      throw ServerFailure();
    }
  }
}
