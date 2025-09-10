import 'package:currency_converter/domain/entities/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'converter_state.freezed.dart';

@freezed
class ConverterState with _$ConverterState {
  const factory ConverterState({
    required double amount,
    required Currency fromCurrency,
    required Currency toCurrency,
    required double convertedAmount,
    required bool isLoading,
    required String? error,
  }) = _ConverterState;

  factory ConverterState.initial() => const ConverterState(
        amount: 0.0,
        fromCurrency: Currency(code: 'USD', name: 'US Dollar'),
        toCurrency: Currency(code: 'EUR', name: 'Euro'),
        convertedAmount: 0.0,
        isLoading: false,
        error: null,
      );
}
