import 'dart:async';
import 'package:dietplanner_project/screens/opening_sceens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 33, 80),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'HAPPY DIET.',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(width: 170),
              Text(
                'GOOD DIET, GOOD LIFE.',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Center(
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/appicon.png'))),
        ],
      ),
    );
  }
}
