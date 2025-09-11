import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  const AppException(this.message, {this.statusCode, this.data});

  @override
  String toString() => message;
}

class ApiException extends AppException {
  final dynamic error;

  const ApiException(
    super.message, {
    super.statusCode,
    super.data,
    this.error,
  });

  factory ApiException.fromDioException(DioException error) {
    if (error.response != null) {
      return ApiException(
        'API error: ${error.response?.statusCode} - ${error.response?.statusMessage}',
        statusCode: error.response?.statusCode,
        data: error.response?.data,
        error: error,
      );
    } else {
      return ApiException(
        'Network error: ${error.message ?? 'Unable to connect to the server'}',
        error: error,
      );
    }
  }
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection']);
}

class TimeoutException extends AppException {
  const TimeoutException([super.message = 'Request timed out']);
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException([super.message = 'Invalid or missing API key'])
      : super(statusCode: 401);
}

class ServerException extends ApiException {
  const ServerException([super.message = 'Server unavailable'])
      : super(statusCode: 503);
}

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
