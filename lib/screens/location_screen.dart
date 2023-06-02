import 'package:flutter/material.dart';
import 'package:industria_hub/utilities/constants.dart';
import 'package:industria_hub/services/weather.dart';
import 'city_screen.dart';
import 'package:industria_hub/screens/appbar/profile.dart';

import 'markets/market.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  final newsHeadline;
  final heading;

  LocationScreen({this.locationWeather, this.newsHeadline, this.heading});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late double temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;
  late String description;
  late String headline;
  late String heading2;
  late String newsMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
    updateUI2(widget.heading);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0.0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data!';
        cityName = '';
        return;
      }
      temperature = weatherData['main']['temp'].toDouble();

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      weatherMessage = weather.getMessage(temperature.toInt());
      cityName = weatherData['name'];
    });
  }

  void updateUI2(dynamic newsData) {
    setState(() {
      if (newsData == null) {
        heading2 = '';
        newsMessage = 'Unable to get weather data!';
        return;
      }
      headline = newsData['articles'][6]['title'];
      description = newsData['articles'][6]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        title: Text('Home'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              TextButton(
                onPressed: () async {
                  var weatherData = await weather.getLocationWeather();
                  updateUI(weatherData);
                },
                child: const Icon(
                  Icons.near_me,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  var typeName = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CityScreen();
                      },
                    ),
                  );
                  if (typeName != null) {
                    var weatherData = await weather.getCityWeather(typeName);
                    updateUI(weatherData);
                  }
                },
                child: const Icon(
                  Icons.location_city,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfile()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/doodle-app.webp'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8),
                  BlendMode.dstATop,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 50, top: 30, left: 30, right: 30),
                      child: Column(
                        children: [
                          Container(
                            height: 150.0,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                  color: Colors.tealAccent.withOpacity(0.3),
                                  width: 3.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '$temperature°',
                                            style: kTempTextStyle,
                                          ),
                                          Text(
                                            weatherIcon,
                                            style: kConditionTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.0),
                                      child: Text(
                                        '$weatherMessage in $cityName',
                                        textAlign: TextAlign.right,
                                        style: kMessageTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 180.0,
                            height: 20.0,
                            child: Divider(
                              color: Colors.teal[900],
                            ),
                          ),
                          const Text('Top stories today',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          Container(
                            height: 250.0,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                  color: Colors.tealAccent.withOpacity(0.3),
                                  width: 3.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: Text(
                                                '$headline',
                                                style: const TextStyle(
                                                  fontFamily: 'Spartan MB',
                                                  fontSize: 20.0,
                                                ),
                                                overflow: TextOverflow.clip, // Adjust the overflow behavior as needed
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.0),
                                      child: Text(
                                        '$description',
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                          fontFamily: 'Spartan MB',
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AppBar(
            backgroundColor: Colors.grey.shade500,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Navigate to the home page
                  // Implement the navigation logic here
                },
                tooltip: 'Home',
              ),
              Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.query_stats_outlined,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Market()),
                  );
                },
                tooltip: 'Market',
              ),
              Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.place,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Navigate to the placesuitable page
                  // Implement the navigation logic here
                },
                tooltip: 'Locate',
              ),
              Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Navigate to the costplan page
                  // Implement the navigation logic here
                },
                tooltip: 'CostPlan',
              ),
              Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.question_answer_outlined,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Navigate to the placesuitable page
                  // Implement the navigation logic here
                },
                tooltip: 'F&Q',
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
