import 'package:hive/hive.dart';

part 'model_food.g.dart';

@HiveType(typeId: 1)
class FoodItem extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int calories;

  FoodItem({
    required this.name,
    required this.calories,
  });
}
