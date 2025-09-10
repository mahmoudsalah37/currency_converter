// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExchangeRateImpl _$$ExchangeRateImplFromJson(Map<String, dynamic> json) =>
    _$ExchangeRateImpl(
      base: json['base'] as String,
      target: json['target'] as String,
      rate: (json['rate'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ExchangeRateImplToJson(_$ExchangeRateImpl instance) =>
    <String, dynamic>{
      'base': instance.base,
      'target': instance.target,
      'rate': instance.rate,
      'timestamp': instance.timestamp.toIso8601String(),
    };
