import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_list_event.freezed.dart';

@freezed
class CurrencyListEvent with _$CurrencyListEvent {
  const factory CurrencyListEvent.loadCurrencies() = LoadCurrencies;
  const factory CurrencyListEvent.searchCurrency(String query) = SearchCurrency;
}