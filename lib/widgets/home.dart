import 'package:FlutterWeather/bloc/bloc.dart';
import 'package:FlutterWeather/repositories/repositories.dart';
import 'package:FlutterWeather/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository)),
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
        ),
      ],
      child: Weather(),
    );
  }
}
