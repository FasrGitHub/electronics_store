part of 'colors_product_bloc.dart';

class ColorsProductState extends Equatable {
  final List<String> colors;
  final String? activeColorsProduct;

  const ColorsProductState(this.colors, this.activeColorsProduct,);

  @override
  List<Object?> get props => [colors, activeColorsProduct];
}
