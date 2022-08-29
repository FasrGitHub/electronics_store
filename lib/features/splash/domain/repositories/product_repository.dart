import 'package:dartz/dartz.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/splash/domain/entities/request_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, RequestEntity>> getAllProducts();
}