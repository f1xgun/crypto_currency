// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() loading,
    required TResult Function(String? errorMessage) failure,
    required TResult Function(User user) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
    TResult? Function(String? errorMessage)? failure,
    TResult? Function(User user)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? loading,
    TResult Function(String? errorMessage)? failure,
    TResult Function(User user)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateUnauthorized value) unauthorized,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateFailure value) failure,
    required TResult Function(_AuthStateAuthorized value) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateUnauthorized value)? unauthorized,
    TResult? Function(_AuthStateLoading value)? loading,
    TResult? Function(_AuthStateFailure value)? failure,
    TResult? Function(_AuthStateAuthorized value)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateFailure value)? failure,
    TResult Function(_AuthStateAuthorized value)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthStateUnauthorizedCopyWith<$Res> {
  factory _$$_AuthStateUnauthorizedCopyWith(_$_AuthStateUnauthorized value,
          $Res Function(_$_AuthStateUnauthorized) then) =
      __$$_AuthStateUnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateUnauthorizedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateUnauthorized>
    implements _$$_AuthStateUnauthorizedCopyWith<$Res> {
  __$$_AuthStateUnauthorizedCopyWithImpl(_$_AuthStateUnauthorized _value,
      $Res Function(_$_AuthStateUnauthorized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthStateUnauthorized implements _AuthStateUnauthorized {
  const _$_AuthStateUnauthorized();

  @override
  String toString() {
    return 'AuthState.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthStateUnauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() loading,
    required TResult Function(String? errorMessage) failure,
    required TResult Function(User user) authorized,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
    TResult? Function(String? errorMessage)? failure,
    TResult? Function(User user)? authorized,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? loading,
    TResult Function(String? errorMessage)? failure,
    TResult Function(User user)? authorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateUnauthorized value) unauthorized,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateFailure value) failure,
    required TResult Function(_AuthStateAuthorized value) authorized,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateUnauthorized value)? unauthorized,
    TResult? Function(_AuthStateLoading value)? loading,
    TResult? Function(_AuthStateFailure value)? failure,
    TResult? Function(_AuthStateAuthorized value)? authorized,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateFailure value)? failure,
    TResult Function(_AuthStateAuthorized value)? authorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _AuthStateUnauthorized implements AuthState {
  const factory _AuthStateUnauthorized() = _$_AuthStateUnauthorized;
}

/// @nodoc
abstract class _$$_AuthStateLoadingCopyWith<$Res> {
  factory _$$_AuthStateLoadingCopyWith(
          _$_AuthStateLoading value, $Res Function(_$_AuthStateLoading) then) =
      __$$_AuthStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateLoadingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateLoading>
    implements _$$_AuthStateLoadingCopyWith<$Res> {
  __$$_AuthStateLoadingCopyWithImpl(
      _$_AuthStateLoading _value, $Res Function(_$_AuthStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthStateLoading implements _AuthStateLoading {
  const _$_AuthStateLoading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() loading,
    required TResult Function(String? errorMessage) failure,
    required TResult Function(User user) authorized,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
    TResult? Function(String? errorMessage)? failure,
    TResult? Function(User user)? authorized,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? loading,
    TResult Function(String? errorMessage)? failure,
    TResult Function(User user)? authorized,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateUnauthorized value) unauthorized,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateFailure value) failure,
    required TResult Function(_AuthStateAuthorized value) authorized,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateUnauthorized value)? unauthorized,
    TResult? Function(_AuthStateLoading value)? loading,
    TResult? Function(_AuthStateFailure value)? failure,
    TResult? Function(_AuthStateAuthorized value)? authorized,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateFailure value)? failure,
    TResult Function(_AuthStateAuthorized value)? authorized,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AuthStateLoading implements AuthState {
  const factory _AuthStateLoading() = _$_AuthStateLoading;
}

/// @nodoc
abstract class _$$_AuthStateFailureCopyWith<$Res> {
  factory _$$_AuthStateFailureCopyWith(
          _$_AuthStateFailure value, $Res Function(_$_AuthStateFailure) then) =
      __$$_AuthStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$_AuthStateFailureCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateFailure>
    implements _$$_AuthStateFailureCopyWith<$Res> {
  __$$_AuthStateFailureCopyWithImpl(
      _$_AuthStateFailure _value, $Res Function(_$_AuthStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AuthStateFailure(
      freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthStateFailure implements _AuthStateFailure {
  const _$_AuthStateFailure([this.errorMessage]);

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthState.failure(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateFailure &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateFailureCopyWith<_$_AuthStateFailure> get copyWith =>
      __$$_AuthStateFailureCopyWithImpl<_$_AuthStateFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() loading,
    required TResult Function(String? errorMessage) failure,
    required TResult Function(User user) authorized,
  }) {
    return failure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
    TResult? Function(String? errorMessage)? failure,
    TResult? Function(User user)? authorized,
  }) {
    return failure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? loading,
    TResult Function(String? errorMessage)? failure,
    TResult Function(User user)? authorized,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateUnauthorized value) unauthorized,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateFailure value) failure,
    required TResult Function(_AuthStateAuthorized value) authorized,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateUnauthorized value)? unauthorized,
    TResult? Function(_AuthStateLoading value)? loading,
    TResult? Function(_AuthStateFailure value)? failure,
    TResult? Function(_AuthStateAuthorized value)? authorized,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateFailure value)? failure,
    TResult Function(_AuthStateAuthorized value)? authorized,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _AuthStateFailure implements AuthState {
  const factory _AuthStateFailure([final String? errorMessage]) =
      _$_AuthStateFailure;

  String? get errorMessage;
  @JsonKey(ignore: true)
  _$$_AuthStateFailureCopyWith<_$_AuthStateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStateAuthorizedCopyWith<$Res> {
  factory _$$_AuthStateAuthorizedCopyWith(_$_AuthStateAuthorized value,
          $Res Function(_$_AuthStateAuthorized) then) =
      __$$_AuthStateAuthorizedCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_AuthStateAuthorizedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthStateAuthorized>
    implements _$$_AuthStateAuthorizedCopyWith<$Res> {
  __$$_AuthStateAuthorizedCopyWithImpl(_$_AuthStateAuthorized _value,
      $Res Function(_$_AuthStateAuthorized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_AuthStateAuthorized(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_AuthStateAuthorized implements _AuthStateAuthorized {
  const _$_AuthStateAuthorized({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authorized(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStateAuthorized &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateAuthorizedCopyWith<_$_AuthStateAuthorized> get copyWith =>
      __$$_AuthStateAuthorizedCopyWithImpl<_$_AuthStateAuthorized>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthorized,
    required TResult Function() loading,
    required TResult Function(String? errorMessage) failure,
    required TResult Function(User user) authorized,
  }) {
    return authorized(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
    TResult? Function(String? errorMessage)? failure,
    TResult? Function(User user)? authorized,
  }) {
    return authorized?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthorized,
    TResult Function()? loading,
    TResult Function(String? errorMessage)? failure,
    TResult Function(User user)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateUnauthorized value) unauthorized,
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateFailure value) failure,
    required TResult Function(_AuthStateAuthorized value) authorized,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateUnauthorized value)? unauthorized,
    TResult? Function(_AuthStateLoading value)? loading,
    TResult? Function(_AuthStateFailure value)? failure,
    TResult? Function(_AuthStateAuthorized value)? authorized,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateUnauthorized value)? unauthorized,
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateFailure value)? failure,
    TResult Function(_AuthStateAuthorized value)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _AuthStateAuthorized implements AuthState {
  const factory _AuthStateAuthorized({required final User user}) =
      _$_AuthStateAuthorized;

  User get user;
  @JsonKey(ignore: true)
  _$$_AuthStateAuthorizedCopyWith<_$_AuthStateAuthorized> get copyWith =>
      throw _privateConstructorUsedError;
}
