part of 'colors_product_bloc.dart';

abstract class ColorsProductEvent extends Equatable {
  const ColorsProductEvent();
}

class ColorsProductUpdateEvent extends ColorsProductEvent {
  final List<String> colors;

  const ColorsProductUpdateEvent(this.colors);

  @override
  List<Object?> get props => [colors];
}

class SetActiveEvent extends ColorsProductEvent {
  final String colorsProduct;

  const SetActiveEvent(this.colorsProduct);

  @override
  List<Object> get props => [colorsProduct];
}
