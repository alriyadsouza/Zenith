import 'package:flutter/material.dart';
import 'connector.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectingScreen(), // Wrap ConnectingScreen in the body property
    );
  }
}
