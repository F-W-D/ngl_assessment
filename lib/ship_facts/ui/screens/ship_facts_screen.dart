import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngl_assessment/ship_facts/bloc/ship_facts_bloc.dart';
import 'package:ngl_assessment/ship_facts/bloc/ship_facts_event.dart';
import 'package:ngl_assessment/ship_facts/bloc/ship_facts_state.dart';
import 'package:ngl_assessment/ship_facts/data/model/ships_enum.dart';
import 'package:ngl_assessment/ship_facts/injection.dart';

class ShipFactsScreen extends StatelessWidget {
  final ShipsEnum ship;

  ShipFactsScreen({super.key, required this.ship});

  late ShipFactsBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _bloc = getIt<ShipFactsBloc>();
        _bloc.add(ShipFactsScreenAppeared(ship: ship));
        return _bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ship Facts',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ShipFactsBloc, ShipFactsState>(
                buildWhen: (previous, current) =>
                    current is ShipFactsSuccessState ||
                    current is ShipFactsErrorState ||
                    current is ShipFactsLoadingState,
                builder: (context, state) {
                  if (state is ShipFactsSuccessState) {
                    //todo: success body
                  } else if (state is ShipFactsErrorState) {
                    //todo: errror body
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
