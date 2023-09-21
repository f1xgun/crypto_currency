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

  group('Auth Repository', () {
    group('Test signIn', () {
      test('with successfully result', () async {
        when(() => authDataSource.signIn(
            email: 'example', password: 'some password')).thenAnswer(
          (_) async => (usersDTO[0], 'some token'),
        );

        expect(
            await repository.signIn(
                email: 'example', password: 'some password'),
            (users[0], 'some token'));
      });

      test('with response exception from DataSource', () async {
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
      test('with ResponseException from DataSource', () async {
        when(() => authDataSource.signUp(
                email: 'example', password: 'some password'))
            .thenThrow(ResponseException(message: 'Not Authorized'));

        expect(
            () async =>
                repository.signUp(email: 'example', password: 'some password'),
            throwsA(isA<ResponseException>()));
      });

      test('with NoInternetException from DataSource', () async {
        when(() => authDataSource.signUp(
            email: 'example',
            password: 'some password')).thenThrow(NoInternetException());

        expect(
            () async =>
                repository.signUp(email: 'example', password: 'some password'),
            throwsA(isA<NoInternetException>()));
      });

      test('with UnknownNetworkException from DataSource', () async {
        when(() => authDataSource.signUp(
            email: 'example',
            password: 'some password')).thenThrow(UnknownNetworkException());

        expect(
            () async =>
                repository.signUp(email: 'example', password: 'some password'),
            throwsA(isA<UnknownNetworkException>()));
      });

      test('with Exception from DataSource', () async {
        when(() => authDataSource.signUp(
            email: 'example',
            password: 'some password')).thenThrow(Exception());

        expect(
            () async =>
                repository.signUp(email: 'example', password: 'some password'),
            throwsA(isA<Exception>()));
      });
    });
  });
}
