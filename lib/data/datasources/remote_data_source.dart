import 'package:currency_converter/core/network/dio_client.dart';
import 'package:currency_converter/data/models/currency_model.dart';
import 'package:currency_converter/data/models/exchange_rate_model.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteDataSource {
  Future<List<CurrencyModel>> getCurrencies();

  Future<ExchangeRateModel> getLatestRate(String base, String target);
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
    try {
      final response = await _dioClient.get(
        'live',
        queryParameters: {
          'source': base,
          'currencies': target,
        },
      );

      if (response.data == null) {
        throw Exception('No data received from the API');
      }

      if (response.data['success'] != true) {
        throw Exception('API request was not successful');
      }

      final quotes = response.data['quotes'] as Map<String, dynamic>?;
      if (quotes == null || quotes.isEmpty) {
        throw Exception('No exchange rate data available');
      }

      final rateKey = '$base$target';
      final rate = quotes[rateKey];

      if (rate == null) {
        throw Exception('No rate found for $base to $target');
      }

      return ExchangeRateModel(
        base: base,
        target: target,
        rate: rate.toDouble(),
      );
    } catch (e) {
      print('Error in getLatestRate: $e');
      rethrow;
    }
  }
}
