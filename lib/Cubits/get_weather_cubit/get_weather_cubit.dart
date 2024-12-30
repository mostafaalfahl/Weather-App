import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/Service/weather_service.dart';
import '../../Models/weather_model.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherIntialState());

  WeatherModel? weatherModel;

  getweather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityname: cityName);
      emit(
        WeatherSuccessState(weatherModel!),
      );
    } catch (e) {
      emit(
        WeatherFailuerState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
