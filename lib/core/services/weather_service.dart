import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/weather_response.dart';

class WeatherService {
  String apiKey;

  WeatherService({required this.apiKey});

  Future<WeatherResponse> getWeatherForCity({
    required String city,
  }) async {
    try {
      String url =
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return WeatherResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load weather info');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
