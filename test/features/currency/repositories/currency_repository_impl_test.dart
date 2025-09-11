import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:currency_converter/data/datasources/local_data_source.dart';
import 'package:currency_converter/data/datasources/remote_data_source.dart';
import 'package:currency_converter/data/models/currency_model.dart';
import 'package:currency_converter/data/models/exchange_rate_model.dart';
import 'package:currency_converter/data/repositories/currency_repository_impl.dart';
import 'package:currency_converter/domain/entities/currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'currency_repository_impl_test.mocks.dart';

@GenerateMocks([
  RemoteDataSource,
  LocalDataSource,
  Connectivity,
])
void main() {
  late CurrencyRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockConnectivity = MockConnectivity();

    repository = CurrencyRepositoryImpl(
      mockRemoteDataSource,
      mockLocalDataSource,
      mockConnectivity,
    );
  });

  group('getCurrencies', () {
    final tCurrencies = [
      const Currency(code: 'USD', name: 'US Dollar'),
      const Currency(code: 'EUR', name: 'Euro'),
    ];

    final tCurrencyModels = [
      const CurrencyModel(code: 'USD', name: 'US Dollar'),
      const CurrencyModel(code: 'EUR', name: 'Euro'),
    ];

    test(
      'should return local data when there is no internet connection',
      () async {
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.none);
        when(mockLocalDataSource.getCurrencies())
            .thenAnswer((_) async => tCurrencies);

        final result = await repository.getCurrencies();

        verify(mockConnectivity.checkConnectivity());
        verify(mockLocalDataSource.getCurrencies());
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(tCurrencies));
      },
    );

    test(
      'should return remote data when online and save it to local storage',
      () async {
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.wifi);
        when(mockRemoteDataSource.getCurrencies())
            .thenAnswer((_) async => tCurrencyModels);
        when(mockLocalDataSource.saveCurrencies(any))
            .thenAnswer((_) async => Future.value());

        final result = await repository.getCurrencies();

        verify(mockConnectivity.checkConnectivity());
        verify(mockRemoteDataSource.getCurrencies());
        verify(mockLocalDataSource.saveCurrencies(tCurrencies));
        expect(result, equals(tCurrencies));
      },
    );

    test(
      'should return cached data when remote fails but cache exists',
      () async {
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.wifi);
        when(mockRemoteDataSource.getCurrencies()).thenThrow(Exception());
        when(mockLocalDataSource.hasCurrencies()).thenAnswer((_) async => true);
        when(mockLocalDataSource.getCurrencies())
            .thenAnswer((_) async => tCurrencies);

        final result = await repository.getCurrencies();

        verify(mockConnectivity.checkConnectivity());
        verify(mockRemoteDataSource.getCurrencies());
        verify(mockLocalDataSource.hasCurrencies());
        verify(mockLocalDataSource.getCurrencies());
        expect(result, equals(tCurrencies));
      },
    );
  });

  group('getLatestRate', () {
    const tBase = 'USD';
    const tTarget = 'EUR';
    const tRate = 0.85;
    final tExchangeRateModel = ExchangeRateModel(
      base: tBase,
      target: tTarget,
      rate: tRate,
      timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );

    test(
      'should return exchange rate when the call to remote data source is successful',
      () async {
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.wifi);
        when(mockRemoteDataSource.getLatestRate(any, any))
            .thenAnswer((_) async => tExchangeRateModel);

        final result = await repository.getLatestRate(tBase, tTarget);

        verify(mockConnectivity.checkConnectivity());
        verify(mockRemoteDataSource.getLatestRate(tBase, tTarget));
        expect(result.base, equals(tBase));
        expect(result.target, equals(tTarget));
        expect(result.rate, equals(tRate));
      },
    );

    test(
      'should throw an error when base or target currency is empty',
      () async {
        expect(
          () => repository.getLatestRate('', tTarget),
          throwsA(isA<ArgumentError>()),
        );
        expect(
          () => repository.getLatestRate(tBase, ''),
          throwsA(isA<ArgumentError>()),
        );
        expect(
          () => repository.getLatestRate('', ''),
          throwsA(isA<ArgumentError>()),
        );
      },
    );

    test(
      'should throw an error when there is no internet connection',
      () async {
        when(mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.none);

        expect(
          () => repository.getLatestRate(tBase, tTarget),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString().contains('No internet connection'))),
        );
      },
    );
  });
}
