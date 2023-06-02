import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'login.dart';
import 'register_screen.dart';

class StartingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: 'https://cdn.dribbble.com/users/189524/screenshots/2103470/01-black-cat_800x600_v1.gif',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180.0,
                  height: 20.0,
                  child: Divider(
                    color: Colors.teal[900],
                  ),
                ),
                const Text(
                  'IndustriaHub',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 180.0,
                  height: 20.0,
                  child: Divider(
                    color: Colors.teal[900],
                  ),
                ),
                const SizedBox(
                  width: 180.0,
                  height: 300.0,
                ),
                SizedBox(
                  width: 180.0,
                  height: 20.0,
                  child: Divider(
                    color: Colors.teal[900],
                  ),
                ),
                const SizedBox(
                  width: 180.0,
                  height: 30.0,
                ),
                Hero(
                  tag: 'loginButton',
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreenWrapper()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                    child: Text('Login'),
                  ),
                ),
                Hero(
                  tag: 'registerButton',
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                    child: Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
