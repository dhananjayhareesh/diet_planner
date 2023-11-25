import 'package:hive/hive.dart';
part 'db_lunchrecipe.g.dart';

@HiveType(typeId: 5)
class RecipeLunch {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String ingredients;

  @HiveField(2)
  late String preparation;

  @HiveField(3)
  late String imagePath;

  RecipeLunch(this.title, this.ingredients, this.preparation, this.imagePath);
}
