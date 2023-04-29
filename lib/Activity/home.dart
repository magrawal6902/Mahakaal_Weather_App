import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String air = ((info['air_speed_value']).toString());
    String temp = ((info['temp_value']).toString());
    if(temp == "Error"){
      
    }
    else{
      temp = ((info['temp_value']).toString()).substring(0,4);
      air = ((info['air_speed_value']).toString()).substring(0,4);
    }
    
    String icon = info['icon_value'];
    String city = info['city_value'];
    String hum = info['hum_value'];
    
    String desc = info['des_value'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container( 
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blueAccent, Colors.lightBlue])),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "") == ""){
                            print("Blank");
                          }
                          else{
                            Navigator.pushReplacementNamed(context,  "/loading", arguments: {
                              "searchCity" : searchController.text,
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                            controller: searchController,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Any City Name"),
                      )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white.withOpacity(0.2)),
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text(
                                  "$desc",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "In $city",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ])),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.2)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: EdgeInsets.fromLTRB(26, 26, 26, 26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.wiThermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$temp",
                                  style: TextStyle(fontSize: 90),
                                ),
                                Text(
                                  "C",
                                  style: TextStyle(fontSize: 30),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.2)),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.wiDayWindy)],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "$air",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("km/hr")
                          ],
                        ),
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.2)),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.wiHumidity)],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "$hum",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("Percent")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                    child: Column(
                  children: [
                    Text("Made By Medhansh"),
                    Text("Data Provided By "),
                    Text(
                      "OPEN WEATHER MAP",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("Jai Mahakaal")
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
