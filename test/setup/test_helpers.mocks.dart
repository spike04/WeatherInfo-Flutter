// Mocks generated by Mockito 5.2.0 from annotations
// in weather_info/test/setup/test_helpers.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_info/core/models/weather_response.dart' as _i2;
import 'package:weather_info/core/services/weather_service.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeWeatherResponse_0 extends _i1.Fake implements _i2.WeatherResponse {}

/// A class which mocks [WeatherService].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherService extends _i1.Mock implements _i3.WeatherService {
  MockWeatherService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get apiKey =>
      (super.noSuchMethod(Invocation.getter(#apiKey), returnValue: '')
          as String);
  @override
  set apiKey(String? _apiKey) =>
      super.noSuchMethod(Invocation.setter(#apiKey, _apiKey),
          returnValueForMissingStub: null);
  @override
  _i4.Future<_i2.WeatherResponse> getWeatherForCity({String? city}) => (super
          .noSuchMethod(
              Invocation.method(#getWeatherForCity, [], {#city: city}),
              returnValue:
                  Future<_i2.WeatherResponse>.value(_FakeWeatherResponse_0()))
      as _i4.Future<_i2.WeatherResponse>);
}
