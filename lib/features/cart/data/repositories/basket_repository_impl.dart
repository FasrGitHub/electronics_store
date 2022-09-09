import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/core/platform/network_info.dart';
import 'package:electronics_store/features/cart/data/datasource/basket_remote_data_source.dart';
import 'package:electronics_store/features/cart/domain/entities/basket_entity.dart';
import 'package:electronics_store/features/cart/domain/repositories/basket_repository.dart';

class BasketRepositoryImpl implements BasketRepository {
  final BasketRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BasketRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, BasketEntity>> getBasket() async {
    return await _getBasket(() {
      return remoteDataSource.getBasket();
    });
  }

  Future<Either<Failure, BasketEntity>> _getBasket(
      Future<BasketEntity> Function() getProducts) async {
    if (await networkInfo.isConnected) {
      final remotePerson = await getProducts();
      return Right(remotePerson);
    } else {
      return Left(ServerFailure());
    }
  }
}
