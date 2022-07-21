import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_info/core/locator.dart';
import 'package:weather_info/core/services/weather_service.dart';

import 'test_data.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks([WeatherService])
MockWeatherService getAndRegisterWeatherService({
  bool shouldThrowException = false,
}) {
  _removeRegistrationIfExists<WeatherService>();
  final service = MockWeatherService();

  if (shouldThrowException) {
    when(service.getWeatherForCity(city: anyNamed('city')))
        .thenThrow(Exception('Failed to load weather info'));
  } else {
    when(service.getWeatherForCity(city: anyNamed('city'))).thenAnswer(
      (_) => Future.value(weatherResponse),
    );
  }

  locator.registerSingleton<WeatherService>(service);
  return service;
}

void registerServices() {
  getAndRegisterWeatherService();
}

void unregisterServices() {
  locator.unregister<WeatherService>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
