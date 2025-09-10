import 'package:currency_converter/domain/entities/exchange_rate.dart';
import 'package:hive/hive.dart';

part 'exchange_rate_hive_model.g.dart';

@HiveType(typeId: 1)
class ExchangeRateHiveModel {
  @HiveField(0)
  final String base;
  
  @HiveField(1)
  final String target;
  
  @HiveField(2)
  final double rate;
  
  @HiveField(3)
  final int timestamp;

  ExchangeRateHiveModel({
    required this.base,
    required this.target,
    required this.rate,
    required this.timestamp,
  });

  ExchangeRate toEntity() => ExchangeRate(
        base: base,
        target: target,
        rate: rate,
        timestamp: DateTime.fromMillisecondsSinceEpoch(timestamp * 1000),
      );

  factory ExchangeRateHiveModel.fromEntity(ExchangeRate rate) {
    return ExchangeRateHiveModel(
      base: rate.base,
      target: rate.target,
      rate: rate.rate,
      timestamp: rate.timestamp.millisecondsSinceEpoch ~/ 1000,
    );
  }
}
