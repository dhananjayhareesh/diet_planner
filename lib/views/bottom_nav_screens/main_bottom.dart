import 'package:dietplanner_project/views/bottom_nav_screens/diary.dart';
import 'package:dietplanner_project/views/bottom_nav_screens/progress.dart';
import 'package:dietplanner_project/views/bottom_nav_screens/recipes.dart';
import 'package:dietplanner_project/views/homescreens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dietplanner_project/controller/Widgets/bottom_nav_screen_widgets/main_bottom_widgets.dart';

class MainBottom extends StatefulWidget {
  const MainBottom({Key? key}) : super(key: key);

  @override
  State<MainBottom> createState() => _MainButtomState();
}

class _MainButtomState extends State<MainBottom> {
  int myCurrentIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const ScreenDiary(),
    const GoalTrackerScreen(),
    const ScreenRecipes(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[myCurrentIndex],
      bottomNavigationBar:
          BottomNavigationBarUtils.navBarContainer(_onTap, myCurrentIndex),
    );
  }

  void _onTap(int index) {
    setState(() {
      myCurrentIndex = index;
    });
  }
}
