import 'package:currency_converter/domain/entities/historical_data.dart';
import 'package:currency_converter/domain/repositories/currency_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHistoricalDataUseCase {
  final CurrencyRepository _repository;

  GetHistoricalDataUseCase(this._repository);

  Future<List<HistoricalData>> call(String startDate, String endDate, String base, String target) {
    return _repository.getHistoricalData(startDate, endDate, base, target);
  }
}