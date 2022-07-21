import 'package:weather_info/core/models/weather_response.dart';

const cityName = 'London';

final weatherFirst = Weather(
  id: 803,
  main: 'Clouds',
  description: 'broken clouds',
  icon: '04d',
);

final mainWeather = Main(
  temp: 294.53,
  tempMin: 292.59,
  tempMax: 296.43,
  pressure: 1015,
  humidity: 73,
);

final weatherResponse = WeatherResponse(
  main: mainWeather,
  name: 'London',
  weather: [
    weatherFirst,
  ],
);
