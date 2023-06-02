import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'forgot.password.dart';
import 'package:industria_hub/screens/connector.dart';
import 'package:industria_hub/screens/location_screen.dart';
import 'package:industria_hub/services/location.dart';
import 'package:industria_hub/services/networking.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginScreenWrapper extends StatefulWidget {
  @override
  _LoginScreenWrapperState createState() => _LoginScreenWrapperState();
}

class _LoginScreenWrapperState extends State<LoginScreenWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Start the animation when the widget is first built
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreen(animation: _opacityAnimation);
  }
}

class LoginScreen extends StatelessWidget {
  final Animation<double> animation;

  const LoginScreen({required this.animation});

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
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8 * animation.value),
                BlendMode.dstATop,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4 * animation.value),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        'Login! to Dive In',
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
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Password',
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
                      child: Hero(
                        tag: 'loginButton',
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConnectingScreen()),
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
                            'Log In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                        ),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    const Center(
                      child: Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.tealAccent),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
