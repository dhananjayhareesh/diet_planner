import 'dart:async';
import 'package:dietplanner_project/views/opening_sceens/onboarding_screen.dart';
import 'package:dietplanner_project/views/bottom_nav_screens/main_bottom.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkFinishButtonClicked();
  }

  Future<void> checkFinishButtonClicked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool finishButtonClicked = prefs.getBool('finishButtonClicked') ?? false;

    if (finishButtonClicked) {
      navigateToMainBottom();
    } else {
      Timer(const Duration(seconds: 3), () {
        navigateToOnBoardScreen();
      });
    }
  }

  void navigateToOnBoardScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardScreen()),
    );
  }

  void navigateToMainBottom() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainBottom()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 33, 80),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'HAPPY DIET.',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            children: [
              SizedBox(width: 170),
              Text(
                'GOOD DIET, GOOD LIFE.',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/appicon.png'),
            ),
          ),
        ],
      ),
    );
  }
}
