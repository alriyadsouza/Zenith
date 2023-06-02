import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'starting_page.dart';

const apiKey = 'd83b3923f81bd66bb41577b8fdf1775b';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getStartingPage();
  }

  void getStartingPage() async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StartingPage(),
      ),
    );
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
