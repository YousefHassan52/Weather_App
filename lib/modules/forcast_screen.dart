import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_2023_comeback/shared/component/components.dart';
import 'package:weather_app_2023_comeback/shared/cubit/cubit.dart';

import '../shared/cubit/states.dart';
class ForcastScreen extends StatelessWidget {
  const ForcastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      builder: (context,state){
        var cubit=WeatherCubit.get(context);
        var forcast=cubit.forcast;
        return Scaffold(body: forcastList(forcast));
      },
      listener: (context,state){},
      );

  }
}
