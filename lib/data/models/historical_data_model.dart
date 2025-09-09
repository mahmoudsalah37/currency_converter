
import 'package:freezed_annotation/freezed_annotation.dart';

part 'historical_data_model.freezed.dart';
part 'historical_data_model.g.dart';

@freezed
class HistoricalDataModel with _$HistoricalDataModel {
  const factory HistoricalDataModel({
    required DateTime date,
    required double rate,
  }) = _HistoricalDataModel;

  factory HistoricalDataModel.fromJson(Map<String, dynamic> json) => _$HistoricalDataModelFromJson(json);
}