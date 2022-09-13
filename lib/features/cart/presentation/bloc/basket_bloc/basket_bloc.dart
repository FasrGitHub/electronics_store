import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:electronics_store/core/error/failure.dart';
import 'package:electronics_store/features/cart/data/repositories/basket_repository_impl.dart';
import 'package:electronics_store/features/cart/domain/entities/basket_entity.dart';
import 'package:electronics_store/features/cart/domain/usecases/get_basket_details.dart';
import 'package:equatable/equatable.dart';

part 'basket_event.dart';

part 'basket_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const UNEXPECTED_MESSAGE = 'Unexpected Error';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final GetBasketDetails getBasketDetails;

  BasketBloc({required this.getBasketDetails}) : super(BasketEmpty()) {
    on<BasketEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(BasketEvent event, Emitter<BasketState> state) async {
    emit(BasketLoading());
    final failureOrProducts = await getBasketDetails();
    emit(failureOrProducts.fold(
        (failure) => BasketError(message: _mapFailureToMessage(failure)),
        (r) => BasketLoaded(basket: r)));
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