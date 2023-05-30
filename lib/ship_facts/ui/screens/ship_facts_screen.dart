import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngl_assessment/ship_facts/bloc/ship_facts_bloc.dart';
import 'package:ngl_assessment/ship_facts/bloc/ship_facts_event.dart';
import 'package:ngl_assessment/ship_facts/bloc/ship_facts_state.dart';
import 'package:ngl_assessment/ship_facts/data/model/ships_enum.dart';
import 'package:ngl_assessment/ship_facts/injection.dart';
import 'package:ngl_assessment/ship_facts/ui/widgets/ship_facts_error_body.dart';
import 'package:ngl_assessment/ship_facts/ui/widgets/ship_facts_success_body.dart';

class ShipFactsScreen extends StatelessWidget {
  final ShipsEnum ship;

  const ShipFactsScreen({super.key, required this.ship});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<ShipFactsBloc>();
        bloc.add(ShipFactsScreenAppeared(ship: ship));
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<ShipFactsBloc, ShipFactsState>(
            buildWhen: (previous, current) => current is ShipFactsSuccessState,
            builder: (context, state) {
              String title = 'Ship Facts';
              if (state is ShipFactsSuccessState) {
                title = state.shipData.shipName;
              }

              return Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              );
            },
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
                    final ship = state.shipData;
                    return ShipFactsSuccessBody(
                      shipName: ship.shipName,
                      passengerCapacity: ship.passengerCapacity,
                      crew: ship.crew,
                      inauguralDate: ship.inauguralDate,
                    );
                  } else if (state is ShipFactsErrorState) {
                    return ShipFactsErrorBody(
                      errorMessage: state.errorMessage,
                      onPressed: () {
                        BlocProvider.of<ShipFactsBloc>(context).add(
                          ShipFactsScreenAppeared(ship: ship),
                        );
                      },
                    );
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
