import 'package:dio/dio.dart';

/// Base class for all application-specific exceptions
class AppException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  const AppException(this.message, {this.statusCode, this.data});

  @override
  String toString() => message;
}

/// Exception thrown when there's an error with the API
class ApiException extends AppException {
  const ApiException(
    super.message, {
    super.statusCode,
    super.data,
  });

  /// Create an ApiException from a DioException
  factory ApiException.fromDioException(DioException error) {
    if (error.response != null) {
      return ApiException(
        'API error: ${error.response?.statusCode} - ${error.response?.statusMessage}',
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } else {
      return const ApiException(
          'Network error: Unable to connect to the server');
    }
  }
}

/// Exception thrown when there's a network connectivity issue
class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection']);
}

/// Exception thrown when a request times out
class TimeoutException extends AppException {
  const TimeoutException([super.message = 'Request timed out']);
}

/// Exception thrown when there's a problem with the API key
class UnauthorizedException extends ApiException {
  const UnauthorizedException([super.message = 'Invalid or missing API key'])
      : super(statusCode: 401);
}

/// Exception thrown when the server is unavailable
class ServerException extends ApiException {
  const ServerException([super.message = 'Server unavailable'])
      : super(statusCode: 503);
}

/// Exception thrown when the rate limit is exceeded
class RateLimitException extends ApiException {
  final Duration retryAfter;

  const RateLimitException({
    String message = 'Rate limit exceeded',
    Duration? retryAfter,
  })  : retryAfter = retryAfter ?? const Duration(seconds: 5),
        super(
          '$message. Please try again in $retryAfter seconds.',
          statusCode: 429,
        );
}
