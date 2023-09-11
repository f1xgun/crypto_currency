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

  group('Auth UseCase test', () {
    when(() => mockSecureStorage.write(
        key: any(named: 'key'),
        value: any(named: 'value'))).thenAnswer((_) async => Future<void>);
    group('Test signIn', () {
      test('Test signIn with successfully result', () async {
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

      test('Test signIn with response exception from Repository', () async {
        when(() => mockAuthRepository.signIn(
                email: 'example', password: 'some password'))
            .thenThrow(ResponseException(message: 'Not Authorized'));

        expect(
            () async =>
                authUseCase.signIn(email: 'example', password: 'some password'),
            throwsA(isA<ResponseException>()));

        verifyNever(() => mockSecureStorage.write(key: 'token', value: 'some token'));
      });

      test('Test signIn with exception from secureStorage', () async {
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
      test('Test signUp with successfully result', () async {
        when(() => mockAuthRepository.signUp(
            email: 'example', password: 'some password')).thenAnswer(
          (_) async => true,
        );

        expect(
            await authUseCase.signUp(
              email: 'example',
              password: 'some password',
            ),
            true);
      });

      test('Test signUp with response exception from Repository', () async {
        when(() => mockAuthRepository.signUp(
                email: 'example', password: 'some password'))
            .thenThrow(ResponseException(message: 'Not Authorized'));

        expect(
            () async =>
                authUseCase.signUp(email: 'example', password: 'some password'),
            throwsA(isA<ResponseException>()));
      });

      test(
          'Test signUp with unsuccessfully result, '
          'ex. user with this email already has', () async {
        when(() => mockAuthRepository.signUp(
            email: 'example',
            password: 'some password')).thenAnswer((_) async => false);

        expect(
          await mockAuthRepository.signUp(
              email: 'example', password: 'some password'),
          false,
        );
      });
    });

    group('Test logOut', () {
      test('Test logOut with successfully result', () async {
        when(() => mockSecureStorage.delete(key: 'token'))
            .thenAnswer((_) async => Future<void>);

        expect(await authUseCase.logOut(), true);

        verify(() => mockSecureStorage.delete(key: 'token')).called(1);
      });

      test('Test logOut with response exception from SecureStorage', () async {
        when(() => mockSecureStorage.delete(key: 'token'))
            .thenThrow(Exception());

        expect(() async => authUseCase.logOut(), throwsA(isA<Exception>()));

        verify(() => mockSecureStorage.delete(key: 'token')).called(1);
      });
    });
  });
}
