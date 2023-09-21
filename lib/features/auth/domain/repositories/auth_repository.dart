import 'package:crypto_currency/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<(User, String)> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({required String email, required String password});
}
