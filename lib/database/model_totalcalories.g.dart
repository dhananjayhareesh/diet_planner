// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_totalcalories.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TotalCaloriesAdapter extends TypeAdapter<TotalCalories> {
  @override
  final int typeId = 3;

  @override
  TotalCalories read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalCalories(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TotalCalories obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalCaloriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
