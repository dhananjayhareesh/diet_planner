import 'package:dietplanner_project/screens/opening_sceens/user_details.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenSplashFour extends StatelessWidget {
  const ScreenSplashFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[200]!, Colors.blue[800]!],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/Animation - 1701754262001.json'),
            SizedBox(height: 50),
            Text(
              "Start your journey to better health through a well-balanced, healthy diet.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Let's get started!",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 50),
            Container(
              height: 40,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScreenUserDetails();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 4, 63, 111),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
