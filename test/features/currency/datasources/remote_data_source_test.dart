import 'package:currency_converter/core/network/dio_client.dart';
import 'package:currency_converter/data/datasources/remote_data_source.dart';
import 'package:currency_converter/data/models/currency_model.dart';
import 'package:currency_converter/data/models/exchange_rate_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([DioClient])
void main() {
  late RemoteDataSourceImpl dataSource;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    // Mock the get method of DioClient to return a successful response
    when(
      mockDioClient.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      ),
    ).thenAnswer((_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ));
    dataSource = RemoteDataSourceImpl(mockDioClient);
  });

  group('getCurrencies', () {
    final tCurrencyJson = {
      'currencies': {
        'USD': 'US Dollar',
        'EUR': 'Euro',
      },
      'success': true,
    };

    final tCurrencyModels = [
      const CurrencyModel(code: 'USD', name: 'US Dollar'),
      const CurrencyModel(code: 'EUR', name: 'Euro'),
    ];

    test(
      'should return list of CurrencyModel when the call to remote data source is successful',
      () async {
        // arrange
        when(
          mockDioClient.get(
            'list',
            queryParameters: anyNamed('queryParameters'),
          ),
        ).thenAnswer((_) async => Response(
              data: tCurrencyJson,
              statusCode: 200,
              requestOptions: RequestOptions(path: 'list'),
            ));

        // act
        final result = await dataSource.getCurrencies();

        // assert
        expect(result, equals(tCurrencyModels));
        verify(mockDioClient.get('list'));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(
          mockDioClient.get(
            'list',
            queryParameters: anyNamed('queryParameters'),
          ),
        ).thenThrow(DioException(
          response: Response(
            statusCode: 404,
            data: {'error': 'Not Found'},
            requestOptions: RequestOptions(path: 'list'),
          ),
          requestOptions: RequestOptions(path: 'list'),
        ));

        // act
        final call = dataSource.getCurrencies;

        // assert
        expect(
          () => call(),
          throwsA(predicate((e) => e is Exception && e.toString().contains('Failed to load currencies'))),
        );
      },
    );
  });

  group('getLatestRate', () {
    const tBase = 'USD';
    const tTarget = 'EUR';
    const tRate = 0.85;
    final tExchangeRateJson = {
      'success': true,
      'timestamp': DateTime.now().millisecondsSinceEpoch ~/ 1000,
      'source': tBase,
      'quotes': {
        '$tBase$tTarget': tRate,
      },
    };

    final tExchangeRateModel = ExchangeRateModel(
      base: tBase,
      target: tTarget,
      rate: tRate,
      timestamp: tExchangeRateJson['timestamp'] as int,
    );

    test(
      'should return ExchangeRateModel when the call is successful',
      () async {
        // arrange
        when(mockDioClient.get(
          'live',
          queryParameters: {
            'source': tBase,
            'currencies': tTarget,
          },
        )).thenAnswer((_) async => Response(
              data: tExchangeRateJson,
              statusCode: 200,
              requestOptions: RequestOptions(path: 'live'),
            ));

        // act
        final result = await dataSource.getLatestRate(tBase, tTarget);

        // assert
        expect(result, equals(tExchangeRateModel));
        verify(mockDioClient.get(
          'live',
          queryParameters: {
            'source': tBase,
            'currencies': tTarget,
          },
        ));
      },
    );

    test(
      'should throw a ServerException when the API returns an error',
      () async {
        // arrange
        when(mockDioClient.get(
          'live',
          queryParameters: {
            'source': tBase,
            'currencies': tTarget,
          },
        )).thenThrow(DioException(
          response: Response(
            statusCode: 400,
            data: {'error': {'info': 'Invalid base currency'}},
            requestOptions: RequestOptions(path: 'live'),
          ),
          requestOptions: RequestOptions(path: 'live'),
        ));

        // act
        final call = dataSource.getLatestRate;

        // assert
        expect(
          () => call(tBase, tTarget),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString().contains('Failed to fetch exchange rate'))),
        );
      },
    );
  });
}
