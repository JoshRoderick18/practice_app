import 'package:get_it/get_it.dart';
import 'package:practice_app/core/services/http_service.dart';
import 'package:practice_app/data/repositories/character_repository_implementation.dart';
import 'package:practice_app/domain/repositories/character_repository.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );

  locator.registerLazySingleton<HttpService>(
    () => HttpService(),
  );

  locator.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImplementation(
      httpService: locator<HttpService>(),
    ),
  );
}
