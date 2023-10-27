import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenSplashTwo extends StatelessWidget {
  const ScreenSplashTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/Animation - 1698382442951.json'),
          SizedBox(
            height: 50,
          ),
          Text(
            "Customize your diet effortlessly.",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            ' Plan your meals to meet your nutritional goals.',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
