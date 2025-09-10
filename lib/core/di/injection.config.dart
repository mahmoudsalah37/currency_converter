// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasources/local_data_source.dart' as _i7;
import '../../data/datasources/remote_data_source.dart' as _i8;
import '../../data/repositories/currency_repository_impl.dart' as _i10;
import '../../domain/repositories/currency_repository.dart' as _i9;
import '../../domain/usecases/get_currencies_usecase.dart' as _i11;
import '../../domain/usecases/get_latest_rate_usecase.dart' as _i12;
import '../../presentation/bloc/converter/converter_bloc.dart' as _i14;
import '../../presentation/bloc/currency_list/currency_list_bloc.dart' as _i15;
import '../../presentation/bloc/splash/splash_bloc.dart' as _i13;
import '../db/hive_service.dart' as _i6;
import '../network/dio_client.dart' as _i5;
import '../router/app_router.dart' as _i3;
import 'injection.dart' as _i16;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final connectivityModule = _$ConnectivityModule();
  gh.singleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.Connectivity>(() => connectivityModule.connectivity);
  gh.lazySingletonAsync<_i5.DioClient>(() => _i5.DioClient.create());
  gh.lazySingletonAsync<_i6.HiveService>(() => _i6.HiveService.create());
  gh.lazySingletonAsync<_i7.LocalDataSource>(() async =>
      _i7.LocalDataSourceImpl.create(await gh.getAsync<_i6.HiveService>()));
  gh.lazySingletonAsync<_i8.RemoteDataSource>(
      () async => _i8.RemoteDataSourceImpl(await gh.getAsync<_i5.DioClient>()));
  gh.lazySingletonAsync<_i9.CurrencyRepository>(
      () async => _i10.CurrencyRepositoryImpl(
            await gh.getAsync<_i8.RemoteDataSource>(),
            await gh.getAsync<_i7.LocalDataSource>(),
            gh<_i4.Connectivity>(),
          ));
  gh.factoryAsync<_i11.GetCurrenciesUseCase>(() async =>
      _i11.GetCurrenciesUseCase(await gh.getAsync<_i9.CurrencyRepository>()));
  gh.factoryAsync<_i12.GetLatestRateUseCase>(() async =>
      _i12.GetLatestRateUseCase(await gh.getAsync<_i9.CurrencyRepository>()));
  gh.factoryAsync<_i13.SplashBloc>(() async =>
      _i13.SplashBloc(await gh.getAsync<_i11.GetCurrenciesUseCase>()));
  gh.factoryAsync<_i14.ConverterBloc>(() async =>
      _i14.ConverterBloc(await gh.getAsync<_i12.GetLatestRateUseCase>()));
  gh.factoryAsync<_i15.CurrencyListBloc>(() async =>
      _i15.CurrencyListBloc(await gh.getAsync<_i11.GetCurrenciesUseCase>()));
  return getIt;
}

class _$ConnectivityModule extends _i16.ConnectivityModule {}
