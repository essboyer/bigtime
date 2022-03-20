import 'package:bigtime/services/local_storage_service.dart';
import 'package:bigtime/services/screen_size_service.dart';
import 'package:bigtime/services/theme_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Services go here
  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => ScreenSizeService());
}
