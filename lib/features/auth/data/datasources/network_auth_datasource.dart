import 'package:crypto_currency/core/services/network/network_service.dart';
import 'package:crypto_currency/features/auth/data/datasources/auth_datasource.dart';
import 'package:crypto_currency/features/auth/data/models/user_dto.dart';

class NetworkAuthDataSource implements AuthDataSource {
  final NetworkService networkService;

  const NetworkAuthDataSource({required this.networkService});

  @override
  Future<(UserDTO, String)> signIn(
      {required String email, required String password}) async {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
