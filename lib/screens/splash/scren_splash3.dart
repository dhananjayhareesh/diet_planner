import 'package:flutter/material.dart';

class ScreenSplashThree extends StatelessWidget {
  const ScreenSplashThree({super.key});

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
              "WE WILL HELP YOU TO\nMAINTAIN A GOOD BODY",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: Image.asset(
            'assets/splashthree.png',
            fit: BoxFit.fill,
          ),
        )
      ],
    ));
  }
}
