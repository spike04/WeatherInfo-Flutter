import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_info/core/extensions/temperature.dart';
import 'package:weather_info/core/locator.dart';

import 'weather_view_model.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: const Text('Weather Info'),
      ),
      body: ViewModelBuilder<WeatherViewModel>.reactive(
        viewModelBuilder: () => locator<WeatherViewModel>(),
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: model.onCityNameChanged,
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: 'City Name',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    model.isBusy
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: model.canSubmit ? model.submit : null,
                            child: const Icon(Icons.search),
                          ),
                  ],
                ),
                const SizedBox(height: 16.0),
                if (model.hasError)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${model.modelError.message}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16.0),
                          const Text('Try New City Name'),
                        ],
                      ),
                    ),
                  ),
                if (model.weather != null) ...[
                  const SizedBox(height: 48.0),
                  Text(
                    model.name!,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 24.0),
                  Image.network(
                    'http://openweathermap.org/img/wn/${model.weather!.icon}@2x.png',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    model.weather!.main,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    model.weather!.description,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 48.0),
                  Text(
                    model.main!.temp.toDegreesCelsius,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    model.main!.temp.toDegreesFahrenheit,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
