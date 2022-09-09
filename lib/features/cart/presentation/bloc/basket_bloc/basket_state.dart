part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object> get props => [];
}


class BasketEmpty extends BasketState {}

class BasketLoading extends BasketState {}

class BasketLoaded extends BasketState {
  final BasketEntity basket;

  const BasketLoaded({
    required this.basket,
  });

  @override
  List<Object> get props => [basket];
}

class BasketError extends BasketState {
  final String message;

  const BasketError({required this.message});

  @override
  List<Object> get props => [message];
}
