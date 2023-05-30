import 'package:ngl_assessment/ship_facts/data/model/ship_data.dart';

abstract class ShipFactsState {}

class ShipFactsInitialState extends ShipFactsState {}

class ShipFactsLoadingState extends ShipFactsState {}

class ShipFactsSuccessState extends ShipFactsState {
  final ShipData shipData;

  ShipFactsSuccessState(this.shipData);
}

class ShipFactsErrorState extends ShipFactsState {
  final String errorMessage;

  ShipFactsErrorState(this.errorMessage);
}
