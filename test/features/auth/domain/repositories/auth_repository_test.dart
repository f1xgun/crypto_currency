import 'package:crypto_currency/core/exceptions/app_state.dart';
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
      test('with AppStateSuccess', () async {
        when(() => authDataSource.signIn(
            email: 'example', password: 'some password')).thenAnswer(
          (_) async => (usersDTO[0], 'some token'),
        );

        expect(
            await repository.signIn(
                email: 'example', password: 'some password'),
            (users[0], 'some token'));
      });

      test('with AppStateWrong.error from DataSource', () async {
        when(() => authDataSource.signIn(
                email: 'example', password: 'some password'))
            .thenThrow(AppStateWrong.error('Not Authorized'));

        expect(
            () async =>
                repository.signIn(email: 'example', password: 'some password'),
            throwsA(isA<AppStateWrong>()));
      });

      test('with AppStateWrong.warning from DataSource', () async {
        when(() => authDataSource.signIn(
                email: 'example', password: 'some password'))
            .thenThrow(AppStateWrong.warning('[400] Not Authorized'));

        expect(
            () async =>
                repository.signIn(email: 'example', password: 'some password'),
            throwsA(isA<AppStateWrong>()));
      });
    });

    group('Test signUp', () {
      test('with AppStateWrong.warning from DataSource', () async {
        when(() => authDataSource.signUp(
                email: 'example', password: 'some password'))
            .thenThrow(AppStateWrong.warning('[400] Not Authorized'));

        expect(
            () async =>
                repository.signUp(email: 'example', password: 'some password'),
            throwsA(isA<AppStateWrong>()));
      });

      test('with AppStateWrong.error from DataSource', () async {
        when(() => authDataSource.signUp(
                email: 'example', password: 'some password'))
            .thenThrow(AppStateWrong.error('Not found'));

        expect(
            () async =>
                repository.signUp(email: 'example', password: 'some password'),
            throwsA(isA<AppStateWrong>()));
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
