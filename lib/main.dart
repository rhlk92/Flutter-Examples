import 'package:FlutterWeather/bloc/weather_bloc.dart';
import 'package:FlutterWeather/repositories/weather_api_client.dart';
import 'package:FlutterWeather/repositories/weather_repository.dart';
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

  runApp(App(weatherRepository: weatherRepository));
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('onEvent $event');
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition $transition');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('onError $error');
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
