import 'package:crypto_currency/core/services/storage/secure_storage.dart';
import 'package:crypto_currency/features/auth/domain/entities/user.dart';
import 'package:crypto_currency/features/auth/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;
  final SecureStorage secureStorage;

  const AuthUseCase({
    required this.authRepository,
    required this.secureStorage,
  });

  Future<User> signIn({required String email, required String password}) async {
    try {
      final (user, token) =
          await authRepository.signIn(email: email, password: password);

      await secureStorage.write(key: 'token', value: token);

      return user;
    } on Object catch (_) {
      rethrow;
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      await authRepository.signUp(email: email, password: password);
    } on Object catch (_) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      await secureStorage.delete(key: 'token');
    } on Object catch (_) {
      rethrow;
    }
  }
}
