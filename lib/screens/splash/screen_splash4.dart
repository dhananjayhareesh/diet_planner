import 'package:flutter/material.dart';

class ScreenSplashFour extends StatelessWidget {
  const ScreenSplashFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: const Color.fromARGB(248, 248, 248, 255),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HAPPY DIET.',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  'Good Diet, Good Life',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 117, 116, 116)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Let's Start The Healthy Journey")
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Image.asset(
              'assets/splashfour.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
