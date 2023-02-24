import 'package:flutter/material.dart';
import 'package:gradients/gradients.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app_2023_comeback/modules/forcast_screen.dart';
Widget hourItem(hour){
  return Container(
    height: 150.0,
    decoration:BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white,
    ) ,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${hour["temp_c"]}°C",

            style: const TextStyle(fontWeight: FontWeight.bold),),
          Image.network(
              'http:${hour["condition"]["icon"]}'),
          const SizedBox(
            height: 5,
          ),
          Text("${hour["time"]}".substring("${hour["time"]}".length-5),style: const TextStyle(fontWeight: FontWeight.w100,color: Colors.grey),),
        ],
      ),
    ),
  );// hour item
}

Widget townItem(current,hour,context){
  return current!=null? Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
      child: Column(

        children: [
          Container(
              width: 120.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),


              ),
              child: Text("${current["date"]}")),
          const SizedBox(height: 10,),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              gradient: LinearGradientPainter(
                colors: <HexColor>[
                  HexColor("#004e92 "),
                  HexColor("#de6262"),
                  HexColor("#ffb88c"),
                ],
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${current["condition"]}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                Text("${current["temp"]}°C",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),)
              ],

            ),
          ),
          SizedBox(height: 20,),

          Container(
            alignment: Alignment.center,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),


            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,


                    children: [
                      Icon(Icons.air),
                      SizedBox(height: 2.0,),
                      Text("${current["wind"]} km/h",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 2.0,),
                      Text("Wind",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100),)
                    ],),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,


                    children: [
                      Icon(Icons.water_drop),
                      SizedBox(height: 2.0,),
                      Text("${current["humidity"]} %",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 2.0,),
                      Text("Humidity",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100),)
                    ],),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,


                    children: [
                      Icon(Icons.remove_red_eye_outlined),
                      SizedBox(height: 2.0,),
                      Text("${current["vision"]} km",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 2.0,),
                      Text("Visibilty",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100),)
                    ],),
                ),



              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(children: [
            Text("Today",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            Expanded(child: Container()),
            Container(
              alignment: Alignment.center,
              width: 110.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradientPainter(
                  colors: <HexColor>[
                    HexColor("#004e92 "),
                    HexColor("#de6262"),
                    HexColor("#ffb88c"),
                  ],
                ),
              ),
              child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    //backgroundColor: Colors.white60,
                  ),
                  onPressed: (){
                    navigateTo(context, ForcastScreen());

                  },child: Text("Next 7 Days  >",style: TextStyle(fontWeight: FontWeight.bold),)),)
          ],),
          SizedBox(height: 25,),
          Container(
            height: 160,
            child: ListView.separated(
                itemBuilder:(context,index)=>hourItem(hour[index]),// hour item
                separatorBuilder: (context,index)=>SizedBox(width: 10.0,),
                itemCount: hour.length,
                scrollDirection: Axis.horizontal,
            ),
          ),




        ],
      ),
    ),
  ):Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircularProgressIndicator(
        color: Colors.black,
      ),
      SizedBox(height: 30,),
      Text("Loading...",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60,color: Colors.black),),
    ],
  ));
}

Widget forcastList(forcast){

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,

      child: ListView.separated(
          itemBuilder: (context,index)=>forcastElement(forcast[index]),
          separatorBuilder: (context,index)=>Container(
            height: 2.0,
            width: 1.0,
            color: Colors.black,
          ),
          itemCount: forcast.length,
        scrollDirection: Axis.vertical,
      ),
    ),
  );
}

Widget forcastElement(forcast){

  return Container(
    width: double.infinity,
    child: Column(

      children: [
        Container(
            width: 120.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),


            ),
            child: Text("${forcast["date"]}")),
        SizedBox(height: 10,),
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            gradient: LinearGradientPainter(
              colors: <HexColor>[
                HexColor("#004e92 "),
                HexColor("#de6262"),
                HexColor("#ffb88c"),
              ],
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${forcast["day"]["condition"]["text"]}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
              SizedBox(height: 20,),
              Text("${forcast["day"]["avgtemp_c"]}°C",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),)
            ],

          ),
        ),
        SizedBox(height: 20,),

        Container(
          alignment: Alignment.center,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),


          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,


                  children: [
                    Icon(Icons.air),
                    SizedBox(height: 2.0,),
                    Text("${forcast["day"]["maxwind_kph"]} km/h",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 2.0,),
                    Text("Wind",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100),)
                  ],),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,


                  children: [
                    Icon(Icons.water_drop),
                    SizedBox(height: 2.0,),
                    Text("${forcast["day"]["avghumidity"]} %",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 2.0,),
                    Text("Humidity",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100),)
                  ],),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,


                  children: [
                    Icon(Icons.remove_red_eye_outlined),
                    SizedBox(height: 2.0,),
                    Text("${forcast["day"]["avgvis_km"]} km",style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 2.0,),
                    const Text("Visibilty",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w100),)
                  ],),
              ),



            ],
          ),
        ),





      ],
    ),
  );
}


void navigateTo(context,widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
}