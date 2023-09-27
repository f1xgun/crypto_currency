import 'package:crypto_currency/core/services/storage/secure_storage.dart';
import 'package:crypto_currency/core/services/storage/secure_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final providerContainer = ProviderContainer();
  late dynamic secureStorage;
  setUp(() {
    secureStorage = providerContainer.read(secureStorageProvider);
  });

  test('secureStorageProvider is SecureStorage', () {
    expect(secureStorage, isA<SecureStorage>());
  });
}
