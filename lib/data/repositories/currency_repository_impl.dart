import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:currency_converter/data/datasources/local_data_source.dart';
import 'package:currency_converter/data/datasources/remote_data_source.dart';
import 'package:currency_converter/data/mappers/currency_mapper.dart';
import 'package:currency_converter/data/mappers/exchange_rate_mapper.dart';
import 'package:currency_converter/domain/entities/currency.dart';
import 'package:currency_converter/domain/entities/exchange_rate.dart';
import 'package:currency_converter/domain/repositories/currency_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CurrencyRepository)
class CurrencyRepositoryImpl implements CurrencyRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final Connectivity _connectivity;

  CurrencyRepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._connectivity);

  @override
  Future<List<Currency>> getCurrencies() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return _localDataSource.getCurrencies();
    } else {
      try {
        final currencyModels = await _remoteDataSource.getCurrencies();
        final currencies = currencyModels.map((m) => m.toEntity()).toList();
        await _localDataSource.saveCurrencies(currencies);
        return currencies;
      } catch (e) {
        if (await _localDataSource.hasCurrencies()) {
          return _localDataSource.getCurrencies();
        } else {
          rethrow;
        }
      }
    }
  }

  @override
  Future<ExchangeRate> getLatestRate(String base, String target) async {
    if (base.isEmpty || target.isEmpty) {
      throw ArgumentError('Base and target currency codes cannot be empty');
    }

    final normalizedBase = base.toUpperCase();
    final normalizedTarget = target.toUpperCase();

    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      throw Exception('No internet connection available');
    }

    try {
      final model = await _remoteDataSource.getLatestRate(
          normalizedBase, normalizedTarget);
      final rate = model.toEntity();

      if (rate.rate <= 0) {
        throw Exception('Invalid exchange rate received from server');
      }

      return rate;
    } catch (e) {
      throw Exception('Failed to fetch exchange rate: ${e.toString()}');
    }
  }
}
