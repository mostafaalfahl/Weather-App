import 'package:weather_app/Models/weather_model.dart';

abstract class WeatherState {}

class WeatherIntialState extends WeatherState {}
class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccessState(this.weatherModel);
}

class WeatherFailuerState extends WeatherState {
  final String errorMessage;

  WeatherFailuerState({
    required this.errorMessage,
  });
}
