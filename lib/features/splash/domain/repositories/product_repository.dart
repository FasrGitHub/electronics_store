import 'package:electronics_store/features/splash/domain/entities/banner_product_entity.dart';
import 'package:electronics_store/features/splash/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getAllProducts();
  Future<List<BannerProductEntity>> getAllBannerProducts();
}