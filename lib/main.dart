import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:FlutterWeather/widgets/widgets.dart';
import 'package:FlutterWeather/repositories/weather_api_client.dart';
import 'package:FlutterWeather/repositories/weather_repository.dart';


void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();


  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(weatherRepository: weatherRepository));
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Transition transition) {
    print(transition);
  }
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather',
      home: Weather(
        weatherRepository: weatherRepository,
      ),
    );
  }
}
