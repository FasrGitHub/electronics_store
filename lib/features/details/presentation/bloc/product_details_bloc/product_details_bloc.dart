import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/details/domain/entities/product_details_entity.dart';
import 'package:electronics_store/features/details/domain/usecases/get_product_details.dart';
import 'package:equatable/equatable.dart';

part 'product_details_event.dart';

part 'product_details_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const UNEXPECTED_MESSAGE = 'Unexpected Error';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {

  final GetProductDetails getProductDetails;

  ProductDetailsBloc({required this.getProductDetails})
      : super(ProductDetailsEmpty()) {
    on<ProductDetailsEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(ProductDetailsEvent event,
      Emitter<ProductDetailsState> state) async {
    emit(ProductDetailsLoading());
    final failureOrProducts = await getProductDetails();
    emit(failureOrProducts.fold(
            (failure) => ProductDetailsError(message: _mapFailureToMessage(failure)),
            (r) =>
            ProductDetailsLoaded(
                productDetails: r)));
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