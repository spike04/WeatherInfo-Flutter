import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_info/features/weather/weather_view_model.dart';

import '../../setup/test_data.dart';
import '../../setup/test_helpers.dart';

void main() {
  group('WeatherViewModel - ', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('onCityNameChanged - ', () {
      test('when viewModel is initialized, should canSubmit be falsy', () {
        final model = WeatherViewModel();

        expect(model.canSubmit, isFalse);
      });
      test(
          'when onCityNameChanged is called with value, should canSubmit be truthy',
          () {
        final model = WeatherViewModel();

        model.onCityNameChanged(cityName);

        expect(model.canSubmit, isTrue);
      });
    });

    group('submit - ', () {
      test(
          'when submit is called, should call getWeatherForCity for weatherApiService',
          () async {
        final service = getAndRegisterWeatherService();
        final model = WeatherViewModel();

        model.onCityNameChanged(cityName);

        await model.submit();

        verify(service.getWeatherForCity(city: cityName)).called(1);
      });

      test(
          'when submit is called when cityName, should setError',
          () async {
        getAndRegisterWeatherService(shouldThrowException: true);
        final model = WeatherViewModel();

        model.onCityNameChanged(cityName);

        await model.submit();
        expect(model.hasError, true);
      });

      test(
          'when submit is called, should weather, main and name variable be null',
          () {
        final model = WeatherViewModel();

        expect(model.weather, isNull);
        expect(model.main, isNull);
        expect(model.name, isNull);
      });

      test(
          'when submit is called, should set weather, main and name variable and shouldnot be null and has required values from test data',
          () async {
        final model = WeatherViewModel();

        model.onCityNameChanged(cityName);
        expect(model.canSubmit, isTrue);

        await model.submit();

        expect(model.weather, isNotNull);
        expect(model.name, isNotNull);
        expect(model.main, isNotNull);

        expect(model.weather, weatherResponse.weather[0]);
        expect(model.name, weatherResponse.name);
        expect(model.main, weatherResponse.main);
      });
    });
  });
}
