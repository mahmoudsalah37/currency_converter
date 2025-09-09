import 'package:currency_converter/domain/entities/currency.dart';
import 'package:currency_converter/domain/repositories/currency_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrenciesUseCase {
  final CurrencyRepository _repository;

  GetCurrenciesUseCase(this._repository);

  Future<List<Currency>> call() {
    return _repository.getCurrencies();
  }
}