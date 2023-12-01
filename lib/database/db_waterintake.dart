import 'package:hive/hive.dart';

part 'db_waterintake.g.dart';

@HiveType(typeId: 7)
class WaterIntakeModel {
  @HiveField(0)
  int glassesConsumed;

  @HiveField(1)
  String date;

  WaterIntakeModel(this.glassesConsumed, [this.date = '']);
}
