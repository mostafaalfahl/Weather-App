import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

import 'Cubits/get_weather_cubit/get_weather_state.dart';

void main() {
  runApp(
    const WeatherApp(),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange; // Bright and warm for sunny days
    case 'Clear':
      return Colors.blue; // Clear and calm, blue sky or night
    case 'Partly cloudy':
      return Colors.blueGrey; // Slightly cloudy but still neutral
    case 'Cloudy':
      return Colors.grey; // Full cloud cover
    case 'Overcast':
      return Colors.grey; // Heavier clouds
    case 'Mist':
      return Colors.cyan; // Light and foggy
    case 'Patchy rain possible':
      return Colors.lightBlue; // Light rain with potential for sunny breaks
    case 'Patchy snow possible':
      return Colors.lightBlue; // Light snow chances
    case 'Patchy sleet possible':
      return Colors.grey; // Light sleet or icy mix
    case 'Patchy freezing drizzle possible':
      return Colors.blue; // Freezing rain and drizzle
    case 'Thundery outbreaks possible':
      return Colors.deepOrange; // Stormy and thundery
    case 'Blowing snow':
      return Colors.blue; // Windy with snow
    case 'Blizzard':
      return Colors.deepPurple; // Intense cold and snow
    case 'Fog':
      return Colors.teal; // Low visibility, foggy
    case 'Freezing fog':
      return Colors.indigo; // Foggy and freezing
    case 'Patchy light drizzle':
      return Colors.lightGreen; // Light drizzle, calm
    case 'Light drizzle':
      return Colors.green; // Consistent light drizzle
    case 'Freezing drizzle':
      return Colors.blue; // Freezing rain, icy
    case 'Heavy freezing drizzle':
      return Colors.blue; // Colder and icier conditions
    case 'Patchy light rain':
      return Colors.lightBlue; // Light rain with some breaks
    case 'Light rain':
      return Colors.blue; // Constant light rain
    case 'Moderate rain at times':
      return Colors.blueGrey; // Periods of moderate rain
    case 'Moderate rain':
      return Colors.indigo; // Continuous moderate rain
    case 'Heavy rain at times':
      return Colors.deepPurple; // Heavy rain at intervals
    case 'Heavy rain':
      return Colors.deepPurple; // Continuous heavy rain
    case 'Light freezing rain':
      return Colors.cyan; // Icy, light freezing rain
    case 'Moderate or heavy freezing rain':
      return Colors.cyan; // More intense freezing rain
    case 'Light sleet':
      return Colors.teal; // Light sleet
    case 'Moderate or heavy sleet':
      return Colors.teal; // Heavier sleet
    case 'Patchy light snow':
      return Colors.lightBlue; // Light snow
    case 'Light snow':
      return Colors.blue; // Snowing lightly
    case 'Patchy moderate snow':
      return Colors.blueGrey; // More intense snow at times
    case 'Moderate snow':
      return Colors.indigo; // Steady moderate snow
    case 'Patchy heavy snow':
      return Colors.deepPurple; // Heavier snow at intervals
    case 'Heavy snow':
      return Colors.deepPurple; // Heavy snowfall
    case 'Ice pellets':
      return Colors.cyan; // Frozen rain or pellets
    case 'Light rain shower':
      return Colors.lightBlue; // Showers of light rain
    case 'Moderate or heavy rain shower':
      return Colors.blue; // More intense rain showers
    case 'Torrential rain shower':
      return Colors.deepPurple; // Intense, torrential rain
    case 'Light sleet showers':
      return Colors.teal; // Sleet but lighter
    case 'Moderate or heavy sleet showers':
      return Colors.teal; // More intense sleet showers
    case 'Light snow showers':
      return Colors.lightBlue; // Light snow showers
    case 'Moderate or heavy snow showers':
      return Colors.blue; // Heavy snow showers
    case 'Light showers of ice pellets':
      return Colors.cyan; // Light ice pellet showers
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan; // Heavier ice pellet showers
    case 'Patchy light rain with thunder':
      return Colors.deepOrange; // Light rain with thunder
    case 'Moderate or heavy rain with thunder':
      return Colors.deepOrange; // Intense rain with thunder
    case 'Patchy light snow with thunder':
      return Colors.indigo; // Snow with thunder
    case 'Moderate or heavy snow with thunder':
      return Colors.indigo; // Intense snow with thunder
    default:
      return Colors.blue; // Default for unknown conditions
  }
}
