import 'dart:async';

import 'package:crypto_currency/core/exceptions/app_state.dart';
import 'package:crypto_currency/features/auth/domain/usecases/auth_usecase.dart';
import 'package:crypto_currency/features/auth/presentation/controllers/auth_controller.dart';
import 'package:crypto_currency/features/auth/presentation/controllers/auth_state.dart';
import 'package:dio/dio.dart';
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

      test('fails with AppStateWrong.warning', () async {
        when(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .thenThrow(AppStateWrong.warning('Not found'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('Not found'),
          ]),
        ));

        await authController.signIn(email: 'valid', password: 'valid');

        // Check that AuthUseCase signIn method called only once
        verify(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with AppStateWrong.error', () async {
        when(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .thenThrow(AppStateWrong.error('Not found'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('Not found'),
          ]),
        ));

        await authController.signIn(email: 'valid', password: 'valid');

        // Check that AuthUseCase signIn method called only once
        verify(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with DioException', () async {
        when(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .thenThrow(DioException(
                requestOptions: RequestOptions(), message: 'dio exception'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('dio exception'),
          ]),
        ));

        await authController.signIn(email: 'valid', password: 'valid');

        // Check that AuthUseCase signIn method called only once
        verify(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with TypeError', () async {
        when(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .thenThrow(TypeError());

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure("Instance of 'TypeError'"),
          ]),
        ));

        await authController.signIn(email: 'valid', password: 'valid');

        // Check that AuthUseCase signIn method called only once
        verify(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with Unhandled error', () async {
        when(() => authUseCase.signIn(email: 'valid', password: 'valid'))
            .thenThrow(Object());

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure("Instance of 'Object'"),
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

      test('fails with AppStateWrong.warning', () async {
        when(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .thenThrow(AppStateWrong.warning('some error'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('some error'),
          ]),
        ));

        await authController.signUp(email: 'valid', password: 'valid');

        // Check that AuthUseCase signUp method called only once
        verify(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with AppStateWrong.error', () async {
        when(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .thenThrow(AppStateWrong.error('some error'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('some error'),
          ]),
        ));

        await authController.signUp(email: 'valid', password: 'valid');

        // Check that AuthUseCase signUp method called only once
        verify(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with DioException', () async {
        when(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .thenThrow(DioException(
                requestOptions: RequestOptions(), message: 'dio exception'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('dio exception'),
          ]),
        ));

        await authController.signUp(email: 'valid', password: 'valid');

        // Check that AuthUseCase signUp method called only once
        verify(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with TypeError', () async {
        when(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .thenThrow(TypeError());

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure("Instance of 'TypeError'"),
          ]),
        ));

        await authController.signUp(email: 'valid', password: 'valid');

        // Check that AuthUseCase signUp method called only once
        verify(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with Unhandled error', () async {
        when(() => authUseCase.signUp(email: 'valid', password: 'valid'))
            .thenThrow(Exception('Unhandled error'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.loading(),
            const AuthState.failure('Exception: Unhandled error'),
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

      test('fails with AppStateWrong.warning', () async {
        when(authUseCase.logOut)
            .thenThrow(AppStateWrong.warning('AppStateWrong.warning'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.failure('AppStateWrong.warning'),
          ]),
        ));

        await authController.logOut();

        // Check that AuthUseCase signUp method called only once
        verify(authUseCase.logOut).called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with AppStateWrong.error', () async {
        when(authUseCase.logOut)
            .thenThrow(AppStateWrong.error('AppStateWrong.error'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.failure('AppStateWrong.error'),
          ]),
        ));

        await authController.logOut();

        // Check that AuthUseCase signUp method called only once
        verify(authUseCase.logOut).called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with DioException', () async {
        when(authUseCase.logOut).thenThrow(DioException(
            requestOptions: RequestOptions(), message: 'DioException'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.failure('DioException'),
          ]),
        ));

        await authController.logOut();

        // Check that AuthUseCase signUp method called only once
        verify(authUseCase.logOut).called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with TypeError', () async {
        when(authUseCase.logOut).thenThrow(TypeError());

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.failure("Instance of 'TypeError'"),
          ]),
        ));

        await authController.logOut();

        // Check that AuthUseCase signUp method called only once
        verify(authUseCase.logOut).called(1);

        // Check that AuthUseCase methods no more called
        verifyNoMoreInteractions(authUseCase);
      }, timeout: const Timeout(Duration(milliseconds: 500)));

      test('fails with Unhandled error', () async {
        when(authUseCase.logOut).thenThrow(Exception('Unhandled Error'));

        // Check AuthController states
        unawaited(expectLater(
          authController.stream,
          emitsInOrder([
            const AuthState.failure('Exception: Unhandled Error'),
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
