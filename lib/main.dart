import 'package:FlutterWeather/bloc/settings/settings_bloc.dart';
import 'package:FlutterWeather/bloc/weather/weather_bloc.dart';
import 'package:FlutterWeather/repositories/weather_api_client.dart';
import 'package:FlutterWeather/repositories/weather_repository.dart';
import 'package:FlutterWeather/simple_bloc_observer.dart';
import 'package:FlutterWeather/widgets/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
        ),
      ],
      child: App(weatherRepository: weatherRepository),
    ),
  );
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
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: weatherRepository),
        child: Weather(),
      ),
    );
  }
}
