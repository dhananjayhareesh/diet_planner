import 'package:dietplanner_project/screens/bottom_nav_screens/diary.dart';
import 'package:dietplanner_project/screens/bottom_nav_screens/progress.dart';
import 'package:dietplanner_project/screens/bottom_nav_screens/recipes.dart';
import 'package:dietplanner_project/screens/homescreens/home_screen.dart';
import 'package:flutter/material.dart';

class MainBottom extends StatefulWidget {
  const MainBottom({super.key});

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
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
              offset: const Offset(8, 20)),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            currentIndex: myCurrentIndex,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/dashboard.png')),
                  label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/diary.png')),
                  label: 'Diary'),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/success.png')),
                  label: 'Goal'),
              BottomNavigationBarItem(
                  icon: SizedBox(
                      height: 32,
                      width: 32,
                      child: Image.asset('assets/recipes.png')),
                  label: 'Recipes'),
            ],
          ),
        ),
      ),
    );
  }
}
