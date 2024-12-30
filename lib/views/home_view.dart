import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import '../Cubits/get_weather_cubit/get_weather_state.dart';
import '../main.dart';
import 'search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Weather App'),
            backgroundColor: getThemeColor(
              BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condtion,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchView(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          body: _getBody(state),
        );
      },
    );
  }
}

Widget _getBody(state) {
  if (state is WeatherLoadingState) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  } else if (state is WeatherSuccessState) {
    return WeatherInfoBody(weather: state.weatherModel);
  } else if (state is WeatherFailuerState) {
    return const Text('There Was An Error, Try Later.');
  } else {
    return NoWeatherBody();
  }
}
