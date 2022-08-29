import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/core/platform/network_info.dart';
import 'package:electronics_store/features/splash/data/datasources/products_remote_data_source.dart';
import 'package:electronics_store/features/splash/domain/entities/request_entity.dart';
import 'package:electronics_store/features/splash/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductsRemoteDataSource productsRemote;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.productsRemote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, RequestEntity>> getAllProducts() async {
    return await _getProducts(() {
      return productsRemote.getAllProducts();
    });
  }

  Future<Either<Failure, RequestEntity>> _getProducts(
      Future<RequestEntity> Function() getProducts) async {
    if (await networkInfo.isConnected) {
      final remotePerson = await getProducts();
      return Right(remotePerson);
    } else {
      return Left(ServerFailure());
    }
  }
}
