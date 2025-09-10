import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rate.freezed.dart';
part 'exchange_rate.g.dart';

@freezed
class ExchangeRate with _$ExchangeRate {
  const factory ExchangeRate({
    required String base,
    required String target,
    required double rate,
    required DateTime timestamp,
  }) = _ExchangeRate;

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => 
      _$ExchangeRateFromJson({
        ...json,
        'timestamp': json['timestamp'] != null 
            ? DateTime.fromMillisecondsSinceEpoch(json['timestamp'] * 1000)
            : DateTime.now(),
      });
}