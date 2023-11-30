import 'package:hive/hive.dart';

part 'model_totalcalories.g.dart';

@HiveType(typeId: 3)
class TotalCalories {
  @HiveField(0)
  final int total;

  @HiveField(1)
  final String date;

  // Add a default value for date parameter
  TotalCalories(this.total, [this.date = '']);
}
