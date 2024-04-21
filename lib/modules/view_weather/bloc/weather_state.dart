import 'package:weather/weather.dart';

abstract class WeatherState {}

class WeatherStateUninitialized extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateLoaded extends WeatherState {
  final Weather weather;

  WeatherStateLoaded({required this.weather});
}

class WeatherStateError extends WeatherState {
  final String errorText;

  WeatherStateError({required this.errorText});
}