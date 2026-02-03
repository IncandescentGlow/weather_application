import 'package:flutter/material.dart';
import 'package:weather_application/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather App',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFE291B4)),
      home: HomeScreen(),
    );
  }
}
