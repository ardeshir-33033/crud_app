import 'package:hive/hive.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  // *----- Cubit -----*

  // *----- UseCase -----*

  // *----- Repository -----*

  // *----- Data Source -----*
  await initHive();
}

Future<void> initHive() async {
  final Box box = await Hive.openBox("customer");
  locator.registerLazySingleton<Box>(() => box);
}
