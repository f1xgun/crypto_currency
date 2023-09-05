// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_coin_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCoinDTO _$UserCoinDTOFromJson(Map<String, dynamic> json) {
  return _UserCoinDTO.fromJson(json);
}

/// @nodoc
mixin _$UserCoinDTO {
  CoinDTO get coin => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCoinDTOCopyWith<UserCoinDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCoinDTOCopyWith<$Res> {
  factory $UserCoinDTOCopyWith(
          UserCoinDTO value, $Res Function(UserCoinDTO) then) =
      _$UserCoinDTOCopyWithImpl<$Res, UserCoinDTO>;
  @useResult
  $Res call({CoinDTO coin, double amount});

  $CoinDTOCopyWith<$Res> get coin;
}

/// @nodoc
class _$UserCoinDTOCopyWithImpl<$Res, $Val extends UserCoinDTO>
    implements $UserCoinDTOCopyWith<$Res> {
  _$UserCoinDTOCopyWithImpl(this._value, this._then);

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
              as CoinDTO,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoinDTOCopyWith<$Res> get coin {
    return $CoinDTOCopyWith<$Res>(_value.coin, (value) {
      return _then(_value.copyWith(coin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCoinDTOCopyWith<$Res>
    implements $UserCoinDTOCopyWith<$Res> {
  factory _$$_UserCoinDTOCopyWith(
          _$_UserCoinDTO value, $Res Function(_$_UserCoinDTO) then) =
      __$$_UserCoinDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CoinDTO coin, double amount});

  @override
  $CoinDTOCopyWith<$Res> get coin;
}

/// @nodoc
class __$$_UserCoinDTOCopyWithImpl<$Res>
    extends _$UserCoinDTOCopyWithImpl<$Res, _$_UserCoinDTO>
    implements _$$_UserCoinDTOCopyWith<$Res> {
  __$$_UserCoinDTOCopyWithImpl(
      _$_UserCoinDTO _value, $Res Function(_$_UserCoinDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coin = null,
    Object? amount = null,
  }) {
    return _then(_$_UserCoinDTO(
      coin: null == coin
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as CoinDTO,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserCoinDTO implements _UserCoinDTO {
  const _$_UserCoinDTO({required this.coin, required this.amount});

  factory _$_UserCoinDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserCoinDTOFromJson(json);

  @override
  final CoinDTO coin;
  @override
  final double amount;

  @override
  String toString() {
    return 'UserCoinDTO(coin: $coin, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCoinDTO &&
            (identical(other.coin, coin) || other.coin == coin) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, coin, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCoinDTOCopyWith<_$_UserCoinDTO> get copyWith =>
      __$$_UserCoinDTOCopyWithImpl<_$_UserCoinDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCoinDTOToJson(
      this,
    );
  }
}

abstract class _UserCoinDTO implements UserCoinDTO {
  const factory _UserCoinDTO(
      {required final CoinDTO coin,
      required final double amount}) = _$_UserCoinDTO;

  factory _UserCoinDTO.fromJson(Map<String, dynamic> json) =
      _$_UserCoinDTO.fromJson;

  @override
  CoinDTO get coin;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_UserCoinDTOCopyWith<_$_UserCoinDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
