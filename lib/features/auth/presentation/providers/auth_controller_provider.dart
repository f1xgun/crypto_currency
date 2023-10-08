import 'package:crypto_currency/features/auth/domain/providers/auth_usecase_provider.dart';
import 'package:crypto_currency/features/auth/presentation/controllers/auth_controller.dart';
import 'package:crypto_currency/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(authUseCase: ref.read(authUseCaseProvider));
});
