import 'package:currency_converter/domain/entities/currency.dart';
import 'package:currency_converter/domain/entities/exchange_rate.dart';

abstract class CurrencyRepository {
  Future<List<Currency>> getCurrencies();
  Future<ExchangeRate> getLatestRate(String base, String target);
}
