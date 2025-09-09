import 'package:bloc/bloc.dart';
import 'package:currency_converter/domain/usecases/get_currencies_usecase.dart';
import 'package:currency_converter/presentation/bloc/splash/splash_event.dart';
import 'package:currency_converter/presentation/bloc/splash/splash_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetCurrenciesUseCase _getCurrenciesUseCase;

  SplashBloc(this._getCurrenciesUseCase) : super(const SplashInitial()) {
    on<InitializeApp>((event, emit) async {
      emit(const SplashLoading());
      try {
        await _getCurrenciesUseCase();
        emit(const SplashLoaded());
      } catch (e) {
        emit(SplashError(e.toString()));
      }
    });
  }
}