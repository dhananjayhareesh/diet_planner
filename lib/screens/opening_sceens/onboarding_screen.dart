import 'package:dietplanner_project/screens/opening_sceens/screen_splash1.dart';
import 'package:dietplanner_project/screens/opening_sceens/screen_splash2.dart';
import 'package:dietplanner_project/screens/opening_sceens/screen_splash4.dart';
import 'package:dietplanner_project/screens/opening_sceens/scren_splash3.dart';
import 'package:dietplanner_project/screens/opening_sceens/user_details.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: [
              ScreenSplashOne(),
              ScreenSplashTwo(),
              ScreenSplashThree(),
              ScreenSplashFour(),
            ],
          ),
          Positioned(
            top: 70.0,
            left: 20.0,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: SwapEffect(),
            ),
          ),
          if (!onLastPage)
            Positioned(
              top: 70.0,
              right: 20.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScreenUserDetails();
                  }));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
