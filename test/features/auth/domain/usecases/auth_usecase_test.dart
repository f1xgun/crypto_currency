import 'package:crypto_currency/core/exceptions/exceptions.dart';
import 'package:crypto_currency/features/auth/domain/usecases/auth_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/services/storage/secure_storage_mock.dart';
import '../../../../mock_data/users.dart';
import '../repositories/auth_repository_mock.dart';

void main() {
  late AuthUseCase authUseCase;
  final MockAuthRepository mockAuthRepository = MockAuthRepository();
  final MockSecureStorage mockSecureStorage = MockSecureStorage();

  setUp(
    () => authUseCase = AuthUseCase(
      authRepository: mockAuthRepository,
      secureStorage: mockSecureStorage,
    ),
  );

  group('AuthUseCase', () {
    when(() => mockSecureStorage.write(
        key: any(named: 'key'),
        value: any(named: 'value'))).thenAnswer((_) async => Future<void>);
    group('Test signIn', () {
      test('with successfully result', () async {
        when(() => mockAuthRepository.signIn(
            email: 'example', password: 'some password')).thenAnswer(
          (_) async => (users[0], 'some token'),
        );

        expect(
          await authUseCase.signIn(
            email: 'example',
            password: 'some password',
          ),
          users[0],
        );

        verify(() => mockSecureStorage.write(key: 'token', value: 'some token'))
            .called(1);
      });

      test('with ResponseException from Repository', () async {
        when(() => mockAuthRepository.signIn(
                email: 'example', password: 'some password'))
            .thenThrow(ResponseException(message: 'Not Authorized'));

        expect(
            () async =>
                authUseCase.signIn(email: 'example', password: 'some password'),
            throwsA(isA<ResponseException>()));

        verifyNever(
            () => mockSecureStorage.write(key: 'token', value: 'some token'));
      });

      test('with Exception from secureStorage', () async {
        when(() => mockAuthRepository.signIn(
            email: 'example', password: 'some password')).thenAnswer(
          (_) async => (users[0], 'some token'),
        );

        when(() => mockSecureStorage.write(key: 'token', value: 'some token'))
            .thenThrow(Exception());

        expect(
          () async => authUseCase.signIn(
            email: 'example',
            password: 'some password',
          ),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('Test signUp', () {
      test('with ResponseException from Repository', () async {
        when(() => mockAuthRepository.signUp(
                email: 'example', password: 'some password'))
            .thenThrow(ResponseException(message: 'Not Authorized'));

        expect(
            () async =>
                authUseCase.signUp(email: 'example', password: 'some password'),
            throwsA(isA<ResponseException>()));
      });

      test('with NoInternetException from Repository', () async {
        when(() => mockAuthRepository.signUp(
            email: 'example',
            password: 'some password')).thenThrow(NoInternetException());

        expect(
            () async =>
                authUseCase.signUp(email: 'example', password: 'some password'),
            throwsA(isA<NoInternetException>()));
      });

      test('with UnknownNetworkException from Repository', () async {
        when(() => mockAuthRepository.signUp(
            email: 'example',
            password: 'some password')).thenThrow(UnknownNetworkException());

        expect(
            () async =>
                authUseCase.signUp(email: 'example', password: 'some password'),
            throwsA(isA<UnknownNetworkException>()));
      });

      test('with uncaught Exception from Repository', () async {
        when(() => mockAuthRepository.signUp(
            email: 'example',
            password: 'some password')).thenThrow(Exception());

        expect(
            () async =>
                authUseCase.signUp(email: 'example', password: 'some password'),
            throwsA(isA<Exception>()));
      });
    });

    group('Test logOut', () {
      test('with successfully result', () async {
        when(() => mockSecureStorage.delete(key: 'token'))
            .thenAnswer((_) async => Future<void>);

        await authUseCase.logOut();

        verify(() => mockSecureStorage.delete(key: 'token')).called(1);
      });

      test('with response exception from SecureStorage', () async {
        when(() => mockSecureStorage.delete(key: 'token'))
            .thenThrow(Exception());

        expect(() async => authUseCase.logOut(), throwsA(isA<Exception>()));

        verify(() => mockSecureStorage.delete(key: 'token')).called(1);
      });
    });
  });
}
