import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../error/exceptions.dart';
import '../utils/logger.dart';
import 'api_config.dart';

class _LoggingInterceptor extends Interceptor {
  String _prettyJson(dynamic data) {
    try {
      if (data is String) {
        final jsonData = jsonDecode(data);
        return const JsonEncoder.withIndent('  ').convert(jsonData);
      }
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (e) {
      return data.toString();
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.debug(
      '🌐 Sending ${options.method} request to ${options.uri}',
      null,
      StackTrace.current,
    );

    if (options.queryParameters.isNotEmpty) {
      AppLogger.debug(
        'Query parameters: ${_prettyJson(options.queryParameters)}',
        null,
        StackTrace.current,
      );
    }

    if (options.data != null) {
      AppLogger.debug(
        'Request body: ${_prettyJson(options.data)}',
        null,
        StackTrace.current,
      );
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final request = response.requestOptions;

    // Log basic response info
    AppLogger.debug(
      '✅ Response [${response.statusCode}] ${request.method} ${request.uri}',
      null,
      StackTrace.current,
    );

    // Only log response data in debug mode and if it's not too large
    if (response.data != null) {
      try {
        final data = response.data;
        final isLargeResponse = data.toString().length > 2000; // 2KB threshold

        if (isLargeResponse) {
          // For large responses, just log the type and size
          AppLogger.debug(
            'Response data: [${data.runtimeType}] (${data.toString().length} bytes)',
            null,
            StackTrace.current,
          );
        } else {
          // For small responses, log the pretty-printed JSON
          final jsonString = _prettyJson(data);
          AppLogger.debug(
            'Response data: $jsonString',
            null,
            StackTrace.current,
          );
        }
      } catch (e) {
        // If we can't process the response, just log the error
        AppLogger.debug(
          'Could not log response data: ${e.toString()}',
          null,
          StackTrace.current,
        );
      }
    }

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;

    if (response != null) {
      AppLogger.error(
        '❌ Error [${response.statusCode}] ${err.requestOptions.method} ${err.requestOptions.uri}',
        err,
        err.stackTrace,
      );

      if (response.data != null) {
        AppLogger.error(
          'Error response data: ${_prettyJson(response.data)}',
          null,
          StackTrace.current,
        );
      }
    } else {
      AppLogger.error(
        '❌ ${err.type}: ${err.message}',
        err,
        err.stackTrace,
      );
    }

    return handler.next(err);
  }
}

@lazySingleton
class DioClient {
  final Dio _dio;

  DioClient._(this._dio);

  static const Duration _baseDelay = Duration(seconds: 1);
  static const Duration _maxDelay = Duration(seconds: 10);
  static const Duration _rateLimitWindow = Duration(seconds: 60);
  static const int _maxRequestsPerMinute = 5;
  final List<DateTime> _requestTimestamps = [];

  @factoryMethod
  static Future<DioClient> create() async {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.exchangerate.host/',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      validateStatus: (status) => status! < 500, // Don't throw for 4xx errors
    ));

    // Add interceptors in order
    final client = DioClient._(dio);

    // Rate limiting interceptor
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        await client._handleRateLimiting();
        options.queryParameters['access_key'] = apiKey;
        return handler.next(options);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) async {
        if (error.response?.statusCode == 429) {
          // Handle rate limiting
          final retryAfter = error.response?.headers.value('retry-after');
          final seconds =
              retryAfter != null ? int.tryParse(retryAfter) ?? 5 : 5;

          AppLogger.warning('Rate limited. Retrying in $seconds seconds...');
          await Future.delayed(Duration(seconds: seconds));

          try {
            final client = DioClient._(dio);
            final response = await client._retry(error.requestOptions);
            return handler.resolve(response);
          } catch (e) {
            final apiError =
                e is ApiException ? e : ApiException.fromDioException(error);
            return handler.next(DioException(
              requestOptions: error.requestOptions,
              error: apiError,
              response: error.response,
              type: error.type,
            ));
          }
        } else if (_shouldRetry(error)) {
          try {
            final client = DioClient._(dio);
            final response = await client._retry(error.requestOptions);
            return handler.resolve(response);
          } catch (e) {
            final apiError =
                e is ApiException ? e : ApiException.fromDioException(error);
            return handler.next(DioException(
              requestOptions: error.requestOptions,
              error: apiError,
              response: error.response,
              type: error.type,
            ));
          }
        }

        return handler.next(error);
      },
    ));

    // Add logging interceptor last
    dio.interceptors.add(_LoggingInterceptor());

    return DioClient._(dio);
  }

  Future<void> _handleRateLimiting() async {
    // Remove timestamps older than rate limit window
    _requestTimestamps.removeWhere(
      (timestamp) => DateTime.now().difference(timestamp) > _rateLimitWindow,
    );

    // If we've hit the rate limit, wait
    if (_requestTimestamps.length >= _maxRequestsPerMinute) {
      final timeToWait = _requestTimestamps.first
          .add(_rateLimitWindow)
          .difference(DateTime.now());
      if (timeToWait > Duration.zero) {
        AppLogger.warning(
          'Rate limit reached. Waiting for ${timeToWait.inSeconds} seconds...',
        );
        await Future.delayed(timeToWait);
      }
    }

    _requestTimestamps.add(DateTime.now());
  }

  static bool _shouldRetry(DioException error) {
    final statusCode = error.response?.statusCode;
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        statusCode == 429 || // Rate limited
        statusCode == 408 || // Request Timeout
        (statusCode != null && statusCode >= 500); // Server errors
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    int retryCount = 0;
    const int maxRetries = 3;

    while (retryCount < maxRetries) {
      try {
        final response = await _dio.fetch<dynamic>(requestOptions);
        if (response.statusCode! < 400) {
          return response;
        }
      } catch (e) {
        if (retryCount == maxRetries - 1) rethrow;
      }

      // Exponential backoff with jitter
      final delayMs = min(
        _baseDelay.inMilliseconds * pow(2, retryCount).toInt(),
        _maxDelay.inMilliseconds,
      );
      final jitter = Random().nextInt(1000);
      await Future.delayed(Duration(milliseconds: delayMs + jitter));

      retryCount++;
    }

    throw const ApiException(
      'Failed after $maxRetries retries',
      statusCode: 503,
    );
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
      throw ApiException.fromDioException(e);
    } on SocketException {
      throw const NetworkException();
    } on TimeoutException {
      throw const TimeoutException();
    } catch (e) {
      throw ApiException(e.toString());
    }
  }
}
