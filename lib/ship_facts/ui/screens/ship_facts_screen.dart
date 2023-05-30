import 'package:flutter/material.dart';
import 'package:ngl_assessment/ship_facts/data/ships_enum.dart';

class ShipFactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ship Facts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: ShipsEnum.values.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ShipsEnum.values[index].value),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              //TODO: handle event
            },
          );
        },
      ),
    );
  }
}
