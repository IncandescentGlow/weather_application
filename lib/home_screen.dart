import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_application/weather.dart';
import 'package:weather_application/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherService weatherService = WeatherService();

  @override
  void initState() {
    // function pertama kali dipanggil setelah suatu
    // widget ud dibuat (sblm build)
    super.initState();
    this.getWeather();
  }

  void getWeather() async {
    await weatherService.getWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(weatherService: weatherService);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF00203F),
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 50,
          ),
        ));
  }
}
