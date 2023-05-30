import 'package:get_it/get_it.dart';
import 'package:ngl_assessment/ship_facts/bloc/ship_facts_bloc.dart';
import 'package:ngl_assessment/ship_facts/data/repo/ship_facts_repo.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerFactory(
    () => ShipFactsBloc(shipFactsRepo: getIt()),
  );

  getIt.registerLazySingleton<IShipFactsRepo>(
    () => ShipFactsRepo(),
  );
}
