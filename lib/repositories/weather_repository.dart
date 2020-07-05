import 'package:meta/meta.dart';

import 'package:FlutterWeather/repositories/weather_api_client.dart';
import 'package:FlutterWeather/models/weather.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
    : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
