import 'package:currency_converter/domain/entities/exchange_rate.dart';
import 'package:currency_converter/domain/repositories/currency_repository.dart';
import 'package:currency_converter/domain/usecases/get_latest_rate_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:mockito/annotations.dart';
import 'get_latest_rate_usecase_test.mocks.dart';

@GenerateMocks([CurrencyRepository])
ExchangeRate _createMockExchangeRate(String base, String target) {
  return ExchangeRate(
    base: base,
    target: target,
    rate: 0.85,
    timestamp: DateTime(2023, 1, 1),
  );
}

void main() {
  late GetLatestRateUseCase useCase;
  late MockCurrencyRepository mockRepository;
  const tBase = 'USD';
  const tTarget = 'EUR';

  setUp(() {
    mockRepository = MockCurrencyRepository();
    useCase = GetLatestRateUseCase(mockRepository);
  });

  test('should get exchange rate from the repository', () async {
    final expectedRate = _createMockExchangeRate(tBase, tTarget);

    when(mockRepository.getLatestRate(any, any)).thenAnswer((invocation) async {
      final base = invocation.positionalArguments[0] as String;
      final target = invocation.positionalArguments[1] as String;
      return _createMockExchangeRate(base, target);
    });

    final result = await useCase(tBase, tTarget);

    expect(result, equals(expectedRate));
    verify(mockRepository.getLatestRate(tBase, tTarget));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should propagate errors from the repository', () async {
    final error = Exception('Failed to fetch rate');
    when(mockRepository.getLatestRate(any, any))
        .thenAnswer((_) => Future.error(error));

    expect(
      () => useCase(tBase, tTarget),
      throwsA(isA<Exception>()),
    );

    verify(mockRepository.getLatestRate(tBase, tTarget));
    verifyNoMoreInteractions(mockRepository);
  });
}
