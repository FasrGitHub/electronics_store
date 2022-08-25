import 'package:electronics_store/features/splash/domain/entities/banner_product_entity.dart';
import 'package:electronics_store/features/splash/domain/repositories/product_repository.dart';

class GetAllBannerProducts {
  final ProductRepository productRepository;

  GetAllBannerProducts(this.productRepository);

  Future<List<BannerProductEntity>> call() async {
    return await productRepository.getAllBannerProducts();
  }
}