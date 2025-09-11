import 'package:currency_converter/core/db/hive_service.dart';
import 'package:currency_converter/data/models/currency_hive_model.dart';
import 'package:currency_converter/data/models/exchange_rate_hive_model.dart';
import 'package:currency_converter/domain/entities/currency.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource {
  Future<List<Currency>> getCurrencies();
  Future<void> saveCurrencies(List<Currency> currencies);
  Future<bool> hasCurrencies();

  Future<ExchangeRateHiveModel?> getExchangeRate(String base, String target);
  Future<void> saveExchangeRate(ExchangeRateHiveModel rate);
  Future<bool> hasExchangeRate(String base, String target);
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final HiveService _hiveService;

  LocalDataSourceImpl._(this._hiveService);

  @factoryMethod
  static Future<LocalDataSourceImpl> create(HiveService hiveService) async {
    return LocalDataSourceImpl._(hiveService);
  }

  @override
  Future<List<Currency>> getCurrencies() async {
    final hiveModels = await _hiveService.getCurrencies();
    return hiveModels.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> saveCurrencies(List<Currency> currencies) async {
    final hiveModels =
        currencies.map((e) => CurrencyHiveModel.fromEntity(e)).toList();
    await _hiveService.saveCurrencies(hiveModels);
  }

  @override
  Future<bool> hasCurrencies() {
    return _hiveService.hasCurrencies();
  }

  @override
  Future<ExchangeRateHiveModel?> getExchangeRate(
      String base, String target) async {
    return _hiveService.getExchangeRate(base, target);
  }

  @override
  Future<void> saveExchangeRate(ExchangeRateHiveModel rate) async {
    await _hiveService.saveExchangeRate(rate);
  }

  @override
  Future<bool> hasExchangeRate(String base, String target) async {
    return _hiveService.hasValidExchangeRate(base, target);
  }
}
