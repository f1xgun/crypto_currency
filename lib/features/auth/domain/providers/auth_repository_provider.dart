import 'package:crypto_currency/core/services/network/network_service.dart';
import 'package:crypto_currency/core/services/network/network_service_provider.dart';
import 'package:crypto_currency/features/auth/data/datasources/auth_datasource.dart';
import 'package:crypto_currency/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:crypto_currency/features/auth/domain/providers/auth_datasource_provider.dart';
import 'package:crypto_currency/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  final NetworkService networkService = ref.read(networkServiceProvider);
  final AuthDataSource authDataSource =
      ref.read(authDataSourceProvider(networkService));
  return AuthRepositoryImpl(authDataSource: authDataSource);
});
