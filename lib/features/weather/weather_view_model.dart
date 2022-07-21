import 'package:stacked/stacked.dart';
import 'package:weather_info/core/locator.dart';
import 'package:weather_info/core/services/weather_service.dart';

import '../../core/models/weather_response.dart';

class WeatherViewModel extends BaseViewModel {
  final weatherService = locator<WeatherService>();

  String _cityName = '';

  bool get canSubmit => _cityName.isNotEmpty;

  Weather? weather;
  String? name;
  Main? main;

  void onCityNameChanged(String cityName) {
    _cityName = cityName;
    notifyListeners();
  }

  Future<void> submit() async {
    if (hasError) setError(null);
    setBusy(true);
    try {
      final weatherResponse =
          await weatherService.getWeatherForCity(city: _cityName);
      weather = weatherResponse.weather[0];
      name = weatherResponse.name;
      main = weatherResponse.main;
    } catch (e) {
      setError(e);
      weather = null;
      name = null;
      main = null;
    } finally {
      setBusy(false);
    }
  }
}
