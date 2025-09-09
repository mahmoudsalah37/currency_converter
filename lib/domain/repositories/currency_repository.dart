import 'package:currency_converter/domain/entities/currency.dart';
import 'package:currency_converter/domain/entities/exchange_rate.dart';
import 'package:currency_converter/domain/entities/historical_data.dart';

abstract class CurrencyRepository {
  Future<List<Currency>> getCurrencies();
  Future<ExchangeRate> getLatestRate(String base, String target);
  Future<List<HistoricalData>> getHistoricalData(
    String startDate,
    String endDate,
    String base,
    String target,
  );
}