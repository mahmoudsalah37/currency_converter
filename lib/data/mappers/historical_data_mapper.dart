import 'package:currency_converter/data/models/historical_data_model.dart';
import 'package:currency_converter/domain/entities/historical_data.dart';

extension HistoricalDataMapper on HistoricalDataModel {
  HistoricalData toEntity() => HistoricalData(date: date, rate: rate);
}
