import 'package:dietplanner_project/database/db_breakrecipe.dart';
import 'package:dietplanner_project/database/db_dinnerrecipe.dart';
import 'package:dietplanner_project/database/db_goal.dart';
import 'package:dietplanner_project/database/db_lunchrecipe.dart';
import 'package:dietplanner_project/database/db_model.dart';
import 'package:dietplanner_project/database/db_waterintake.dart';
import 'package:dietplanner_project/database/model_food.dart';
import 'package:dietplanner_project/database/model_selected_food.dart';
import 'package:dietplanner_project/database/model_totalcalories.dart';
import 'package:dietplanner_project/views/opening_sceens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(FoodItemAdapter());
  Hive.registerAdapter(SelectedFoodItemAdapter());
  Hive.registerAdapter(TotalCaloriesAdapter());
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(RecipeLunchAdapter());
  Hive.registerAdapter(RecipeDinnerAdapter());
  Hive.registerAdapter(WaterIntakeModelAdapter());
  Hive.registerAdapter(UserGoalAdapter());
  Hive.registerAdapter(UserProgressAdapter());
  await Hive.openBox<UserModel>('userBox');
  await Hive.openBox<FoodItem>('foodBox');
  await Hive.openBox<TotalCalories>('totalCaloriesBox');
  await Hive.openBox<SelectedFoodItem>('selectedFoodBox');
  await Hive.openBox<Recipe>('recipes');
  await Hive.openBox<RecipeLunch>('lunchrecipes');
  await Hive.openBox<RecipeDinner>('dinnerrecipes');
  await Hive.openBox<WaterIntakeModel>('waterbox');
  await Hive.openBox<UserGoal>('goals');
  await Hive.openBox<UserProgress>('progress');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
