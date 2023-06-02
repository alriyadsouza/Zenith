import 'package:flutter/material.dart';
import 'package:industria_hub/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 50.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter the city Name',
                              hintStyle: TextStyle(color: Colors.white54),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.tealAccent,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 16.0,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                cityName = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, cityName); // Do something with the cityName
                    },
                    child: const Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

