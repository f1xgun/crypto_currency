import 'package:crypto_currency/core/services/network/network_service.dart';
import 'package:crypto_currency/core/services/network/network_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final providerContainer = ProviderContainer();
  late dynamic networkService;
  setUp(() {
    networkService = providerContainer.read(networkServiceProvider);
  });

  test('networkServiceProvider is NetworkService', () {
    expect(networkService, isA<NetworkService>());
  });
}
