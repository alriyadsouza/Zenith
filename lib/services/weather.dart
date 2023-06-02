import 'package:industria_hub/services/location.dart';
import 'package:industria_hub/services/networking.dart';
import 'package:industria_hub/screens/location_screen.dart';

const apiKey = 'd83b3923f81bd66bb41577b8fdf1775b';
const openWeatherMapURL= 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    var url='$openWeatherMapURL?q=$cityName&aapid=$apiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url);

    var weatherData= await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic>  getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    if (location.latitude == null || location.longitude == null) {
      var weatherData=null; // Location data not available
    }

    NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );

    var weatherData = await networkHelper.getData();

    return weatherData;
  }
  String getWeatherIcon(int condition) {
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

  String getMessage(int temp) {
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
