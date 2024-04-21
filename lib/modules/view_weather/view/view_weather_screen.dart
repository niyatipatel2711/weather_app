import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/utils/extensions.dart';

import '../../../base/base_error.dart';
import '../../../base/base_label.dart';
import '../../../base/base_text_field.dart';
import '../../../base/buttons.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/style_constants.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';

class ViewWeatherScreen extends StatefulWidget {
  const ViewWeatherScreen({Key? key}) : super(key: key);

  @override
  State<ViewWeatherScreen> createState() => _ViewWeatherScreenState();
}

class _ViewWeatherScreenState extends State<ViewWeatherScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  /// Controller which controls the value of city
  final TextEditingController _cityController = TextEditingController();

  bool _isButtonPressed = false;

  /// Bloc for fetching the details of weather
  late WeatherBloc _weatherBloc;

  /// Stores the details of weather
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc(WeatherStateUninitialized());
  }

  @override
  void dispose() {
    super.dispose();
    _formKey.currentState?.dispose();
    _cityController.dispose();
    _weatherBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.white,
        title: const Text(AppConstants.viewWeather),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _textField(
                        label: AppConstants.city,
                        hintText: AppConstants.enterCity,
                        controller: _cityController,
                        isRequired: true,
                      ).paddingBottom(20),
                      _weatherDetails(),
                    ],
                  ),
                ),
              ).paddingAll(16),
            ),
            _fetchWeatherBloc(),
          ],
        ),
      ),
    );
  }

  /// UI for showing weather details
  Widget _weatherDetails() {
    return Column(
      children: [
        _baseText(label: AppConstants.city, text: _weather?.areaName),
        _baseText(
            label: AppConstants.temperature,
            text: '${_weather?.temperature!.celsius?.toStringAsFixed(0)}°C'),
        _baseText(label: AppConstants.humidity, text: _weather?.humidity),
        _baseText(label: AppConstants.cloudiness, text: _weather?.cloudiness),
        _baseText(label: AppConstants.windSpeed, text: _weather?.windSpeed),
        _baseText(label: AppConstants.windDegree, text: _weather?.windDegree),
        _baseText(label: AppConstants.windGust, text: _weather?.windGust),
        _baseText(label: AppConstants.pressure, text: _weather?.pressure),
      ],
    ).visible(_weather != null);
  }

  /// Bloc consumer for handling state changes of weather bloc
  Widget _fetchWeatherBloc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer(
          bloc: _weatherBloc,
          listener: (context, state) {
            if (state is WeatherStateLoaded) {
              _weather = state.weather;
              setState(() {});
            } else if (state is WeatherStateError) {
              baseError(errorText: state.errorText, context: context);
            }
          },
          builder: (context, state) {
            if (state is WeatherStateLoading) {
              return Transform.scale(
                scale: 0.5,
                child: const CircularProgressIndicator(),
              ).center();
            }
            return _fetchWeatherButton();
          },
        )
      ],
    ).paddingVertical(16);
  }

  /// Fetch Weather button which calls the api for weather details
  Widget _fetchWeatherButton() {
    return Buttons.outlinedButton(
      context: context,
      text: AppConstants.fetchWeather,
      onTap: () {
        setState(() {
          _isButtonPressed = true;
        });
        if (_formKey.currentState?.validate() ?? false) {
          _weatherBloc.add(FetchWeather(city: _cityController.text));
          setState(() {
            _isButtonPressed = false;
          });
        }
      },
    );
  }

  Widget _baseText({required String label, dynamic text}) {
    return Text(
      '$label: $text',
      style: StyleConstants.labelFont14Black,
    ).paddingBottom(12).visible(text != null);
  }

  Widget _textField(
      {required String label,
      bool isRequired = false,
      String? hintText,
      required TextEditingController controller,
      TextInputType? textInputType}) {
    return Column(
      children: [
        BaseLabel(
          label: label,
          isRequired: isRequired,
        ).paddingBottom(8),
        BaseTextField(
          textInputType: textInputType,
          hintText: hintText,
          controller: controller,
          isRequired: true,
          isButtonPressed: _isButtonPressed,
          onChanged: (value) {
            if (_weather != null) {
              setState(() {
                _weather = null;
              });
            }
          },
        )
      ],
    ).paddingBottom(16);
  }
}
