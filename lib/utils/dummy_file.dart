// total_calories_page.dart

import 'package:flutter/material.dart';

class TotalCaloriesPage extends StatelessWidget {
  final int totalCalories;

  TotalCaloriesPage({required this.totalCalories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Calories'),
      ),
      body: Center(
        child: Text(
          'Total Calories: $totalCalories kcal',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
