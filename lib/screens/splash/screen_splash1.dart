import 'package:flutter/material.dart';

class ScreenSplashOne extends StatelessWidget {
  const ScreenSplashOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          color: const Color.fromARGB(248, 248, 248, 255),
          width: double.infinity,
          child: const Center(
            child: Text(
              "YOU DON'T HAVE TO EAT LESS\nYOU HAVE TO EAT RIGHT",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: Image.asset(
            'assets/splashone.png',
            fit: BoxFit.fill,
          ),
        )
      ],
    ));
  }
}
