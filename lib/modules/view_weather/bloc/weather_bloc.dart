import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/view_weather/bloc/weather_event.dart';
import 'package:weather_app/modules/view_weather/bloc/weather_state.dart';

import '../view_model/view_weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(WeatherState initialState) : super(initialState) {
    on<FetchWeather>((event, emit) async {
      try {
        emit(WeatherStateLoading());
        final response =
            await ViewWeatherRepository.getWeather(city: event.city);
        emit(WeatherStateLoaded(weather: response));
      } catch (e) {
        emit(WeatherStateError(errorText: e.toString()));
      }
    });
  }
}
