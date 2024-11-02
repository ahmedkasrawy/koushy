import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:section_project_7th/view/HomePage.dart';
import 'package:section_project_7th/view/signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kisho Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.center,
        child: Lottie.asset(
          'assets/bird.json',
          fit: BoxFit.fill, // Ensures the animation covers the whole screen
          repeat: false,
          onLoaded: (composition) {
            Future.delayed(composition.duration, () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
              );
            });
          },
        ),
      ),
    );
  }
}