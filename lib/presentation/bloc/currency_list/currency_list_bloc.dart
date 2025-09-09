import 'package:bloc/bloc.dart';
import 'package:currency_converter/domain/usecases/get_currencies_usecase.dart';
import 'package:currency_converter/presentation/bloc/currency_list/currency_list_event.dart';
import 'package:currency_converter/presentation/bloc/currency_list/currency_list_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CurrencyListBloc extends Bloc<CurrencyListEvent, CurrencyListState> {
  final GetCurrenciesUseCase _getCurrenciesUseCase;

  CurrencyListBloc(this._getCurrenciesUseCase) : super(CurrencyListState.initial()) {
    on<LoadCurrencies>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));
      try {
        final currencies = await _getCurrenciesUseCase();
        emit(state.copyWith(
          isLoading: false,
          allCurrencies: currencies,
          filteredCurrencies: currencies,
        ));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });

    on<SearchCurrency>((event, emit) {
      final query = event.query.toLowerCase();
      final filtered = state.allCurrencies.where((c) {
        return c.name.toLowerCase().contains(query) || c.code.toLowerCase().contains(query);
      }).toList();
      emit(state.copyWith(filteredCurrencies: filtered));
    });
  }
}