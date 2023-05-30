import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngl_assessment/ship_facts/bloc/ship_facts_event.dart';
import 'package:ngl_assessment/ship_facts/bloc/ship_facts_state.dart';
import 'package:ngl_assessment/ship_facts/data/repo/ship_facts_repo.dart';

class ShipFactsBloc extends Bloc<ShipFactsEvent, ShipFactsState> {
  final IShipFactsRepo shipFactsRepo;

  ShipFactsBloc({required this.shipFactsRepo})
      : super(ShipFactsInitialState()) {
    on<ShipFactsScreenAppeared>(_handleShipFactsAppeared);
  }

  Future<void> _handleShipFactsAppeared(
    ShipFactsScreenAppeared event,
    Emitter<ShipFactsState> emit,
  ) async {
    emit(ShipFactsLoadingState());

    try {
      final response = await shipFactsRepo.fetchShipData(
        ship: event.ship,
      );

      emit(response.fold(
        (failure) => ShipFactsErrorState(failure.message),
        (shipData) => ShipFactsSuccessState(shipData),
      ));
    } catch (error) {
      emit(ShipFactsErrorState(error.toString()));
    }
  }
}
