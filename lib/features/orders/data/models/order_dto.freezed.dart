// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDTO _$OrderDTOFromJson(Map<String, dynamic> json) {
  return _OrderDTO.fromJson(json);
}

/// @nodoc
mixin _$OrderDTO {
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'coin_symbol')
  String get coinSymbol => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDTOCopyWith<OrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDTOCopyWith<$Res> {
  factory $OrderDTOCopyWith(OrderDTO value, $Res Function(OrderDTO) then) =
      _$OrderDTOCopyWithImpl<$Res, OrderDTO>;
  @useResult
  $Res call(
      {int type,
      @JsonKey(name: 'coin_symbol') String coinSymbol,
      double amount,
      double price,
      String date});
}

/// @nodoc
class _$OrderDTOCopyWithImpl<$Res, $Val extends OrderDTO>
    implements $OrderDTOCopyWith<$Res> {
  _$OrderDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coinSymbol = null,
    Object? amount = null,
    Object? price = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      coinSymbol: null == coinSymbol
          ? _value.coinSymbol
          : coinSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderDTOCopyWith<$Res> implements $OrderDTOCopyWith<$Res> {
  factory _$$_OrderDTOCopyWith(
          _$_OrderDTO value, $Res Function(_$_OrderDTO) then) =
      __$$_OrderDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int type,
      @JsonKey(name: 'coin_symbol') String coinSymbol,
      double amount,
      double price,
      String date});
}

/// @nodoc
class __$$_OrderDTOCopyWithImpl<$Res>
    extends _$OrderDTOCopyWithImpl<$Res, _$_OrderDTO>
    implements _$$_OrderDTOCopyWith<$Res> {
  __$$_OrderDTOCopyWithImpl(
      _$_OrderDTO _value, $Res Function(_$_OrderDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coinSymbol = null,
    Object? amount = null,
    Object? price = null,
    Object? date = null,
  }) {
    return _then(_$_OrderDTO(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      coinSymbol: null == coinSymbol
          ? _value.coinSymbol
          : coinSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDTO implements _OrderDTO {
  const _$_OrderDTO(
      {required this.type,
      @JsonKey(name: 'coin_symbol') required this.coinSymbol,
      required this.amount,
      required this.price,
      required this.date});

  factory _$_OrderDTO.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDTOFromJson(json);

  @override
  final int type;
  @override
  @JsonKey(name: 'coin_symbol')
  final String coinSymbol;
  @override
  final double amount;
  @override
  final double price;
  @override
  final String date;

  @override
  String toString() {
    return 'OrderDTO(type: $type, coinSymbol: $coinSymbol, amount: $amount, price: $price, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDTO &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.coinSymbol, coinSymbol) ||
                other.coinSymbol == coinSymbol) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, coinSymbol, amount, price, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDTOCopyWith<_$_OrderDTO> get copyWith =>
      __$$_OrderDTOCopyWithImpl<_$_OrderDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDTOToJson(
      this,
    );
  }
}

abstract class _OrderDTO implements OrderDTO {
  const factory _OrderDTO(
      {required final int type,
      @JsonKey(name: 'coin_symbol') required final String coinSymbol,
      required final double amount,
      required final double price,
      required final String date}) = _$_OrderDTO;

  factory _OrderDTO.fromJson(Map<String, dynamic> json) = _$_OrderDTO.fromJson;

  @override
  int get type;
  @override
  @JsonKey(name: 'coin_symbol')
  String get coinSymbol;
  @override
  double get amount;
  @override
  double get price;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDTOCopyWith<_$_OrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
