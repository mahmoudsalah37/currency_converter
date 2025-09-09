import 'package:currency_converter/data/models/currency_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveService {
  static const String _currencyBox = 'currencyBox';

  HiveService._(); // Private constructor

  @factoryMethod
  static Future<HiveService> create() async {
    final service = HiveService._();
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CurrencyHiveModelAdapter());
    }
    return service;
  }

  Future<Box<CurrencyHiveModel>> get currencyBox async => await Hive.openBox<CurrencyHiveModel>(_currencyBox);

  Future<void> saveCurrencies(List<CurrencyHiveModel> currencies) async {
    final box = await currencyBox;
    await box.clear();
    for (var currency in currencies) {
      await box.put(currency.code, currency);
    }
  }

  Future<List<CurrencyHiveModel>> getCurrencies() async {
    final box = await currencyBox;
    return box.values.toList();
  }

  Future<bool> hasCurrencies() async {
    final box = await currencyBox;
    return box.isNotEmpty;
  }
}