part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryPressPhone extends CategoryState {
}

class CategoryPressComputer extends CategoryState {
}

class CategoryPressHealth extends CategoryState {
}

class CategoryPressBooks extends CategoryState {
}
