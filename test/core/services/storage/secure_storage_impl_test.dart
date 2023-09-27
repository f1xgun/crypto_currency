import 'package:crypto_currency/core/services/storage/secure_storage.dart';
import 'package:crypto_currency/core/services/storage/secure_storage_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'secure_storage_mock.dart';

void main() {
  final FlutterSecureStorage mockFlutterSecureStorage =
      MockFlutterSecureStorage();
  late SecureStorage secureStorage;
  setUp(() {
    secureStorage =
        SecureStorageImpl(flutterSecureStorage: mockFlutterSecureStorage);
  });

  group('SecureStorage', () {
    group('delete method', () {
      test('successfully delete with void return value', () {
        when(() => mockFlutterSecureStorage.delete(key: any(named: 'key')))
            .thenAnswer((_) async => Future<void>);

        expect(secureStorage.delete(key: 'something'), isA<Future<void>>());
      });

      test('rethrow exception, if FlutterSecureStorage throw exception', () {
        when(() => mockFlutterSecureStorage.delete(key: any(named: 'key')))
            .thenThrow(Exception('some error'));

        expect(() async => secureStorage.delete(key: 'something'),
            throwsA(isA<Exception>()));
      });
    });

    group('get method', () {
      test('successfully get with null return value', () async {
        when(() => mockFlutterSecureStorage.read(key: any(named: 'key')))
            .thenAnswer((_) async => null);

        expect(await secureStorage.get(key: 'something'), null);
      });

      test('successfully get with non-null return value', () async {
        when(() => mockFlutterSecureStorage.read(key: any(named: 'key')))
            .thenAnswer((_) async => 'some value');

        expect(await secureStorage.get(key: 'something'), 'some value');
      });

      test('rethrow exception, if FlutterSecureStorage throw exception',
          () async {
        when(() => mockFlutterSecureStorage.read(key: any(named: 'key')))
            .thenThrow(Exception('some error'));

        expect(() async => secureStorage.get(key: 'something'),
            throwsA(isA<Exception>()));
      });
    });

    group('getToken method', () {
      test(
          'successfully with empty string return value, when no token in secureStorage',
          () async {
        when(() => mockFlutterSecureStorage.read(key: 'token'))
            .thenAnswer((_) async => null);

        expect(await secureStorage.getToken(), '');
      });

      test('successfully with some token from secure storage', () async {
        when(() => mockFlutterSecureStorage.read(key: 'token'))
            .thenAnswer((_) async => 'some token');

        expect(await secureStorage.getToken(), 'some token');
      });

      test('rethrow exception, if FlutterSecureStorage throw exception',
          () async {
        when(() => mockFlutterSecureStorage.read(key: 'token'))
            .thenThrow(Exception('some error'));

        expect(() async => secureStorage.getToken(), throwsA(isA<Exception>()));
      });
    });

    group('write method', () {
      test('successfully with void return value', () async {
        when(() => mockFlutterSecureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'))).thenAnswer((_) async => Future<void>);

        expect(secureStorage.write(key: 'key', value: 'value'),
            isA<Future<void>>());
      });

      test('rethrow exception, if FlutterSecureStorage throw exception',
          () async {
        when(() => mockFlutterSecureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'))).thenThrow(Exception('some error'));

        expect(() async => secureStorage.write(key: 'key', value: 'value'),
            throwsA(isA<Exception>()));
      });
    });
  });
}
