import 'package:currency_converter/core/network/dio_client.dart';
import 'package:currency_converter/data/models/currency_model.dart';
import 'package:currency_converter/data/models/exchange_rate_model.dart';
import 'package:currency_converter/data/models/historical_data_model.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteDataSource {
  Future<List<CurrencyModel>> getCurrencies();
  Future<ExchangeRateModel> getLatestRate(String base, String target);
  Future<List<HistoricalDataModel>> getHistoricalData(
    String startDate,
    String endDate,
    String base,
    String target,
  );
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl implements RemoteDataSource {
  final DioClient _dioClient;

  RemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    final response = await _dioClient.get('symbols');
    final symbols = response.data['symbols'] as Map<String, dynamic>;
    return symbols.entries.map((entry) {
      return CurrencyModel(code: entry.key, name: entry.value['description']);
    }).toList();
  }

  @override
  Future<ExchangeRateModel> getLatestRate(String base, String target) async {
    final response = await _dioClient.get(
      'latest',
      queryParameters: {'base': base, 'symbols': target},
    );
    final rates = response.data['rates'] as Map<String, dynamic>;
    return ExchangeRateModel(base: base, target: target, rate: rates[target]);
  }

  @override
  Future<List<HistoricalDataModel>> getHistoricalData(
    String startDate,
    String endDate,
    String base,
    String target,
  ) async {
    final response = await _dioClient.get(
      'timeseries',
      queryParameters: {
        'start_date': startDate,
        'end_date': endDate,
        'base': base,
        'symbols': target,
      },
    );
    final rates = response.data['rates'] as Map<String, dynamic>;
    return rates.entries.map((entry) {
      final date = DateTime.parse(entry.key);
      final rate = (entry.value as Map<String, dynamic>)[target] as double;
      return HistoricalDataModel(date: date, rate: rate);
    }).toList();
  }
}