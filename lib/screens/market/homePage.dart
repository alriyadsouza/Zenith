import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'lastInvestment.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF020063),
        leading:
            IconButton(icon: Icon(Icons.menu), onPressed: () => print("menu")),
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () => print("menu"))
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Color(0xFF020063),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LastInvestment(),
            ],
          ),
        ],
      ),
    );
  }
}


