import 'package:crypto_currency/core/exceptions/app_state.dart';
import 'package:crypto_currency/core/services/network/network_service.dart';
import 'package:crypto_currency/features/auth/data/datasources/auth_datasource.dart';
import 'package:crypto_currency/features/auth/data/models/user_dto.dart';

class NetworkAuthDataSource implements AuthDataSource {
  final NetworkService networkService;

  const NetworkAuthDataSource({required this.networkService});

  @override
  Future<(UserDTO, String)> signIn(
      {required String email, required String password}) async {
    final result = await networkService
        .post('/', queryParameters: {'email': email, 'password': password});
    if (result.containsKey('token') && result.containsKey('user')) {
      final String token = result['token'] as String;
      final UserDTO userDTO =
          UserDTO.fromJson(result['user'] as Map<String, dynamic>);
      return (userDTO, token);
    } else {
      throw AppStateWrong.warning(
          "[Sign in] Bad response:${result.containsKey('token') ? '' : ' no token'}${result.containsKey('user') ? '' : ' no user'}");
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    await networkService
        .post('/', queryParameters: {'email': email, 'password': password});
  }
}
