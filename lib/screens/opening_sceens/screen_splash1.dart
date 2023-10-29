import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenSplashOne extends StatelessWidget {
  const ScreenSplashOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/Animation - 1698383959939.json'),
          SizedBox(
            height: 50,
          ),
          Text(
            "Welcome to HAPPY DIET!",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Where a healthier you begins with every meal.',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}