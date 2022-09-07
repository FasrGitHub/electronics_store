import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/core/platform/network_info.dart';
import 'package:electronics_store/features/details/data/datasource/product_details_remote_data_source.dart';
import 'package:electronics_store/features/details/domain/entities/product_details_entity.dart';
import 'package:electronics_store/features/details/domain/repositories/product_details_repository.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductDetailsRepositoryImpl(
      {required this.networkInfo,
      required this.remoteDataSource});

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails() async {
    return await _getProductDetails((){
      return remoteDataSource.getProductDetails();
    });
  }

  Future<Either<Failure, ProductDetailsEntity>> _getProductDetails(
      Future<ProductDetailsEntity> Function() getProducts) async {
    if (await networkInfo.isConnected) {
      final remotePerson = await getProducts();
      return Right(remotePerson);
    } else {
      return Left(ServerFailure());
    }
  }
}
