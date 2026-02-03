import 'dart:convert';
import 'location.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  double? temperature;
  String? weatherIcon;
  String? cityName;

  static const String apiKey = 'bafdc529c01031fc1dd8232094dc8b90';

  Future<bool> getWeatherData() async {
    final locationService = LocationService();
    await locationService.getCurrentLocation();

    final lat = locationService.latitude;
    final lon = locationService.longitude;

    if (lat == null || lon == null) {
      print('Location is null');
      return false;
    }

    final uri = Uri.https(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': lat.toString(),
        'lon': lon.toString(),
        'appid': apiKey,
        'units': 'metric',
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final weatherData = jsonDecode(response.body);

      temperature = (weatherData['main']['temp'] as num).toDouble();
      weatherIcon = weatherData['weather'][0]['icon'];
      cityName = weatherData['name'];

      return true;
    }

    return false;
  }
}
