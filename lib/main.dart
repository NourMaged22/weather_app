import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
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
              theme: ThemeData(
                primarySwatch: getDaytimeWeatherColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          }),
        ));
  }
}

MaterialColor getDaytimeWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.cyan;
  }

  switch (condition) {
    case 'Sunny':
      return Colors.yellow;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.lightBlue;
    case 'Patchy rain possible':
      return Colors.blue;
    case 'Patchy snow possible':
      return Colors.lightBlue;
    case 'Patchy sleet possible':
      return Colors.purple;
    case 'Patchy freezing drizzle possible':
      return Colors.purple;
    case 'Thundery outbreaks possible':
      return Colors.deepOrange;
    case 'Blowing snow':
      return Colors.blue;
    case 'Blizzard':
      return Colors.blue;
    case 'Fog':
      return Colors.grey;
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy light drizzle':
    case 'Light drizzle':
      return Colors.indigo;
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.indigo;
    case 'Patchy light rain':
    case 'Light rain':
      return Colors.blue;
    case 'Moderate rain at times':
    case 'Moderate rain':
      return Colors.blue;
    case 'Heavy rain at times':
      return Colors.blue;
    // Add more cases for other conditions as needed
    default:
      return Colors.green; // Default color for unhandled conditions
  }
}
