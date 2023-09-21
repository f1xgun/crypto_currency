import 'package:crypto_currency/features/auth/data/datasources/auth_datasource.dart';
import 'package:crypto_currency/features/auth/data/mappers/user_mapper.dart';
import 'package:crypto_currency/features/auth/domain/entities/user.dart';
import 'package:crypto_currency/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  const AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<(User, String)> signIn(
      {required String email, required String password}) async {
    try {
      final (userDTO, token) =
          await authDataSource.signIn(email: email, password: password);
      final User user = UserMapper.fromDTO(userDTO);
      return (user, token);
    } on Object catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await authDataSource.signUp(email: email, password: password);
    } on Object catch (_) {
      rethrow;
    }
  }
}
