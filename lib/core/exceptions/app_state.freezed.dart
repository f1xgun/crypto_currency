// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppStateWrong {
  String get message => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details) error,
    required TResult Function(String message, String? details) warning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details)? error,
    TResult? Function(String message, String? details)? warning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details)? error,
    TResult Function(String message, String? details)? warning,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStateWrongError value) error,
    required TResult Function(_AppStateWrongWarning value) warning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStateWrongError value)? error,
    TResult? Function(_AppStateWrongWarning value)? warning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStateWrongError value)? error,
    TResult Function(_AppStateWrongWarning value)? warning,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateWrongCopyWith<AppStateWrong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateWrongCopyWith<$Res> {
  factory $AppStateWrongCopyWith(
          AppStateWrong value, $Res Function(AppStateWrong) then) =
      _$AppStateWrongCopyWithImpl<$Res, AppStateWrong>;
  @useResult
  $Res call({String message, String? details});
}

/// @nodoc
class _$AppStateWrongCopyWithImpl<$Res, $Val extends AppStateWrong>
    implements $AppStateWrongCopyWith<$Res> {
  _$AppStateWrongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppStateWrongErrorCopyWith<$Res>
    implements $AppStateWrongCopyWith<$Res> {
  factory _$$_AppStateWrongErrorCopyWith(_$_AppStateWrongError value,
          $Res Function(_$_AppStateWrongError) then) =
      __$$_AppStateWrongErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details});
}

/// @nodoc
class __$$_AppStateWrongErrorCopyWithImpl<$Res>
    extends _$AppStateWrongCopyWithImpl<$Res, _$_AppStateWrongError>
    implements _$$_AppStateWrongErrorCopyWith<$Res> {
  __$$_AppStateWrongErrorCopyWithImpl(
      _$_AppStateWrongError _value, $Res Function(_$_AppStateWrongError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(_$_AppStateWrongError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AppStateWrongError implements _AppStateWrongError {
  _$_AppStateWrongError(this.message, {this.details});

  @override
  final String message;
  @override
  final String? details;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppStateWrongError &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateWrongErrorCopyWith<_$_AppStateWrongError> get copyWith =>
      __$$_AppStateWrongErrorCopyWithImpl<_$_AppStateWrongError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details) error,
    required TResult Function(String message, String? details) warning,
  }) {
    return error(message, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details)? error,
    TResult? Function(String message, String? details)? warning,
  }) {
    return error?.call(message, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details)? error,
    TResult Function(String message, String? details)? warning,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStateWrongError value) error,
    required TResult Function(_AppStateWrongWarning value) warning,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStateWrongError value)? error,
    TResult? Function(_AppStateWrongWarning value)? warning,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStateWrongError value)? error,
    TResult Function(_AppStateWrongWarning value)? warning,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AppStateWrongError implements AppStateWrong {
  factory _AppStateWrongError(final String message, {final String? details}) =
      _$_AppStateWrongError;

  @override
  String get message;
  @override
  String? get details;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateWrongErrorCopyWith<_$_AppStateWrongError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppStateWrongWarningCopyWith<$Res>
    implements $AppStateWrongCopyWith<$Res> {
  factory _$$_AppStateWrongWarningCopyWith(_$_AppStateWrongWarning value,
          $Res Function(_$_AppStateWrongWarning) then) =
      __$$_AppStateWrongWarningCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details});
}

/// @nodoc
class __$$_AppStateWrongWarningCopyWithImpl<$Res>
    extends _$AppStateWrongCopyWithImpl<$Res, _$_AppStateWrongWarning>
    implements _$$_AppStateWrongWarningCopyWith<$Res> {
  __$$_AppStateWrongWarningCopyWithImpl(_$_AppStateWrongWarning _value,
      $Res Function(_$_AppStateWrongWarning) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(_$_AppStateWrongWarning(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AppStateWrongWarning implements _AppStateWrongWarning {
  _$_AppStateWrongWarning(this.message, {this.details});

  @override
  final String message;
  @override
  final String? details;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppStateWrongWarning &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateWrongWarningCopyWith<_$_AppStateWrongWarning> get copyWith =>
      __$$_AppStateWrongWarningCopyWithImpl<_$_AppStateWrongWarning>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String? details) error,
    required TResult Function(String message, String? details) warning,
  }) {
    return warning(message, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details)? error,
    TResult? Function(String message, String? details)? warning,
  }) {
    return warning?.call(message, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details)? error,
    TResult Function(String message, String? details)? warning,
    required TResult orElse(),
  }) {
    if (warning != null) {
      return warning(message, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStateWrongError value) error,
    required TResult Function(_AppStateWrongWarning value) warning,
  }) {
    return warning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStateWrongError value)? error,
    TResult? Function(_AppStateWrongWarning value)? warning,
  }) {
    return warning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStateWrongError value)? error,
    TResult Function(_AppStateWrongWarning value)? warning,
    required TResult orElse(),
  }) {
    if (warning != null) {
      return warning(this);
    }
    return orElse();
  }
}

abstract class _AppStateWrongWarning implements AppStateWrong {
  factory _AppStateWrongWarning(final String message, {final String? details}) =
      _$_AppStateWrongWarning;

  @override
  String get message;
  @override
  String? get details;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateWrongWarningCopyWith<_$_AppStateWrongWarning> get copyWith =>
      throw _privateConstructorUsedError;
}
