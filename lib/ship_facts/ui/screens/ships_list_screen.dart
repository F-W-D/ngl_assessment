import 'package:flutter/material.dart';
import 'package:ngl_assessment/ship_facts/data/model/ships_enum.dart';
import 'package:ngl_assessment/ship_facts/ui/screens/ship_facts_screen.dart';

class ShipsListScreen extends StatelessWidget {
  const ShipsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Ships',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        //note: this couples our enum to the ui.
        //for now this is ok as it allows adding of new ships easily.
        //also avoids mapping issue of raw text value and non-existing id
        itemCount: ShipsEnum.values.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ShipsEnum.values[index].value),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              //note: instead of using 'routes' we can use navigator
              //to check results if needed when navigating back
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShipFactsScreen(
                    ship: ShipsEnum.values[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
