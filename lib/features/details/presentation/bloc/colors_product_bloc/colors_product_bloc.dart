import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'colors_product_event.dart';
part 'colors_product_state.dart';

class ColorsProductBloc extends Bloc<ColorsProductEvent, ColorsProductState> {
  ColorsProductBloc() : super(const ColorsProductState([], null)) {

    on<ColorsProductUpdateEvent>((event, emit) {
      emit(ColorsProductState(event.colors, event.colors[0] ));
    });

    on<SetActiveEvent>((event, emit) {
      emit(ColorsProductState(state.colors, event.colorsProduct));
    });
  }
}
