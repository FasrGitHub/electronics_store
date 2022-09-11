import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'capacity_product_event.dart';

part 'capacity_product_state.dart';

class CapacityProductBloc
    extends Bloc<CapacityProductEvent, CapacityProductState> {
  CapacityProductBloc() : super(const CapacityProductState([], null)) {
    on<CapacityProductUpdateEvent>((event, emit) {

      emit(CapacityProductState(
          event.capacityProducts, event.capacityProducts[0]));
    });

    on<SetActiveEvent>((event, emit) {
      emit(CapacityProductState(state.capacityProducts, event.capacityProduct));
    });
  }
}
