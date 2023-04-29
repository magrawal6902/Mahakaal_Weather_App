import 'package:http/http.dart';
import 'dart:convert';
class worker
{

  String location;

  //Constructor

  worker({required this.location})
  {
    location = this.location;
  }


  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;


  //method =
  Future<void> getData() async
  {
    try {
      Response response = await get(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=dc319bf4c16bb17d6c54b6ddfbee117f");
      Map data = jsonDecode(response.body);

      //Getting Temp,Humidiy
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp']-273.15;

      //Getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind["speed"]/0.27777777777778;


      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];
      String getIcon = weather_main_data["icon"];


      //Assigning Values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
      icon = getIcon.toString();

    } catch(e){
      temp = "Error";
      humidity = "Error";
      air_speed = "Error";
      description = "Error";
      main = "Error";
      icon = "03n";
    }

  }


}