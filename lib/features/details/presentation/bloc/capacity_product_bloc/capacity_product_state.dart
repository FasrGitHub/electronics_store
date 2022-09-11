part of 'capacity_product_bloc.dart';

class CapacityProductState extends Equatable {
  final List<String> capacityProducts;
  final String? activeCapacityProduct;

  const CapacityProductState(this.capacityProducts, this.activeCapacityProduct);

  @override
  List<Object?> get props => [capacityProducts, activeCapacityProduct];
}