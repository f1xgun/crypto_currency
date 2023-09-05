// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_coin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserCoin {
  Coin get coin => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCoinCopyWith<UserCoin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCoinCopyWith<$Res> {
  factory $UserCoinCopyWith(UserCoin value, $Res Function(UserCoin) then) =
      _$UserCoinCopyWithImpl<$Res, UserCoin>;
  @useResult
  $Res call({Coin coin, double amount});

  $CoinCopyWith<$Res> get coin;
}

/// @nodoc
class _$UserCoinCopyWithImpl<$Res, $Val extends UserCoin>
    implements $UserCoinCopyWith<$Res> {
  _$UserCoinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coin = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as Coin,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoinCopyWith<$Res> get coin {
    return $CoinCopyWith<$Res>(_value.coin, (value) {
      return _then(_value.copyWith(coin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCoinCopyWith<$Res> implements $UserCoinCopyWith<$Res> {
  factory _$$_UserCoinCopyWith(
          _$_UserCoin value, $Res Function(_$_UserCoin) then) =
      __$$_UserCoinCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Coin coin, double amount});

  @override
  $CoinCopyWith<$Res> get coin;
}

/// @nodoc
class __$$_UserCoinCopyWithImpl<$Res>
    extends _$UserCoinCopyWithImpl<$Res, _$_UserCoin>
    implements _$$_UserCoinCopyWith<$Res> {
  __$$_UserCoinCopyWithImpl(
      _$_UserCoin _value, $Res Function(_$_UserCoin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coin = null,
    Object? amount = null,
  }) {
    return _then(_$_UserCoin(
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as Coin,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_UserCoin implements _UserCoin {
  const _$_UserCoin({required this.coin, required this.amount});

  @override
  final Coin coin;
  @override
  final double amount;

  @override
  String toString() {
    return 'UserCoin(coin: $coin, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCoin &&
            (identical(other.coin, coin) || other.coin == coin) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coin, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCoinCopyWith<_$_UserCoin> get copyWith =>
      __$$_UserCoinCopyWithImpl<_$_UserCoin>(this, _$identity);
}

abstract class _UserCoin implements UserCoin {
  const factory _UserCoin(
      {required final Coin coin, required final double amount}) = _$_UserCoin;

  @override
  Coin get coin;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_UserCoinCopyWith<_$_UserCoin> get copyWith =>
      throw _privateConstructorUsedError;
}
