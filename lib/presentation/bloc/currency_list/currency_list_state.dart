import 'package:currency_converter/domain/entities/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_list_state.freezed.dart';

@freezed
class CurrencyListState with _$CurrencyListState {
  const factory CurrencyListState({
    required List<Currency> allCurrencies,
    required List<Currency> filteredCurrencies,
    required bool isLoading,
    required String? error,
  }) = _CurrencyListState;

  factory CurrencyListState.initial() => const CurrencyListState(
        allCurrencies: [],
        filteredCurrencies: [],
        isLoading: false,
        error: null,
      );
}