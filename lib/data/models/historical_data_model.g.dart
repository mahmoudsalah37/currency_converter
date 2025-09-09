// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoricalDataModelImpl _$$HistoricalDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoricalDataModelImpl(
      date: DateTime.parse(json['date'] as String),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$HistoricalDataModelImplToJson(
        _$HistoricalDataModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'rate': instance.rate,
    };
