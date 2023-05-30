import 'package:ngl_assessment/ship_facts/data/model/ships_enum.dart';

abstract class ShipFactsEvent {}

class ShipFactsScreenAppeared extends ShipFactsEvent {
  final ShipsEnum ship;

  ShipFactsScreenAppeared({required this.ship});
}
