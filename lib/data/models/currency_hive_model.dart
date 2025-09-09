import 'package:currency_converter/domain/entities/currency.dart';
import 'package:hive/hive.dart';

part 'currency_hive_model.g.dart';

@HiveType(typeId: 0)
class CurrencyHiveModel {
  @HiveField(0)
  final String code;

  @HiveField(1)
  final String name;

  const CurrencyHiveModel({
    required this.code,
    required this.name,
  });

  Currency toEntity() => Currency(code: code, name: name);

  factory CurrencyHiveModel.fromEntity(Currency currency) {
    return CurrencyHiveModel(code: currency.code, name: currency.name);
  }
}
