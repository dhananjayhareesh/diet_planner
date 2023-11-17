// selected_food_item.dart
import 'package:dietplanner_project/database/model_food.dart';
import 'package:hive/hive.dart';

part 'model_selected_food.g.dart';

@HiveType(typeId: 2)
class SelectedFoodItem extends HiveObject {
  @HiveField(0)
  final FoodItem foodItem;

  @HiveField(1)
  int quantity;

  SelectedFoodItem(this.foodItem, this.quantity);
}
