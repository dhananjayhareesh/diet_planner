// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_waterintake.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterIntakeModelAdapter extends TypeAdapter<WaterIntakeModel> {
  @override
  final int typeId = 7;

  @override
  WaterIntakeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterIntakeModel(
      fields[0] as int,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WaterIntakeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.glassesConsumed)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterIntakeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
