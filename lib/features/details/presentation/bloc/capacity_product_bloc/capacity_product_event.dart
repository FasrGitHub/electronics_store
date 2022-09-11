part of 'capacity_product_bloc.dart';

abstract class CapacityProductEvent extends Equatable {
  const CapacityProductEvent();
}

class CapacityProductUpdateEvent extends CapacityProductEvent {
  final List<String> capacityProducts;

  const CapacityProductUpdateEvent(this.capacityProducts);

  @override
  List<Object?> get props => [capacityProducts];
}

class SetActiveEvent extends CapacityProductEvent {
  final String capacityProduct;

  const SetActiveEvent(this.capacityProduct);

  @override
  List<Object> get props => [capacityProduct];
}