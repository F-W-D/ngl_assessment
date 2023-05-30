import 'package:flutter/material.dart';
import 'package:ngl_assessment/ship_facts/injection.dart' as shipFacts;
import 'package:ngl_assessment/ship_facts/ui/screens/ships_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //note: handle DI before running app
  shipFacts.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShipsListScreen(),
    );
  }
}
