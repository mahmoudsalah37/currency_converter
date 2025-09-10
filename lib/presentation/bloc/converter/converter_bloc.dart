import 'package:bloc/bloc.dart';
import 'package:currency_converter/domain/usecases/get_latest_rate_usecase.dart';
import 'package:currency_converter/presentation/bloc/converter/converter_event.dart';
import 'package:currency_converter/presentation/bloc/converter/converter_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  final GetLatestRateUseCase _getLatestRateUseCase;

  ConverterBloc(
    this._getLatestRateUseCase,
  ) : super(ConverterState.initial()) {
    on<AmountChanged>((event, emit) {
      final amount = double.tryParse(event.amount) ?? 0.0;
      emit(state.copyWith(amount: amount));
    });

    on<FromCurrencyChanged>((event, emit) {
      emit(state.copyWith(fromCurrency: event.currency));
    });

    on<ToCurrencyChanged>((event, emit) {
      emit(state.copyWith(toCurrency: event.currency));
    });

    on<SwapCurrencies>((event, emit) {
      emit(state.copyWith(
        fromCurrency: state.toCurrency,
        toCurrency: state.fromCurrency,
      ));
    });

    on<FetchRate>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      try {
        print('Fetching exchange rate for ${state.fromCurrency.code} to ${state.toCurrency.code}');

        final rate = await _getLatestRateUseCase(
          state.fromCurrency.code,
          state.toCurrency.code,
        );

        print('Successfully fetched rate: ${rate.rate}');

        emit(state.copyWith(
          isLoading: false,
          convertedAmount: state.amount * rate.rate,
        ));
      } catch (e, stackTrace) {
        const errorMessage = 'Failed to fetch exchange rate';
        print('$errorMessage: $e\n$stackTrace');
        emit(state.copyWith(
          isLoading: false,
          error: '$errorMessage: ${e.toString()}',
        ));
      }
    });
  }
}
