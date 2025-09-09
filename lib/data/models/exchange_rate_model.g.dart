// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExchangeRateModelImpl _$$ExchangeRateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExchangeRateModelImpl(
      base: json['base'] as String,
      target: json['target'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$ExchangeRateModelImplToJson(
        _$ExchangeRateModelImpl instance) =>
    <String, dynamic>{
      'base': instance.base,
      'target': instance.target,
      'rate': instance.rate,
    };
