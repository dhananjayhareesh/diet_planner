// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final activityLevel =
        fields[7] is String ? fields[7] as String : fields[7] as String?;
    final goal =
        fields[8] is String ? fields[8] as String : fields[8] as String?;
    return UserModel(
      name: fields[0] as String,
      age: fields[1] as int,
      sex: fields[2] as String,
      weight: fields[3] as double,
      height: fields[4] as double,
      targetWeight: fields[5] as double,
      calorieBudget: fields[6] as double?,
      activityLevel: activityLevel ?? '',
      goal: goal ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.sex)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.targetWeight)
      ..writeByte(6)
      ..write(obj.calorieBudget)
      ..writeByte(7) // Add this line
      ..write(obj.activityLevel)
      ..writeByte(8) // Add this line
      ..write(obj.goal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
