import 'package:crypto_currency/features/auth/domain/providers/auth_usecase_provider.dart';
import 'package:crypto_currency/features/auth/domain/usecases/auth_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final providerContainer = ProviderContainer();
  late dynamic authUseCase;

  setUp(() {
    authUseCase = providerContainer.read(authUseCaseProvider);
  });

  test('authUseCaseProvider is AuthUseCase', () {
    expect(authUseCase, isA<AuthUseCase>());
  });
}
