import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/cart/domain/entities/basket_entity.dart';
import 'package:electronics_store/features/cart/domain/repositories/basket_repository.dart';

class GetBasketDetails {
  final BasketRepository basketRepository;

  GetBasketDetails(this.basketRepository);

  Future<Either<Failure, BasketEntity>> call() async {
    return await basketRepository.getBasket();
  }
}