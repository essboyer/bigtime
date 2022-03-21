import 'package:bigtime/services/local_storage_service.dart';
import 'package:bigtime/services/screen_size_service.dart';
import 'package:bigtime/services/theme_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Services go here
  var lssInstance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(lssInstance);
  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => ScreenSizeService());
}
