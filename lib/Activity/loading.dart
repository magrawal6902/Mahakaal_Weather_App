import 'package:flutter/material.dart';
import 'package:mahakaal/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

String city = "Bhopal";
late String temp;
late String hum;
late String air_speed;
late String des;
late String main;
late String icon;

  void startApp(String city) async
  {
    worker instance  = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 1), (){
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "des_value" : des,
        "main_value" : main,
        "icon_value" : icon,
        "city_value" : city
      });
    });

  }

  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map search_city = ModalRoute.of(context)!.settings.arguments as Map;

    if(search_city?.isNotEmpty ?? false){
      city = search_city['searchCity'];
    }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/mlogo.png"),
            Text("Mahakal Mausam App", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Text("Made By Medhansh Agrawal", style: TextStyle(fontSize: 20),),
            SizedBox(height: 50,),
            SpinKitFadingCube(
              color: Colors.blue,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}