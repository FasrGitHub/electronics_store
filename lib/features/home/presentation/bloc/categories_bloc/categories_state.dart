part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final List<CategoryEntity> categories;
  final int? activeCategoryId;

  const CategoriesState(this.categories, this.activeCategoryId);

  @override
  List<Object?> get props => [categories, activeCategoryId];
}
