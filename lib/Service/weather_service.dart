import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/Models/weather_model.dart';

class WeatherService {
  Dio dio;

  WeatherService(this.dio);

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '77bfde85eeae4540a75224126240610';

  Future<WeatherModel> getCurrentWeather({required String cityname}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=1',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(
        response.data,
      );
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops There Was An Error, Try Later.';
      throw Exception(
        errorMessage,
      );
    } catch (e) {
      log(
        e.toString(),
      );
      throw Exception(
        'There Was An Error, Try Later.',
      );
    }
  }
}
