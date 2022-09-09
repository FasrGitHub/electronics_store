import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/category_entity.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const CategoriesState([], null)) {
    on<CategoriesUpdateEvent>((event, emit) {
      emit(CategoriesState(event.categories, event.categories[0].id));
    });
    on<SetActiveEvent>((event, emit) {
      emit(CategoriesState(state.categories, event.categoryId));
    });
  }
}
