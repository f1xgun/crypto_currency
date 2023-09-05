// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoinDTO _$CoinDTOFromJson(Map<String, dynamic> json) {
  return _CoinDTO.fromJson(json);
}

/// @nodoc
mixin _$CoinDTO {
  String get symbol => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'high_price')
  double get highPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_change_percent_24h')
  double get priceChangePercent24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinDTOCopyWith<CoinDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinDTOCopyWith<$Res> {
  factory $CoinDTOCopyWith(CoinDTO value, $Res Function(CoinDTO) then) =
      _$CoinDTOCopyWithImpl<$Res, CoinDTO>;
  @useResult
  $Res call(
      {String symbol,
      double price,
      @JsonKey(name: 'high_price') double highPrice,
      @JsonKey(name: 'price_change_percent_24h') double priceChangePercent24h,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class _$CoinDTOCopyWithImpl<$Res, $Val extends CoinDTO>
    implements $CoinDTOCopyWith<$Res> {
  _$CoinDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? price = null,
    Object? highPrice = null,
    Object? priceChangePercent24h = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      highPrice: null == highPrice
          ? _value.highPrice
          : highPrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceChangePercent24h: null == priceChangePercent24h
          ? _value.priceChangePercent24h
          : priceChangePercent24h // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoinDTOCopyWith<$Res> implements $CoinDTOCopyWith<$Res> {
  factory _$$_CoinDTOCopyWith(
          _$_CoinDTO value, $Res Function(_$_CoinDTO) then) =
      __$$_CoinDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String symbol,
      double price,
      @JsonKey(name: 'high_price') double highPrice,
      @JsonKey(name: 'price_change_percent_24h') double priceChangePercent24h,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class __$$_CoinDTOCopyWithImpl<$Res>
    extends _$CoinDTOCopyWithImpl<$Res, _$_CoinDTO>
    implements _$$_CoinDTOCopyWith<$Res> {
  __$$_CoinDTOCopyWithImpl(_$_CoinDTO _value, $Res Function(_$_CoinDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? price = null,
    Object? highPrice = null,
    Object? priceChangePercent24h = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_CoinDTO(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      highPrice: null == highPrice
          ? _value.highPrice
          : highPrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceChangePercent24h: null == priceChangePercent24h
          ? _value.priceChangePercent24h
          : priceChangePercent24h // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoinDTO implements _CoinDTO {
  const _$_CoinDTO(
      {required this.symbol,
      required this.price,
      @JsonKey(name: 'high_price') required this.highPrice,
      @JsonKey(name: 'price_change_percent_24h')
      required this.priceChangePercent24h,
      @JsonKey(name: 'image_url') this.imageUrl});

  factory _$_CoinDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CoinDTOFromJson(json);

  @override
  final String symbol;
  @override
  final double price;
  @override
  @JsonKey(name: 'high_price')
  final double highPrice;
  @override
  @JsonKey(name: 'price_change_percent_24h')
  final double priceChangePercent24h;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'CoinDTO(symbol: $symbol, price: $price, highPrice: $highPrice, priceChangePercent24h: $priceChangePercent24h, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoinDTO &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.highPrice, highPrice) ||
                other.highPrice == highPrice) &&
            (identical(other.priceChangePercent24h, priceChangePercent24h) ||
                other.priceChangePercent24h == priceChangePercent24h) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, symbol, price, highPrice, priceChangePercent24h, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoinDTOCopyWith<_$_CoinDTO> get copyWith =>
      __$$_CoinDTOCopyWithImpl<_$_CoinDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoinDTOToJson(
      this,
    );
  }
}

abstract class _CoinDTO implements CoinDTO {
  const factory _CoinDTO(
      {required final String symbol,
      required final double price,
      @JsonKey(name: 'high_price') required final double highPrice,
      @JsonKey(name: 'price_change_percent_24h')
      required final double priceChangePercent24h,
      @JsonKey(name: 'image_url') final String? imageUrl}) = _$_CoinDTO;

  factory _CoinDTO.fromJson(Map<String, dynamic> json) = _$_CoinDTO.fromJson;

  @override
  String get symbol;
  @override
  double get price;
  @override
  @JsonKey(name: 'high_price')
  double get highPrice;
  @override
  @JsonKey(name: 'price_change_percent_24h')
  double get priceChangePercent24h;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_CoinDTOCopyWith<_$_CoinDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
