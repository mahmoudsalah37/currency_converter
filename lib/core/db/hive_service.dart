import 'package:currency_converter/data/models/currency_hive_model.dart';
import 'package:currency_converter/data/models/exchange_rate_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveService {
  static const String _currencyBox = 'currencyBox';
  static const String _exchangeRateBox = 'exchangeRateBox';
  static const Duration _exchangeRateCacheDuration = Duration(hours: 1);

  HiveService._();

  @factoryMethod
  static Future<HiveService> create() async {
    final service = HiveService._();
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CurrencyHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ExchangeRateHiveModelAdapter());
    }

    return service;
  }

  Future<Box<CurrencyHiveModel>> get _currencyBoxInstance async =>
      await Hive.openBox<CurrencyHiveModel>(_currencyBox);

  Future<Box<ExchangeRateHiveModel>> get _exchangeRateBoxInstance async =>
      await Hive.openBox<ExchangeRateHiveModel>(_exchangeRateBox);

  Future<void> saveCurrencies(List<CurrencyHiveModel> currencies) async {
    final box = await _currencyBoxInstance;
    await box.clear();
    for (var currency in currencies) {
      await box.put(currency.code, currency);
    }
  }

  Future<List<CurrencyHiveModel>> getCurrencies() async {
    final box = await _currencyBoxInstance;
    return box.values.toList();
  }

  Future<bool> hasCurrencies() async {
    final box = await _currencyBoxInstance;
    return box.isNotEmpty;
  }

  Future<void> saveExchangeRate(ExchangeRateHiveModel rate) async {
    final box = await _exchangeRateBoxInstance;
    final cacheKey = '${rate.base}_${rate.target}';
    await box.put(cacheKey, rate);
  }

  Future<ExchangeRateHiveModel?> getExchangeRate(
      String base, String target) async {
    final box = await _exchangeRateBoxInstance;
    final cacheKey = '${base}_$target';
    final rate = box.get(cacheKey);

    if (rate != null) {
      final now = DateTime.now();
      final cacheTime = DateTime.fromMillisecondsSinceEpoch(rate.timestamp);
      if (now.difference(cacheTime) < _exchangeRateCacheDuration) {
        return rate;
      }
    }
    return null;
  }

  Future<bool> hasValidExchangeRate(String base, String target) async {
    final rate = await getExchangeRate(base, target);
    return rate != null;
  }
}
