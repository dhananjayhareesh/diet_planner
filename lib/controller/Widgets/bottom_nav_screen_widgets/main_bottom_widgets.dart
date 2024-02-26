import 'package:flutter/material.dart';

class BottomNavigationBarUtils {
  static Container navBarContainer(Function(int) onTap, int currentIndex) {
    return Container(
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
          currentIndex: currentIndex,
          onTap: onTap,
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
    );
  }
}
