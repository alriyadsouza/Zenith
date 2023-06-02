import 'package:flutter/material.dart';
import 'package:industria_hub/screens/appbar/profile_update.dart';

void main() {
  runApp(UserProfile());
}

class UserProfile extends StatelessWidget {
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
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/location_background.jpg'),

                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Username: JohnDoe',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Name: John Doe',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfileUpdate()),
                      );
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
