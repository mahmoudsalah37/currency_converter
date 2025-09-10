import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:currency_converter/data/datasources/local_data_source.dart';
import 'package:currency_converter/data/datasources/remote_data_source.dart';
import 'package:currency_converter/data/mappers/currency_mapper.dart';
import 'package:currency_converter/data/mappers/exchange_rate_mapper.dart';
import 'package:currency_converter/data/models/exchange_rate_hive_model.dart';
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
    // First try to get from cache if available
    final cachedRate = await _localDataSource.getExchangeRate(base, target);
    final now = DateTime.now();
    
    if (cachedRate != null) {
      final cacheTime = DateTime.fromMillisecondsSinceEpoch(cachedRate.timestamp * 1000);
      final cacheAge = now.difference(cacheTime);
      // If cache is fresh (less than 1 hour old), use it
      if (cacheAge < const Duration(hours: 1)) {
        return cachedRate.toEntity();
      }
    }
    
    // If no cache or cache is stale, try to fetch from remote
    final connectivityResult = await _connectivity.checkConnectivity();
    
    if (connectivityResult == ConnectivityResult.none) {
      // Offline and no fresh cache - return cached data if available, even if stale
      if (cachedRate != null) {
        return cachedRate.toEntity();
      }
      
      // No cached data available offline
      throw Exception('No internet connection and no cached exchange rate available');
    }
    
    // Online: try to fetch from remote
    try {
      final model = await _remoteDataSource.getLatestRate(base, target);
      final rate = model.toEntity();
      
      // Save to cache for future offline use
      await _localDataSource.saveExchangeRate(
        ExchangeRateHiveModel(
          base: rate.base,
          target: rate.target,
          rate: rate.rate,
          timestamp: rate.timestamp.millisecondsSinceEpoch ~/ 1000,
        )
      );
      
      return rate;
    } catch (e) {
      // If remote fails, return cached data if available
      if (cachedRate != null) {
        return cachedRate.toEntity();
      }
      
      // No cached data and remote failed
      rethrow;
    }
  }
}
