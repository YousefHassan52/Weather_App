import 'package:dio/dio.dart';

class DioHelper{
static late Dio dio;
static init(){
  dio=Dio(BaseOptions(
    baseUrl: "http://api.weatherapi.com/v1/",
    receiveDataWhenStatusError: true,
  ));
}

 static Future<Response> getWeatherData({
  required String url,
  required Map<String,dynamic> query,
})async{
  return await dio.get(url,queryParameters: query).catchError((error){print("error: ${error.toString()}}");});
}
}