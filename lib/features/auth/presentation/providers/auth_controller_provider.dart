import 'package:crypto_currency/core/exceptions/app_state.dart';
import 'package:crypto_currency/features/auth/domain/providers/auth_usecase_provider.dart';
import 'package:crypto_currency/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, AppState>((ref) {
  return AuthController(authUseCase: ref.read(authUseCaseProvider));
});
