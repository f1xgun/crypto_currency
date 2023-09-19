import 'package:crypto_currency/core/logger/logger.dart';
import 'package:crypto_currency/features/auth/domain/usecases/auth_usecase.dart';
import 'package:crypto_currency/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthNotifier({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(const AuthState.unauthorized());

  Future<void> signIn({required String email, required String password}) async {
    try {
      state = const AuthState.loading();
      final user = await _authUseCase.signIn(email: email, password: password);
      state = AuthState.authorized(user: user);
    } on Object catch (e, stackTrace) {
      state = AuthState.failure(e.toString());
      logger.error(e.toString(), e, stackTrace);
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      state = const AuthState.loading();
      final signUpResult =
          await _authUseCase.signUp(email: email, password: password);
      if (signUpResult) {
        state = const AuthState.unauthorized();
      } else {
        state = const AuthState.failure();
      }
    } on Object catch (e, stackTrace) {
      state = AuthState.failure(e.toString());
      logger.error(e.toString(), e, stackTrace);
    }
  }

  Future<void> logOut() async {
    try {
      final result = await _authUseCase.logOut();
      if (result) {
        state = const AuthState.unauthorized();
      } else {
        state = const AuthState.failure();
      }
    } on Object catch (e, stackTrace) {
      state = AuthState.failure(e.toString());
      logger.error(e.toString(), e, stackTrace);
    }
  }
}
