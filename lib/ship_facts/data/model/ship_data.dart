class ShipData {
  final String shipName;
  final String passengerCapacity;
  final String crew;
  final String inauguralDate;

  ShipData(
    this.shipName,
    this.passengerCapacity,
    this.crew,
    this.inauguralDate,
  );

  factory ShipData.fromJson(Map<String, dynamic> json) {
    //NOTE: for simplicity, we have bypassed json_annotation
    // to avoid nesting & generated files
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
