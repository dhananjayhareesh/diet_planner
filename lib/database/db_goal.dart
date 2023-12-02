import 'package:hive/hive.dart';

part 'db_goal.g.dart';

@HiveType(typeId: 8)
class UserGoal extends HiveObject {
  @HiveField(0)
  late String goalId;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late double targetValue;

  @HiveField(3)
  late String unit;

  UserGoal(this.goalId, this.title, this.targetValue, this.unit);
}

@HiveType(typeId: 9)
class UserProgress extends HiveObject {
  @HiveField(0)
  late String goalId;

  @HiveField(1)
  late double achievedValue;

  @HiveField(2)
  late DateTime date;

  UserProgress(this.goalId, this.achievedValue, this.date);
}
