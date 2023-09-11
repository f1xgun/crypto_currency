import 'package:crypto_currency/core/services/network/dio_network_service.dart';
import 'package:crypto_currency/core/services/network/network_service.dart';
import 'package:crypto_currency/core/services/storage/secure_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);

  return DioNetworkService(secureStorage: secureStorage);
});
