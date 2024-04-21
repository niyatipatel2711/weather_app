import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/constants/app_constants.dart';
import 'package:weather_app/constants/string_constants.dart';

class ViewWeatherRepository {
  static getWeather({required String city}) async {
    /// Checks for the internet connectivity before making an api call
    var connectivityResult = await Connectivity().checkConnectivity();
    /// if internet connection is not there then error message will be thrown
    if (connectivityResult == ConnectivityResult.none) {
      throw AppConstants.noInternetConnection;
    }
    /// Making an api call for fetching the weather details of a city
    try {
      WeatherFactory weatherFactory =
          WeatherFactory(StringConstants.openWeatherApiKey);
      Weather weather = await weatherFactory.currentWeatherByCityName(city);
      return weather;
    } /// If there is an error of OpenWeatherApiException then that will be handled here
    on OpenWeatherAPIException catch (e) {
      if (e.toString().contains('404')) {
        throw AppConstants.cityNotFound;
      }
      throw AppConstants.somethingWentWrong;
    } catch (e) {
      throw AppConstants.somethingWentWrong;
    }
  }
}
