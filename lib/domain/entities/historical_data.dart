import 'package:freezed_annotation/freezed_annotation.dart';

part 'historical_data.freezed.dart';
part 'historical_data.g.dart';

@freezed
class HistoricalData with _$HistoricalData {
  const factory HistoricalData({
    required DateTime date,
    required double rate,
  }) = _HistoricalData;

  factory HistoricalData.fromJson(Map<String, dynamic> json) => _$HistoricalDataFromJson(json);
}