import 'package:crypto_currency/core/logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

class AppState {
  static AppStateWrong catchErrorHandler(Object? error, {String? details}) {
    if (error == null) {
      return AppStateWrong.error('unidentified error');
    }
    if (error is AppStateWrong) {
      logger.error(
        message: error.message,
        stackTrace: StackTrace.fromString(error.details ?? ''),
        e: error,
      );

      return error;
    } else if (error is DioException) {
      logger.error(
        message: error.message ?? '',
        stackTrace: error.stackTrace,
        e: error,
      );

      return AppStateWrong.error(error.message ?? '');
    } else if (error is TypeError) {
      logger.error(
        message: error.toString(),
        stackTrace: error.stackTrace,
        e: error,
      );

      return AppStateWrong.error(error.toString());
    }
    logger.error(message: 'unhandled error', e: error);

    return AppStateWrong.error(error.toString());
  }
}

@freezed
class AppStateWrong with _$AppStateWrong implements Exception {
  factory AppStateWrong.error(String message, {String? details}) =
      _AppStateWrongError;
  factory AppStateWrong.warning(String message, {String? details}) =
      _AppStateWrongWarning;

  @override
  String toString() {
    return message;
  }
}
