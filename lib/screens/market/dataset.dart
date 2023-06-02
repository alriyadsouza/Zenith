import 'package:flutter/material.dart';

class LastInvestmentData{
  final int value;
  final String name;
  LastInvestmentData({required this.value,required this.name});
}

List<LastInvestmentData> lastInvestment=[
  LastInvestmentData(value: 33624,name: "Twitter, Inc. ao"),
  LastInvestmentData(value: 23864, name: "Tesla, Inc. ao"),
  LastInvestmentData(value: 20724, name: "Volkswagon, Inc.ao")
];

class Recommended{
  final String name;
  final String subtitle;
  final String icon;
  final String value;
  Recommended({required this.name, required this.subtitle, required this.icon, required this.value});
}

List<Recommended> recommendedList=[
  Recommended(name: "Netflix, Inc. ao",subtitle: "Blu-ray Disk, DVD",value: "+189%",icon: "assets/netflix.jpg"),
  Recommended(name: "Ozon, Inc. ao",subtitle: "Online store",value: "+173%",icon: "assets/ozon.jpg"),
  Recommended(name: "Tesla, Inc. ao",subtitle: "Automotive industry",value: "+189%",icon: "assets/tesla.jpg"),
];
