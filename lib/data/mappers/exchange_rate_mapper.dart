import 'package:currency_converter/data/models/exchange_rate_model.dart';
import 'package:currency_converter/domain/entities/exchange_rate.dart';

extension ExchangeRateMapper on ExchangeRateModel {
  ExchangeRate toEntity() => ExchangeRate(
        base: base,
        target: target,
        rate: rate,
        timestamp: timestamp != null 
            ? DateTime.fromMillisecondsSinceEpoch(timestamp! * 1000)
            : DateTime.now(),
      );
}
