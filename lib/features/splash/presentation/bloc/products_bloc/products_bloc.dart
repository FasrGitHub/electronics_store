import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/splash/data/repositories/product_repository_impl.dart';
import 'package:electronics_store/features/splash/domain/entities/banner_product_entity.dart';
import 'package:electronics_store/features/splash/domain/entities/product_entity.dart';
import 'package:electronics_store/features/splash/domain/repositories/product_repository.dart';
import 'package:electronics_store/features/splash/domain/usecases/get_all_products.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';

part 'products_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const UNEXPECTED_MESSAGE = 'Unexpected Error';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  // final GetAllProducts getAllProducts;
  final ProductRepositoryImpl productRepositoryImpl;

  ProductsBloc({required this.productRepositoryImpl}) : super(ProductsEmpty()) {
    on<ProductsEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
      ProductsEvent event, Emitter<ProductsState> state) async {
    emit(ProductsLoading());
    final failureOrProducts = await productRepositoryImpl.getAllProducts();
    emit(failureOrProducts.fold(
        (failure) => ProductsError(message: _mapFailureToMessage(failure)),
        (r) => ProductsLoaded(
            products: r.productList, bannerProducts: r.bannerProductList)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return UNEXPECTED_MESSAGE;
    }
  }
}
