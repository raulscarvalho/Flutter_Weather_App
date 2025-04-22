import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import 'package:flutter_application_1/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPagetate();
}

class _WeatherPagetate extends State<WeatherPage> {
  // api key
  final _weatherService = WeatherService('6e0a7a7fa92a917cf00dc55da9a6dc59');
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // pegar a cidade
    String cityName = await _weatherService.getCurrentCity();

    // pegar o clima da cidade
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // weather animations

  // init state
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // nome da cidade
            Text(_weather?.cityName ?? "Carregando cidade.."),

            // temperatura
            Text('${_weather?.temperature.round()}°C'),
          ],
        ),
      ),
    );
  }
}
