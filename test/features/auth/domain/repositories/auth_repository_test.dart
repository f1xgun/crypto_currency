import 'package:crypto_currency/core/exceptions/exceptions.dart';
import 'package:crypto_currency/features/auth/data/datasources/auth_datasource.dart';
import 'package:crypto_currency/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_data/users.dart';
import '../../data/datasources/auth_datasource_mock.dart';

void main() {
  late AuthRepositoryImpl repository;
  final AuthDataSource authDataSource = MockAuthDataSource();

  setUp(
    () => {
      repository = AuthRepositoryImpl(authDataSource: authDataSource),
    },
  );

  group('Auth Repository Test', () {
    group('Test signIn', () {
      test('Test signIn with successfully result', () async {
        when(() => authDataSource.signIn(
            email: 'example', password: 'some password')).thenAnswer(
          (_) async => (usersDTO[0], 'some token'),
        );

        expect(
            await repository.signIn(
                email: 'example', password: 'some password'),
            (users[0], 'some token'));
      });

      test('Test signIn with response exception from DataSource', () async {
        when(() => authDataSource.signIn(
                email: 'example', password: 'some password'))
            .thenThrow(ResponseException(message: 'Not Authorized'));

        expect(
            () async =>
                repository.signIn(email: 'example', password: 'some password'),
            throwsA(isA<ResponseException>()));
      });
    });

    group('Test signUp', () {
      test('Test signUp with successfully result', () async {
        when(() => authDataSource.signUp(
            email: 'example',
            password: 'some password')).thenAnswer((_) async => true);

        expect(
            await authDataSource.signUp(
                email: 'example', password: 'some password'),
            true);
      });

      test(
          'Test signUp with unsuccessfully result, '
          'ex. user with this email already has', () async {
        when(() => authDataSource.signUp(
            email: 'example',
            password: 'some password')).thenAnswer((_) async => false);

        expect(
          await authDataSource.signUp(
              email: 'example', password: 'some password'),
          false,
        );
      });

      test('Test signUp with response exception from DataSource', () async {
        when(() => authDataSource.signUp(
                email: 'example', password: 'some password'))
            .thenThrow(ResponseException(message: 'Not Authorized'));

        expect(
            () async =>
                repository.signUp(email: 'example', password: 'some password'),
            throwsA(isA<ResponseException>()));
      });
    });
  });
}
