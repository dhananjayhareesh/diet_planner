import 'package:flutter/material.dart';

class ScreenSplashTwo extends StatelessWidget {
  const ScreenSplashTwo({super.key});

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
              "TAKE CARE OF YOUR BODY IT'S\nTHE ONLY PLAVE YOU HAVE TO LIVE",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          child: Image.asset(
            'assets/splashtwo.png',
            fit: BoxFit.fill,
          ),
        )
      ],
    ));
  }
}
