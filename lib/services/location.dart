import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Handle the case when the user denies permission
        print('Location permission denied');
      } else if (permission == LocationPermission.deniedForever) {
        // Handle the case when the user denies permission permanently
        print('Location permission permanently denied');
      } else {
        // Permission granted or already granted
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
        );
        latitude=position.latitude;
        longitude=position.longitude;
      }
    }
    catch(e)
    {
      print(e);
    }
  }
}