import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../error/exceptions.dart';
import 'api_config.dart';

@lazySingleton
class DioClient {
  final Dio _dio;

  static const Duration _baseDelay = Duration(seconds: 1);
  static const Duration _maxDelay = Duration(seconds: 10);

  DioClient(
    this._dio,
  ) {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.exchangerate.host/',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      validateStatus: (status) => status! < 500,
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (!options.queryParameters.containsKey('access_key')) {
          options.queryParameters['access_key'] = apiKey;
        }
        return handler.next(options);
      },
    ));
  }

  @factoryMethod
  static Future<DioClient> create(
    Dio dio,
  ) async {
    return DioClient(dio);
  }

  bool _shouldRetry(DioException error) {
    final statusCode = error.response?.statusCode;
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        statusCode == 429 ||
        statusCode == 408 ||
        (statusCode != null && statusCode >= 500);
  }

  Future<Response<T>> _retry<T>(RequestOptions requestOptions) async {
    int retryCount = 0;
    const int maxRetries = 3;

    while (retryCount < maxRetries) {
      try {
        final response = await _dio.fetch<T>(requestOptions);
        return response;
      } on DioException catch (e) {
        if (!_shouldRetry(e) || retryCount == maxRetries - 1) {
          rethrow;
        }
      }

      final delayMs = min(
        _baseDelay.inMilliseconds * pow(2, retryCount).toInt(),
        _maxDelay.inMilliseconds,
      );
      final jitter = Random().nextInt(1000);
      await Future.delayed(Duration(milliseconds: delayMs + jitter));

      retryCount++;
    }

    throw const ApiException('Failed after maximum retries');
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool retryOnError = true,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      if (retryOnError && _shouldRetry(e)) {
        final requestOptions = RequestOptions(
          method: 'GET',
          path: path,
          queryParameters: queryParameters,
          extra: options?.extra,
          headers: options?.headers,
          responseType: options?.responseType,
          contentType: options?.contentType,
        );
        return _retry<T>(requestOptions);
      }
      throw ApiException.fromDioException(e);
    } catch (e) {
      throw ApiException(
        'An unexpected error occurred',
        statusCode: 0,
        error: e,
      );
    }
  }
}
