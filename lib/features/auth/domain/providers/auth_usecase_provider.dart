import 'package:crypto_currency/core/services/storage/secure_storage.dart';
import 'package:crypto_currency/core/services/storage/secure_storage_provider.dart';
import 'package:crypto_currency/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:crypto_currency/features/auth/domain/repositories/auth_repository.dart';
import 'package:crypto_currency/features/auth/domain/usecases/auth_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authUseCaseProvider = Provider.autoDispose<AuthUseCase>((ref) {
  final AuthRepository authRepository = ref.read(authRepositoryProvider);
  final SecureStorage secureStorage = ref.read(secureStorageProvider);
  return AuthUseCase(
      authRepository: authRepository, secureStorage: secureStorage);
});
