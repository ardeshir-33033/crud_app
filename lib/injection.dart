import 'package:hive/hive.dart';
import 'package:get_it/get_it.dart';
import 'package:mc_crud_test/features/crud/presentation/cubit/customer_cubit.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  // *----- Cubit -----*
  locator.registerLazySingleton<CustomerCubit>(() => CustomerCubit());
  // *----- UseCase -----*

  // *----- Repository -----*

  // *----- Data Source -----*
  await initHive();
}

Future<void> initHive() async {
  final Box box = await Hive.openBox("customer");
  locator.registerLazySingleton<Box>(() => box);
}
