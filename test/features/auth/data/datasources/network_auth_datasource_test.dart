import 'package:crypto_currency/core/exceptions/app_state.dart';
import 'package:crypto_currency/core/services/network/network_service.dart';
import 'package:crypto_currency/features/auth/data/datasources/network_auth_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/services/network/network_service_mock.dart';
import '../../../../mock_data/users.dart';

void main() {
  late NetworkAuthDataSource networkAuthDataSource;
  late NetworkService mockNetworkService;

  setUpAll(() {
    mockNetworkService = MockNetworkService();
    networkAuthDataSource =
        NetworkAuthDataSource(networkService: mockNetworkService);
  });

  group('Test NetworkAuthDataSource', () {
    group('SignIn method', () {
      /// When NetworkService return Map<String, dynamic> with keys: token and user
      /// Should return Record<UserDTO, String>, else should throw AppStateWrong.warning with message: "[Sign in] Bad response: " or rethrow exception
      /// if exception throwed early from NetworkService

      test('NetworkService return Map with keys token and user', () async {
        when(() => mockNetworkService.post('/login',
                queryParameters: {'email': 'email', 'password': 'password'}))
            .thenAnswer(
          (_) => Future.value(
            <String, dynamic>{
              'token': 'token',
              'user': usersJSON[0],
            },
          ),
        );

        expect(
          await networkAuthDataSource.signIn(
              email: 'email', password: 'password'),
          (usersDTO[0], 'token'),
        );
      });

      test('NetworkService return Map with only token key', () async {
        when(() => mockNetworkService.post('/login',
                queryParameters: {'email': 'email', 'password': 'password'}))
            .thenAnswer(
          (_) => Future.value(<String, dynamic>{'token': 'token'}),
        );

        expect(
            () async => networkAuthDataSource.signIn(
                email: 'email', password: 'password'),
            throwsA(AppStateWrong.warning('[Sign in] Bad response: no user')));
      });

      test('NetworkService return Map with only user key', () async {
        when(() => mockNetworkService.post('/login',
                queryParameters: {'email': 'email', 'password': 'password'}))
            .thenAnswer(
          (_) => Future.value(<String, dynamic>{'user': usersJSON[0]}),
        );

        expect(
            () async => networkAuthDataSource.signIn(
                email: 'email', password: 'password'),
            throwsA(AppStateWrong.warning('[Sign in] Bad response: no token')));
      });

      test('NetworkService return Map without token and user key', () async {
        when(() => mockNetworkService.post('/login',
                queryParameters: {'email': 'email', 'password': 'password'}))
            .thenAnswer(
          (_) => Future.value(<String, dynamic>{}),
        );

        expect(
            () async => networkAuthDataSource.signIn(
                email: 'email', password: 'password'),
            throwsA(AppStateWrong.warning(
                '[Sign in] Bad response: no token no user')));
      });

      test('NetworkService throw AppStateWrong.error', () async {
        when(() => mockNetworkService.post('/login',
                queryParameters: {'email': 'email', 'password': 'password'}))
            .thenThrow(AppStateWrong.error('[500] server error'));

        expect(
            () async => networkAuthDataSource.signIn(
                email: 'email', password: 'password'),
            throwsA(AppStateWrong.error('[500] server error')));
      });
    });

    group('SignUp method', () {
      /// When NetworkService throws exception, should rethrow that
      /// else return void

      test('NetworkService throw AppStateWrong.error', () async {
        when(() => mockNetworkService.post('/registration',
                queryParameters: {'email': 'email', 'password': 'password'}))
            .thenThrow(AppStateWrong.error('[500] server error'));

        expect(
            () async => networkAuthDataSource.signUp(
                email: 'email', password: 'password'),
            throwsA(AppStateWrong.error('[500] server error')));
      });

      test('NetworkService return some value', () async {
        when(() => mockNetworkService.post('/registration',
                queryParameters: {'email': 'email', 'password': 'password'}))
            .thenAnswer((_) => Future.value({}));

        expect(
            networkAuthDataSource.signUp(email: 'email', password: 'password'),
            isA<Future<void>>());
      });
    });
  });
}
