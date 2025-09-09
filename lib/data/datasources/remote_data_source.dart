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
    final response = await _dioClient.get('list');
    final symbols = response.data['currencies'] as Map<String, dynamic>;
    return symbols.entries.map((entry) {
      return CurrencyModel(code: entry.key, name: entry.value as String);
    }).toList();
  }

  @override
  Future<ExchangeRateModel> getLatestRate(String base, String target) async {
    final response = await _dioClient.get(
      'live',
      queryParameters: {
        'source': base,
        'currencies': target,
      },
    );
    final rates = response.data['quotes'] as Map<String, dynamic>;
    return ExchangeRateModel(
      base: base,
      target: target,
      rate: rates[base + target],
    );
  }

  @override
  Future<List<HistoricalDataModel>> getHistoricalData(
    String startDate,
    String endDate,
    String base,
    String target,
  ) async {
    final response = await _dioClient.get(
      'timeframe',
      queryParameters: {
        'start_date': startDate,
        'end_date': endDate,
        'source': base,
        'currencies': target,
      },
    );
    final rates = response.data['rates'] as Map<String, dynamic>;
    return rates.entries.map((entry) {
      final date = DateTime.parse(entry.key);
      final rate = (entry.value as Map<String, dynamic>)[base + target] as double;
      return HistoricalDataModel(date: date, rate: rate);
    }).toList();
  }
}
