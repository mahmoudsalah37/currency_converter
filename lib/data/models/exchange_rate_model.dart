import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_rate_model.freezed.dart';

@freezed
class ExchangeRateModel with _$ExchangeRateModel {
  const factory ExchangeRateModel({
    required String base,
    required String target,
    required double rate,
    int? timestamp,
  }) = _ExchangeRateModel;

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    final timestamp = json['timestamp'] as int?;
    return ExchangeRateModel(
      base: json['base'] as String,
      target: json['target'] as String,
      rate: (json['rate'] as num).toDouble(),
      timestamp: timestamp ?? (DateTime.now().millisecondsSinceEpoch ~/ 1000),
    );
  }
}
