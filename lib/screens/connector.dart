// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:industria_hub/screens/location_screen.dart';
import 'package:industria_hub/services/weather.dart';

import '../services/news.dart';


class ConnectingScreen extends StatefulWidget {
  @override
  _ConnectingScreenState createState() => _ConnectingScreenState();
}

class _ConnectingScreenState extends State<ConnectingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {

    WeatherModel weatherModel=WeatherModel();
    var weatherData= await weatherModel.getLocationWeather();
    NewsDataFetcher newsDataFetcher=NewsDataFetcher();
    var newsData= await newsDataFetcher.getNewsData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData, heading:newsData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
