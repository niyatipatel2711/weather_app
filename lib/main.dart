import 'package:flutter/material.dart';
import 'package:weather_app/utils/const_routes.dart';

import 'constants/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppConstants.weatherApp,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: ConstRoutes.viewWeatherScreen,
    );
  }
}
