import 'package:electronics_store/features/splash/data/datasources/banner_product_remote_data_source.dart';
import 'package:electronics_store/features/splash/data/datasources/products_remote_data_source.dart';
import 'package:electronics_store/features/splash/domain/entities/banner_product_entity.dart';
import 'package:electronics_store/features/splash/domain/entities/product_entity.dart';
import 'package:electronics_store/features/splash/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final BannerProductRemoteDataSource bannerProductRemote;
  final ProductsRemoteDataSource productRemote;

  ProductRepositoryImpl({
    required this.bannerProductRemote,
    required this.productRemote
  });

  @override
  Future<List<BannerProductEntity>> getAllBannerProducts() {
    return bannerProductRemote.getAllBannerProduct();
  }

  @override
  Future<List<ProductEntity>> getAllProducts() {
    return productRemote.getAllProducts();
  }
}


