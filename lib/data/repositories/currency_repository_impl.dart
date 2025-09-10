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
      // Offline: try to get from local
      return _localDataSource.getCurrencies();
    } else {
      // Online: fetch from remote, save to local, then return
      try {
        final currencyModels = await _remoteDataSource.getCurrencies();
        final currencies = currencyModels.map((m) => m.toEntity()).toList();
        await _localDataSource.saveCurrencies(currencies);
        return currencies;
      } catch (e) {
        // If remote fails, fallback to local if available
        if (await _localDataSource.hasCurrencies()) {
          return _localDataSource.getCurrencies();
        } else {
          rethrow; // No local data and remote failed
        }
      }
    }
  }

  @override
  Future<ExchangeRate> getLatestRate(String base, String target) async {
    final model = await _remoteDataSource.getLatestRate(base, target);
    return model.toEntity();
  }
}
