import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2023_comeback/layout/HomeScreen.dart';
import 'package:weather_app_2023_comeback/shared/cubit/cubit.dart';
import 'package:weather_app_2023_comeback/shared/network/remote/dio_helper.dart';
import 'package:weather_app_2023_comeback/shared/observer/observer.dart';

void main() {
  DioHelper.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>WeatherCubit()..getWeatherData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
