import 'package:crypto_currency/features/auth/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.unauthorized() = _AuthStateUnauthorized;

  const factory AuthState.loading() = _AuthStateLoading;

  const factory AuthState.failure([String? errorMessage]) = _AuthStateFailure;

  const factory AuthState.authorized({required User user}) =
      _AuthStateAuthorized;
}
