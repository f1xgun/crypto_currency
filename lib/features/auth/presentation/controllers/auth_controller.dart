import 'package:crypto_currency/core/exceptions/app_state.dart';
import 'package:crypto_currency/features/auth/domain/usecases/auth_usecase.dart';
import 'package:crypto_currency/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthController({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(const AuthState.unauthorized());

  Future<void> signIn({required String email, required String password}) async {
    try {
      state = const AuthState.loading();
      final user = await _authUseCase.signIn(email: email, password: password);
      state = AuthState.authorized(user: user);
    } on Object catch (e, stackTrace) {
      final error =
          AppState.catchErrorHandler(e, details: stackTrace.toString());
      state = AuthState.failure(error.message);
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      state = const AuthState.loading();
      await _authUseCase.signUp(email: email, password: password);
      state = const AuthState.unauthorized();
    } on Object catch (e, stackTrace) {
      final error =
          AppState.catchErrorHandler(e, details: stackTrace.toString());
      state = AuthState.failure(error.message);
    }
  }

  Future<void> logOut() async {
    try {
      await _authUseCase.logOut();
      state = const AuthState.unauthorized();
    } on Object catch (e, stackTrace) {
      final error =
          AppState.catchErrorHandler(e, details: stackTrace.toString());
      state = AuthState.failure(error.message);
    }
  }
}
