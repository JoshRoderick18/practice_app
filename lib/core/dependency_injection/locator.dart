import 'package:get_it/get_it.dart';
import 'package:practice_app/core/services/http_service.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );

  locator.registerLazySingleton<HttpService>(
    () => HttpService(),
  );
}