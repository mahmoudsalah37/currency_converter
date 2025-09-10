import 'package:currency_converter/domain/entities/currency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'converter_event.freezed.dart';

@freezed
class ConverterEvent with _$ConverterEvent {
  const factory ConverterEvent.amountChanged(String amount) = AmountChanged;
  const factory ConverterEvent.fromCurrencyChanged(Currency currency) =
      FromCurrencyChanged;
  const factory ConverterEvent.toCurrencyChanged(Currency currency) =
      ToCurrencyChanged;
  const factory ConverterEvent.swapCurrencies() = SwapCurrencies;
  const factory ConverterEvent.fetchRate() = FetchRate;
}
