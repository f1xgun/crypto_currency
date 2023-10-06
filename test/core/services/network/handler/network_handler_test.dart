import 'package:crypto_currency/core/exceptions/app_state.dart';
import 'package:crypto_currency/core/services/network/handler/network_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test NetworkHandler parseResult', () {
    group('When req return response with 200 status code', () {
      /// When response status code 200, should return Map<String, dynamic>
      /// if response contains non empty field "data"
      /// else return empty Map {}
      test('Reponse with non empty data', () async {
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: {
                'data': {
                  'some_key': 'some_value',
                  'one_more_key': 'some_value',
                },
              },
            ),
          );
        }

        expect(await NetworkHandler.parseResult(req()), {
          'some_key': 'some_value',
          'one_more_key': 'some_value',
        });
      });

      test('Reponse with null data', () async {
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: {
                'data': null,
              },
            ),
          );
        }

        expect(await NetworkHandler.parseResult(req()), {});
      });

      test('Reponse without field data', () async {
        final Map<String, dynamic> emptyMap = {};
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: emptyMap,
            ),
          );
        }

        expect(await NetworkHandler.parseResult(req()), emptyMap);
      });
    });

    group('When req return response with 204 status code', () {
      /// When req return response with 204 status code, should return empty Map

      test('Return empty Map', () async {
        final Map<String, dynamic> emptyMap = {};
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 204,
              data: emptyMap,
            ),
          );
        }

        expect(await NetworkHandler.parseResult(req()), emptyMap);
      });
    });

    group('When req return response with 400 status code', () {
      /// When req return response with 400 status code
      /// If data contains key 'errors' then if data['error'] != null
      /// then throw AppStateWrong.warning with resp.statusCode and statusMessage
      /// Else throw AppStateWrong.error with message "server error: no content"

      test('Throw AppStateWrong.warning if data contains errors field',
          () async {
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 400,
              statusMessage: 'error',
              data: {
                'errors': [
                  {
                    'error': 'some_error',
                    'message': 'some_message',
                  },
                ]
              },
            ),
          );
        }

        expect(() async => NetworkHandler.parseResult(req()),
            throwsA(AppStateWrong.warning('400 error')));
      });

      test(
          'Throw AppStateWrong.error if data contains errors field with null value',
          () async {
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 400,
              statusMessage: 'error',
              data: {
                'errors': null,
              },
            ),
          );
        }

        expect(() async => NetworkHandler.parseResult(req()),
            throwsA(AppStateWrong.error('server error: no content')));
      });

      test('Throw AppStateWrong.error if resp doesnt contains errors',
          () async {
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 400,
              statusMessage: 'error',
              data: <String, dynamic>{},
            ),
          );
        }

        expect(() async => NetworkHandler.parseResult(req()),
            throwsA(AppStateWrong.error('server error: no content')));
      });
    });

    group('When req return response with 422 status code', () {
      /// When req return response with 422 status code
      /// If data contains key 'errors' then if data['error'] != null
      /// then throw AppStateWrong.warning with resp.statusCode and statusMessage
      /// Else throw AppStateWrong.error with message "server error: no content"

      test('Throw AppStateWrong.warning if data contains errors field',
          () async {
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 422,
              statusMessage: 'error',
              data: {
                'errors': [
                  {
                    'error': 'some_error',
                    'message': 'some_message',
                  },
                ]
              },
            ),
          );
        }

        expect(() async => NetworkHandler.parseResult(req()),
            throwsA(AppStateWrong.warning('422 error')));
      });

      test(
          'Throw AppStateWrong.error if data contains errors field with null value',
          () async {
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 422,
              statusMessage: 'error',
              data: {
                'errors': null,
              },
            ),
          );
        }

        expect(() async => NetworkHandler.parseResult(req()),
            throwsA(AppStateWrong.error('server error: no content')));
      });

      test('Throw AppStateWrong.error if resp doesnt contains errors',
          () async {
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 422,
              statusMessage: 'error',
              data: <String, dynamic>{},
            ),
          );
        }

        expect(() async => NetworkHandler.parseResult(req()),
            throwsA(AppStateWrong.error('server error: no content')));
      });
    });

    group('When return other status code', () {
      /// If return other status code, should throw
      /// AppStateWrong.error with message '[$statusCode] server error'
      /// Also if response data is String, then it should return in details
      test(
          'Throw AppStateWrong.error without details, where data is not String',
          () async {
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 404,
              statusMessage: 'error',
              data: <String, dynamic>{},
            ),
          );
        }

        expect(() async => NetworkHandler.parseResult(req()),
            throwsA(AppStateWrong.error('[404] server error')));
      });

      test('Throw AppStateWrong.error with details where data is String',
          () async {
        Future<Response<dynamic>> req() {
          return Future(
            () => Response(
              requestOptions: RequestOptions(),
              statusCode: 404,
              statusMessage: 'error',
              data: 'Some string',
            ),
          );
        }

        expect(
            () async => NetworkHandler.parseResult(req()),
            throwsA(AppStateWrong.error('[404] server error',
                details: 'Some string')));
      });
    });
  });
}
