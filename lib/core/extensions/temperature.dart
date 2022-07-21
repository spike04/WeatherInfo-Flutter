extension TemperatureExtension on double {
  String get toDegreesCelsius {
    return '${(this - 273.15).toStringAsFixed(1)}°C';
  }

  String get toDegreesFahrenheit {
    return '${(this * 9 / 5 - 459.67).toStringAsFixed(1)}°F';
  }
}
