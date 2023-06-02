import 'package:flutter/material.dart';

void main() {
  runApp(UserProfileUpdate());
}

class UserProfileUpdate extends StatelessWidget {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'User Profile',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 32.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Username',
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
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Name',
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
                  ),
                ),
                SizedBox(height: 32.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle other credentials update functionality
                      // Implement the logic to update other credentials for the user
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text(
                      'Update Credentials',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}