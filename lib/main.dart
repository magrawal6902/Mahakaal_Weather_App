import 'package:flutter/material.dart';
import 'package:mahakaal/Activity/home.dart';
import 'package:mahakaal/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/loading" : (context) => Loading(),
    },
  ));
}