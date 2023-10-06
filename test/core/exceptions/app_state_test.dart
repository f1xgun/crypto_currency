import 'package:crypto_currency/core/exceptions/app_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test AppState catchErrorHandler', () {
    test('When error == null', () {
      // When error == null, should return AppStateWrong.error() with
      // message 'unidentified error'

      expect(
        AppState.catchErrorHandler(null),
        AppStateWrong.error('unidentified error'),
      );
    });

    test('When error is AppStateWrong.error', () {
      // When error is AppStateWrong.error, should return this AppStateWrong.error
      final error = AppStateWrong.error('some error');
      expect(AppState.catchErrorHandler(error), error);
    });

    test('When error is AppStateWrong.warning', () {
      // When error is AppStateWrong.warning, should return this
      // AppStateWrong.warning

      final error = AppStateWrong.warning('some error');
      expect(AppState.catchErrorHandler(error), error);
    });

    test('When error is DioException', () {
      // When error is DioException, should return AppStateWrong.error
      // with message from error or empty string, if error.message == null

      final DioException error = DioException(
          requestOptions: RequestOptions(), message: 'DioException');

      expect(AppState.catchErrorHandler(error),
          AppStateWrong.error('DioException'));

      final DioException errorWithEmptyMessage =
          DioException(requestOptions: RequestOptions());

      expect(AppState.catchErrorHandler(errorWithEmptyMessage),
          AppStateWrong.error(''));
    });

    test('When error is TypeError', () {
      // When error is TypeError, should return AppStateWrong.error
      // with message 'Instance of TypeError'

      final TypeError error = TypeError();

      expect(AppState.catchErrorHandler(error),
          AppStateWrong.error("Instance of 'TypeError'"));
    });

    test('When error unhandled', () {
      // WHen error unhandled, should return AppStateWrong.error with
      // string view of error like message

      final Exception error = Exception();

      expect(
          AppState.catchErrorHandler(error), AppStateWrong.error('Exception'));
    });
  });
}
