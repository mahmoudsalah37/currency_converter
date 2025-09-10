import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class AppLogger {
  static final Logger _logger = Logger('CurrencyConverter');
  static bool _isInitialized = false;

  static void initialize() {
    if (_isInitialized) return;
    
    // Only log in debug mode
    if (kDebugMode) {
      // Configure logging
      Logger.root.level = Level.ALL;
      
      // Print logs to the console
      Logger.root.onRecord.listen((record) {
        final time = record.time;
        final level = record.level.name.padRight(7);
        final loggerName = record.loggerName;
        final message = record.message;
        final error = record.error;
        final stackTrace = record.stackTrace;
        
        final buffer = StringBuffer();
        buffer.write('[$time] $level $loggerName: $message');
        
        if (error != null) {
          buffer.write('\nError: $error');
        }
        
        if (stackTrace != null) {
          buffer.write('\n$stackTrace');
        }
        
        debugPrint(buffer.toString());
      });
      
      _isInitialized = true;
      _logger.info('Logger initialized');
    }
  }

  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger.fine(message, error, stackTrace);
    }
  }

  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger.info(message, error, stackTrace);
    }
  }

  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger.warning(message, error, stackTrace);
    }
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger.severe(message, error, stackTrace);
    }
  }

  static void severe(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _logger.severe(message, error, stackTrace);
    }
  }
}
