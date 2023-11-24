import 'package:dietplanner_project/database/db_breakrecipe.dart';
import 'package:dietplanner_project/database/db_model.dart';
import 'package:dietplanner_project/database/model_food.dart';
import 'package:dietplanner_project/database/model_selected_food.dart';
import 'package:dietplanner_project/database/model_totalcalories.dart';
import 'package:dietplanner_project/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(FoodItemAdapter());
  Hive.registerAdapter(SelectedFoodItemAdapter());
  Hive.registerAdapter(TotalCaloriesAdapter());
  Hive.registerAdapter(RecipeAdapter());
  await Hive.openBox<UserModel>('userBox');
  await Hive.openBox<FoodItem>('foodBox');
  await Hive.openBox<TotalCalories>('totalCaloriesBox');
  await Hive.openBox<SelectedFoodItem>('selectedFoodBox');
  await Hive.openBox<Recipe>('recipes');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardScreen(),
    );
  }
}
