import 'package:crypto_currency/core/exceptions/exceptions.dart';
import 'package:crypto_currency/core/logger/logger.dart';
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
    } on NoInternetException catch (e, stackTrace) {
      state = AuthState.failure(e.message);
      logger.error('SignIn: ${e.message}', e, stackTrace);
    } on ResponseException catch (e, stackTrace) {
      state = AuthState.failure(e.message);
      logger.error('SignIn: ${e.message}', e, stackTrace);
    } on UnknownNetworkException catch (e, stackTrace) {
      state = AuthState.failure(e.message);
      logger.error('SignIn: ${e.message}', e, stackTrace);
    } on Object catch (e, stackTrace) {
      state = AuthState.failure(e.toString());
      logger.error('SignIn: $e', e, stackTrace);
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      state = const AuthState.loading();
      await _authUseCase.signUp(email: email, password: password);
      state = const AuthState.unauthorized();
    } on NoInternetException catch (e, stackTrace) {
      state = AuthState.failure(e.message);
      logger.error('SignUp: ${e.message}', e, stackTrace);
    } on ResponseException catch (e, stackTrace) {
      state = AuthState.failure(e.message);
      logger.error('SignUp: ${e.message}', e, stackTrace);
    } on UnknownNetworkException catch (e, stackTrace) {
      state = AuthState.failure(e.message);
      logger.error('SignUp: ${e.message}', e, stackTrace);
    } on Object catch (e, stackTrace) {
      state = AuthState.failure(e.toString());
      logger.error('SignUp: $e', e, stackTrace);
    }
  }

  Future<void> logOut() async {
    try {
      await _authUseCase.logOut();
      state = const AuthState.unauthorized();
    } on Object catch (e, stackTrace) {
      state = AuthState.failure(e.toString());
      logger.error('LogOut: $e', e, stackTrace);
    }
  }
}
