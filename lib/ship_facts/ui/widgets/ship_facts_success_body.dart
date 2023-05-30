import 'package:flutter/widgets.dart';

class ShipFactsSuccessBody extends StatelessWidget {
  final String? shipName;
  final String? passengerCapacity;
  final String? crew;
  final String? inauguralDate;

  const ShipFactsSuccessBody({
    super.key,
    required this.shipName,
    required this.passengerCapacity,
    required this.crew,
    required this.inauguralDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            shipName != null
                ? Text(
                    "Ship Name: $shipName",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const SizedBox(),
            passengerCapacity != null
                ? Text("Passenger Capacity: $passengerCapacity")
                : const SizedBox(),
            crew != null ? Text("Crew Count: $crew") : const SizedBox(),
            inauguralDate != null
                ? Text("Inaugural Date: $inauguralDate")
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
