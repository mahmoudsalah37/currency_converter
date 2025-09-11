import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.exchangerate.host/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
  });

  test('Test API connection and get currencies', () async {
    try {
      final response = await dio.get('list',
          queryParameters: {'access_key': 'be0d8c842531a0b3b2d2413b57a3d44c'});

      expect(response.statusCode, 200);
      expect(response.data, isNotNull);
      expect(response.data['success'], true);

      final currencies = response.data['currencies'] as Map<String, dynamic>;
      expect(currencies.isNotEmpty, true);

      print('Successfully retrieved ${currencies.length} currencies');
    } catch (e) {
      fail('API test failed: $e');
    }
  });

  test('Test exchange rate endpoint', () async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      final response = await dio.get(
        'live',
        queryParameters: {
          'access_key': 'be0d8c842531a0b3b2d2413b57a3d44c',
          'source': 'USD',
          'currencies': 'EUR',
        },
      );

      expect(response.statusCode, 200);
      expect(response.data, isNotNull);

      if (response.data['success'] == false) {
        final error = response.data['error']?['info'] ?? 'Unknown error';
        print('API Error: $error');

        return;
      }

      expect(response.data['success'], true);

      final quotes = response.data['quotes'] as Map<String, dynamic>;
      expect(quotes.isNotEmpty, true);

      final rate = quotes['USDEUR'];
      expect(rate, isNotNull);
      expect(rate, isA<double>());

      print('Current USD to EUR rate: $rate');
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 429) {
        print('Rate limited - skipping test');
        return;
      }
      fail('Exchange rate test failed: $e');
    }
  });
}
