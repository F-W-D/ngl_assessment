class ShipData {
  final String shipName;
  final int passengerCapacity;
  final int crew;
  final String inauguralDate;

  ShipData(
    this.shipName,
    this.passengerCapacity,
    this.crew,
    this.inauguralDate,
  );

  factory ShipData.fromJson(Map<String, dynamic> json) {
    final shipName = json["shipName"];
    final shipFacts = json["shipFacts"] as Map<String, dynamic>;
    final passengerCapacity = shipFacts["passengerCapacity"];
    final crew = shipFacts["crew"];
    final inauguralDate = shipFacts["inauguralDate"];
    return ShipData(
      shipName,
      passengerCapacity,
      crew,
      inauguralDate,
    );
  }
}
