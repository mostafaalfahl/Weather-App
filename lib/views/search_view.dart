import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';

import '../main.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    MaterialColor themeColor = getThemeColor(weatherModel?.condtion);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
        backgroundColor: getThemeColor(
          weatherModel?.condtion,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              themeColor,
              themeColor[300]!,
              themeColor[50]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              controller: controller,
              cursorColor: themeColor,
              onSubmitted: (value) {
                fetchWeatherAndPop(context, value);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                hintText: 'Enter City Name',
                label: Text(
                  'Search',
                  style: TextStyle(color: themeColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: themeColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: getThemeColor(weatherModel?.condtion),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    fetchWeatherAndPop(
                      context,
                      controller.text,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void fetchWeatherAndPop(BuildContext context, String cityName) async {
    var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    getWeatherCubit.getweather(cityName: cityName);
    Navigator.pop(context);
  }
}
