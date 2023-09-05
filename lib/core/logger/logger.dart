import 'package:logger/logger.dart';

CustomLogger logger = CustomLogger();

class CustomLogger {
  Logger logger;

  CustomLogger() : logger = Logger();

  void debug(String message) {
    logger.d(message);
  }

  void info(String message) {
    logger.i(message);
  }

  void warning(String message) {
    logger.w(message);
  }

  void error(String message, [Object? e, StackTrace? stackTrace]) {
    logger.e(message, error: e, stackTrace: stackTrace);
  }
}
