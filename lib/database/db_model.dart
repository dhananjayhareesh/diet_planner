import 'package:hive/hive.dart';

part 'db_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int age;

  @HiveField(2)
  late String sex;

  @HiveField(3)
  late double weight;

  @HiveField(4)
  late double height;

  @HiveField(5)
  late double targetWeight;

  @HiveField(6)
  late double? calorieBudget;

  @HiveField(7)
  late String activityLevel;

  @HiveField(8)
  late String goal;

  UserModel({
    this.name = '',
    this.age = 0,
    this.sex = '',
    this.weight = 0.0,
    this.height = 0.0,
    this.targetWeight = 0.0,
    this.calorieBudget = 0.0,
    this.activityLevel = '',
    this.goal = '',
  });
}
