import 'package:get_it/get_it.dart';
import 'package:weather_info/core/constants.dart';
import 'package:weather_info/features/weather/weather_view_model.dart';

import 'services/weather_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Factories
  locator.registerFactory(() => WeatherViewModel());

  // Third Party Dependencies
  locator.registerLazySingleton(
    () => WeatherService(apiKey: Constants.kApiKey),
  );

  await locator.allReady();
}
