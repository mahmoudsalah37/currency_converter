import 'package:bloc/bloc.dart';
import 'package:currency_converter/domain/usecases/get_latest_rate_usecase.dart';
import 'package:currency_converter/domain/usecases/get_historical_data_usecase.dart';
import 'package:currency_converter/presentation/bloc/converter/converter_event.dart';
import 'package:currency_converter/presentation/bloc/converter/converter_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  final GetLatestRateUseCase _getLatestRateUseCase;
  final GetHistoricalDataUseCase _getHistoricalDataUseCase;

  ConverterBloc(this._getLatestRateUseCase, this._getHistoricalDataUseCase)
      : super(ConverterState.initial()) {
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
        final rate = await _getLatestRateUseCase(
          state.fromCurrency.code,
          state.toCurrency.code,
        );
        emit(state.copyWith(
          isLoading: false,
          convertedAmount: state.amount * rate.rate,
        ));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });

    on<FetchHistoricalData>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));
      try {
        final endDate = DateTime.now();
        final startDate = endDate.subtract(const Duration(days: 7));
        final data = await _getHistoricalDataUseCase(
          startDate.toIso8601String().split('T').first,
          endDate.toIso8601String().split('T').first,
          state.fromCurrency.code,
          state.toCurrency.code,
        );
        emit(state.copyWith(isLoading: false, historicalData: data));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });
  }
}