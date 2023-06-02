
import 'package:flutter/material.dart';
import 'package:industria_hub/screens/markets/market.dart';
import 'homePage.dart';


void main() {
  runApp(market());
}

class market extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Investment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: HomePage(),
    );
  }
}
