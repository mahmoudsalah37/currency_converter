// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyHiveModelAdapter extends TypeAdapter<CurrencyHiveModel> {
  @override
  final int typeId = 0;

  @override
  CurrencyHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyHiveModel(
      code: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
