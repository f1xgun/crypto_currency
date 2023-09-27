import 'package:crypto_currency/core/services/network/network_service.dart';
import 'package:crypto_currency/features/auth/data/datasources/auth_datasource.dart';
import 'package:crypto_currency/features/auth/data/datasources/network_auth_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDataSourceProvider = Provider.autoDispose
    .family<AuthDataSource, NetworkService>((_, networkService) {
  return NetworkAuthDataSource(networkService: networkService);
});
