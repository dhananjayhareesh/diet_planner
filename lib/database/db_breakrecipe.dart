import 'package:hive/hive.dart';
part 'db_breakrecipe.g.dart';

@HiveType(typeId: 4)
class Recipe {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String ingredients;

  @HiveField(2)
  late String preparation;

  @HiveField(3)
  late String imagePath;

  Recipe(this.title, this.ingredients, this.preparation, this.imagePath);
}
