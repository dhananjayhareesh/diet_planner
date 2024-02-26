import 'package:dietplanner_project/database/db_waterintake.dart';
import 'package:dietplanner_project/database/model_totalcalories.dart';
import 'package:hive/hive.dart';

int getTotalCaloriesForDate(String date) {
  var totalCaloriesBox = Hive.box<TotalCalories>('totalCaloriesBox');
  var totalCalories =
      totalCaloriesBox.get(date, defaultValue: TotalCalories(0, date));
  return totalCalories?.total ?? 0;
}

int getTotalWaterIntakeForDate(String date) {
  var waterIntakeBox = Hive.box<WaterIntakeModel>('waterbox');
  var waterIntake =
      waterIntakeBox.get(date, defaultValue: WaterIntakeModel(0, date));
  return waterIntake?.glassesConsumed ?? 0;
}

List<String> getAllDates() {
  var totalCaloriesBox = Hive.box<TotalCalories>('totalCaloriesBox');
  List<String> allDates = totalCaloriesBox.keys.cast<String>().toList();
  allDates.sort((a, b) => b.compareTo(a));
  return allDates;
}
