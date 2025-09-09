import 'package:currency_converter/domain/entities/exchange_rate.dart';
import 'package:currency_converter/domain/repositories/currency_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLatestRateUseCase {
  final CurrencyRepository _repository;

  GetLatestRateUseCase(this._repository);

  Future<ExchangeRate> call(String base, String target) {
    return _repository.getLatestRate(base, target);
  }
}