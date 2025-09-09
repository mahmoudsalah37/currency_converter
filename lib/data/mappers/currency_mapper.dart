import 'package:currency_converter/data/models/currency_model.dart';
import 'package:currency_converter/domain/entities/currency.dart';

extension CurrencyMapper on CurrencyModel {
  Currency toEntity() => Currency(code: code, name: name);
}
