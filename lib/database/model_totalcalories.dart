import 'package:hive/hive.dart';

part 'model_totalcalories.g.dart';

@HiveType(typeId: 3)
class TotalCalories {
  @HiveField(0)
  final int total;

  TotalCalories(this.total);
}
