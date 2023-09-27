import 'package:crypto_currency/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:crypto_currency/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final providerContainer = ProviderContainer();
  late dynamic authRepository;
  setUp(() {
    authRepository = providerContainer.read(authRepositoryProvider);
  });

  test('authRepositoryProvider is AuthRepository', () {
    expect(authRepository, isA<AuthRepository>());
  });
}
