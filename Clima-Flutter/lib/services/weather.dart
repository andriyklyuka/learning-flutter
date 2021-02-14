import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '3c7e91e835cef7438abf3f67c05bd109';
const openWeatherApi = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocationData();

    NetworkHelper networkHelper = new NetworkHelper(
        url: '$openWeatherApi?'
            'lat=${location.latitude}&lon=${location.longitude}'
            '&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }

  Future<dynamic> getWeatherByCity({String city}) async {
    Location location = Location();
    await location.getLocationData();

    NetworkHelper networkHelper = new NetworkHelper(
        url: '$openWeatherApi?'
            'q=$city'
            '&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
