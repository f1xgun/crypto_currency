import 'package:crypto_currency/features/auth/data/models/user_dto.dart';

abstract interface class AuthDataSource {
  Future<(UserDTO, String)> signIn(
      {required String email, required String password});

  Future<bool> signUp({required String email, required String password});
}
