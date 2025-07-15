
import 'package:get_it/get_it.dart';
import 'package:mobile_app_template/data/local_storage/isar/database/isar_service.dart';

final GetIt getIt = GetIt.instance;

//register global dependencies
//do not register dependencies that are used only in tightly coupled screens
Future<void> setupDependencyInjection() async {
  getIt.registerLazySingleton<IsarService>(()=> IsarService());
}