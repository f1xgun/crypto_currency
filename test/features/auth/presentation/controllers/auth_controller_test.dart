import 'dart:async';

import 'package:crypto_currency/core/exceptions/exceptions.dart';
import 'package:crypto_currency/features/auth/domain/usecases/auth_usecase.dart';
import 'package:crypto_currency/features/auth/presentation/controllers/auth_controller.dart';
import 'package:crypto_currency/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_data/users.dart';
import '../../domain/usecases/auth_usecase_mock.dart';

void main() {
  late AuthController authController;
  final AuthUseCase authUseCase = MockAuthUseCase();

  setUp(() {
    authController = AuthController(authUseCase: authUseCase);
  });

  group('AuthController', () {
    group('Test signIn', () {
      test('successfully', () async {
        when(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .thenAnswer((_) async => Future.value(users[0]));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            AuthState.authorized(user: users[0]),
          ]),
        ));

        await authController.signIn(email: 'valid', password: 'valid');

        // Check that AuthUseCase signIn method called only once
        verify(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with NoInternetException', () async {
        when(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .thenThrow(NoInternetException());

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('No internet connection'),
          ]),
        ));

        await authController.signIn(email: 'valid', password: 'valid');

        // Check that AuthUseCase signIn method called only once
        verify(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with ResponseException', () async {
        when(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .thenThrow(ResponseException(message: 'ResponseException'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('ResponseException'),
          ]),
        ));

        await authController.signIn(email: 'valid', password: 'valid');

        // Check that AuthUseCase signIn method called only once
        verify(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with UnknownNetworkException', () async {
        when(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .thenThrow(UnknownNetworkException());

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('Unknown network error'),
          ]),
        ));

        await authController.signIn(email: 'valid', password: 'valid');

        // Check that AuthUseCase signIn method called only once
        verify(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with uncaught Exception', () async {
        when(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .thenThrow(Exception('Uncaught exception'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('Exception: Uncaught exception'),
          ]),
        ));

        await authController.signIn(email: 'valid', password: 'valid');

        // Check that AuthUseCase signIn method called only once
        verify(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));
    });

    group('Test signUp', () {
      test('successfully', () async {
        when(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .thenAnswer((_) async => Future<void>);

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.unauthorized(),
          ]),
        ));

        await authController.signUp(email: 'valid', password: 'valid');

        // Check that AuthUseCase signUp method called only once
        verify(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with NoInternetException', () async {
        when(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .thenThrow(NoInternetException());

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('No internet connection'),
          ]),
        ));

        await authController.signUp(email: 'valid', password: 'valid');

        // Check that AuthUseCase signUp method called only once
        verify(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with ResponseException', () async {
        when(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .thenThrow(ResponseException(message: 'ResponseException'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('ResponseException'),
          ]),
        ));

        await authController.signUp(email: 'valid', password: 'valid');

        // Check that AuthUseCase signUp method called only once
        verify(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with UnknownNetworkException', () async {
        when(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .thenThrow(UnknownNetworkException());

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('Unknown network error'),
          ]),
        ));

        await authController.signUp(email: 'valid', password: 'valid');

        // Check that AuthUseCase signUp method called only once
        verify(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with uncaught Exception', () async {
        when(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .thenThrow(Exception('Uncaught exception'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('Exception: Uncaught exception'),
          ]),
        ));

        await authController.signUp(email: 'valid', password: 'valid');

        // Check that AuthUseCase signUp method called only once
        verify(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));
    });

    group('Test logOut', () {
      test('successfully', () async {
        when(authUseCase.logOut).thenAnswer((_) async => Future<void>);

        await authController.logOut();

        // Check AuthController state
        expect(authController.state, const AuthState.unauthorized());

        // Check that AuthUseCase signUp method called only once
        verify(authUseCase.logOut).called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with uncaught Exception', () async {
        when(authUseCase.logOut).thenThrow(Exception('Uncaught exception'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.failure('Exception: Uncaught exception'),
          ]),
        ));

        await authController.logOut();

        // Check that AuthUseCase signUp method called only once
        verify(authUseCase.logOut).called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));
    });
  });
}
