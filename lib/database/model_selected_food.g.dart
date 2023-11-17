// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_selected_food.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SelectedFoodItemAdapter extends TypeAdapter<SelectedFoodItem> {
  @override
  final int typeId = 2;

  @override
  SelectedFoodItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SelectedFoodItem(
      fields[0] as FoodItem,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SelectedFoodItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.foodItem)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedFoodItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
