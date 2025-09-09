// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoricalDataImpl _$$HistoricalDataImplFromJson(Map<String, dynamic> json) =>
    _$HistoricalDataImpl(
      date: DateTime.parse(json['date'] as String),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$HistoricalDataImplToJson(
        _$HistoricalDataImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'rate': instance.rate,
    };
