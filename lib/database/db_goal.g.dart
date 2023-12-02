// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_goal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserGoalAdapter extends TypeAdapter<UserGoal> {
  @override
  final int typeId = 8;

  @override
  UserGoal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserGoal(
      fields[0] as String,
      fields[1] as String,
      fields[2] as double,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserGoal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.goalId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.targetValue)
      ..writeByte(3)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserProgressAdapter extends TypeAdapter<UserProgress> {
  @override
  final int typeId = 9;

  @override
  UserProgress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProgress(
      fields[0] as String,
      fields[1] as double,
      fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UserProgress obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.goalId)
      ..writeByte(1)
      ..write(obj.achievedValue)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProgressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
