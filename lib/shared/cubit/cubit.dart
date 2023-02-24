import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2023_comeback/shared/cubit/states.dart';

import '../network/remote/dio_helper.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit():super(WeatherInitialState());
  static WeatherCubit get(context)=>BlocProvider.of(context);


  Map<String,dynamic>? current;
  List<dynamic> currentHours=[];
  List<dynamic> forcast=[];

  getWeatherData(){
    emit(WeatherGetDataLoadingState());
     DioHelper.getWeatherData(
      url:"forecast.json",
      query: {
        "key":"071793aed7c84c3ba00145123222012",
        "q":"cairo",
        "days":"7",
        "aqi": "no",
        "alerts": "no",

      }
    ).then((value) {
      current={
        "location":value.data["location"]["name"],
        "date":value.data["forecast"]["forecastday"][0]["date"],
        "condition":value.data["current"]["condition"]["text"],
        "temp":value.data["current"]["temp_c"],
        "wind":value.data["current"]["wind_kph"],
        "humidity":value.data["current"]["humidity"],
        "vision":value.data["current"]["vis_km"],

      };
      currentHours=value.data["forecast"]["forecastday"][0]["hour"];
      forcast=value.data["forecast"]["forecastday"];
      // print(current.toString());
      print(currentHours.toString());
      emit(WeatherGetDataSuccessfullyState());

    }).catchError((error){
      emit(WeatherGetDataErrorState(error.toString()));
    });
  }
}