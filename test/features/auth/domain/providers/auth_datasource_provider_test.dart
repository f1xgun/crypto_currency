import 'package:crypto_currency/core/services/network/network_service.dart';
import 'package:crypto_currency/core/services/network/network_service_provider.dart';
import 'package:crypto_currency/features/auth/data/datasources/auth_datasource.dart';
import 'package:crypto_currency/features/auth/domain/providers/auth_datasource_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final providerContainer = ProviderContainer();
  late dynamic networkService;
  late dynamic authDataSource;
  
  setUpAll(() {
    networkService = providerContainer.read(networkServiceProvider);
    authDataSource = providerContainer
        .read(authDataSourceProvider(networkService as NetworkService));
  });

  test('authDataSourceProvider is a AuthDataSource', () {
    expect(authDataSource, isA<AuthDataSource>());
  });
}
