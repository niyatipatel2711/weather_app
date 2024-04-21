import 'package:flutter/material.dart';
import '../modules/view_weather/view/view_weather_screen.dart';

class ConstRoutes {
  static const String viewWeatherScreen = '/viewWeatherScreen';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ConstRoutes.viewWeatherScreen:
      return MaterialPageRoute(
          builder: (_) => const ViewWeatherScreen(), settings: settings);

    default:
      return MaterialPageRoute(
          builder: (_) => const ViewWeatherScreen(), settings: settings);
  }
}
