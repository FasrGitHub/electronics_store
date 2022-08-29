import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/splash/domain/entities/request_entity.dart';
import 'package:electronics_store/features/splash/domain/repositories/product_repository.dart';

class GetAllProducts {
  final ProductRepository productRepository;

  GetAllProducts(this.productRepository);

  Future<Either<Failure, RequestEntity>> call() async {
    return await productRepository.getAllProducts();
  }
}