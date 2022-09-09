part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

class CategoriesUpdateEvent extends CategoriesEvent {
  final List<CategoryEntity> categories;

  const CategoriesUpdateEvent(this.categories);

  @override
  List<Object> get props => [categories];
}

class SetActiveEvent extends CategoriesEvent {
  final int categoryId;

  const SetActiveEvent(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}