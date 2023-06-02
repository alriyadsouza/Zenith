import 'package:flutter/material.dart';
import 'reset_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('images/doodle-app.webp'),
            fit: BoxFit.cover,
          ), // Black background color
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8),
              BlendMode
                  .dstATop), // Adjust the opacity value here (0.2 in this example)
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
                    'Forgot Password?',
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
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.tealAccent,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    child: Text(
                      'Back to Log In',
                      style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 14,
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


