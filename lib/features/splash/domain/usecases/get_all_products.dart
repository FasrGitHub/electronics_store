import 'package:electronics_store/features/splash/domain/entities/product_entity.dart';
import 'package:electronics_store/features/splash/domain/repositories/product_repository.dart';

class GetAllBannerProducts {
  final ProductRepository productRepository;

  GetAllBannerProducts(this.productRepository);

  Future<List<ProductEntity>> call() async {
    return await productRepository.getAllProducts();
  }
}