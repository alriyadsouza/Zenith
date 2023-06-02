import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:industria_hub/screens/location_screen.dart';
import 'networking.dart';

class NewsDataFetcher {
  String headline = ''; // Initialize with empty string
  String description = ''; // Initialize with empty string

  Future<dynamic> getNewsData() async {
    // Replace 'YOUR_API_KEY' with your actual API key
    String apiKey = '90fe2817ff5744e38f91cc879aa346b0';
    String url = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=90fe2817ff5744e38f91cc879aa346b0';

    NetworkHelper networkHelper=NetworkHelper(url);

    var newsData= await networkHelper.getData();
    print('laaa $newsData');
    return newsData;
  }
}
