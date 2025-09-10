// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExchangeRateHiveModelAdapter extends TypeAdapter<ExchangeRateHiveModel> {
  @override
  final int typeId = 1;

  @override
  ExchangeRateHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExchangeRateHiveModel(
      base: fields[0] as String,
      target: fields[1] as String,
      rate: fields[2] as double,
      timestamp: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExchangeRateHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.base)
      ..writeByte(1)
      ..write(obj.target)
      ..writeByte(2)
      ..write(obj.rate)
      ..writeByte(3)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExchangeRateHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
