import 'package:hive/hive.dart';
part 'db_dinnerrecipe.g.dart';

@HiveType(typeId: 6)
class RecipeDinner {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String ingredients;

  @HiveField(2)
  late String preparation;

  @HiveField(3)
  late String imagePath;

  RecipeDinner(this.title, this.ingredients, this.preparation, this.imagePath);
}
