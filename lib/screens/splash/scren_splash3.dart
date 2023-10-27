import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenSplashThree extends StatelessWidget {
  const ScreenSplashThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/Animation - 1698382679000.json'),
          SizedBox(
            height: 50,
          ),
          Text(
            "Create and save your own recipes.",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Keep your favorite dishes just a tap away.',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
