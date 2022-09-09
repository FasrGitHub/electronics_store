import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/cart/domain/entities/basket_entity.dart';

abstract class BasketRepository {
  Future<Either<Failure, BasketEntity>> getBasket();
}