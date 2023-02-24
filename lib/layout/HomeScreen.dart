import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradients/gradients.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app_2023_comeback/shared/component/components.dart';
import 'package:weather_app_2023_comeback/shared/cubit/states.dart';

import '../shared/cubit/cubit.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      builder: (context,state){
        var cubit=WeatherCubit.get(context);
        var map=cubit.current;
        var hour=cubit.currentHours;
        return Scaffold(
          backgroundColor: HexColor("#f3ebfc"),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: HexColor("#f3ebfc"),
            leading: IconButton(onPressed: (){},icon: Icon(Icons.menu,color: Colors.black,),),
            title: Text("Cairo",style: TextStyle(color: Colors.black),),
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){},icon: Icon(Icons.sunny,color: Colors.black,)),
            ],
          ),
          body: townItem(map,hour,context),
        );
      },
      listener: (context,state){},

    );
  }
}
