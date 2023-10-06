import 'package:logger/logger.dart';

CustomLogger logger = CustomLogger();

class CustomLogger {
  Logger logger;

  CustomLogger() : logger = Logger();

  void debug({required String message}) {
    logger.d(message);
  }

  void info({required String message}) {
    logger.i(message);
  }

  void warning({required String message}) {
    logger.w(message);
  }

  void error({required String message, Object? e, StackTrace? stackTrace}) {
    logger.e(message, error: e, stackTrace: stackTrace);
  }
}
