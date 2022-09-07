import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/details/domain/entities/product_details_entity.dart';
import 'package:electronics_store/features/details/domain/repositories/product_details_repository.dart';

class GetProductDetails {
  final ProductDetailsRepository productDetailsRepository;

  GetProductDetails(this.productDetailsRepository);

  Future<Either<Failure, ProductDetailsEntity>> call() async {
    return await productDetailsRepository.getProductDetails();
  }
}