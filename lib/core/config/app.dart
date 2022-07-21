import 'package:stacked/stacked_annotations.dart';
import 'package:weather_info/features/weather/weather_view.dart';

@StackedApp(routes: [
  MaterialRoute(
    page: WeatherView,
    initial: true,
  ),
])
class App {
  // * This class has no purpose besides housing
  // * the annotation that generates  the required functionality
}
