import 'package:crypto_currency/features/auth/presentation/controllers/auth_state.dart';
import 'package:crypto_currency/features/auth/presentation/providers/auth_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final providerContainer = ProviderContainer();
  late dynamic authController;

  setUp(() {
    authController = providerContainer.read(authControllerProvider);
  });

  test(
      'authControllerProvider is AuthController with initial state AuthState.unauthorized()',
      () {
    expect(authController, const AuthState.unauthorized());
  });
}
