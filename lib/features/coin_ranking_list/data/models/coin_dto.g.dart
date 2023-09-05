// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoinDTO _$$_CoinDTOFromJson(Map<String, dynamic> json) => _$_CoinDTO(
      symbol: json['symbol'] as String,
      price: (json['price'] as num).toDouble(),
      highPrice: (json['high_price'] as num).toDouble(),
      priceChangePercent24h:
          (json['price_change_percent_24h'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_CoinDTOToJson(_$_CoinDTO instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'price': instance.price,
      'high_price': instance.highPrice,
      'price_change_percent_24h': instance.priceChangePercent24h,
      'imageUrl': instance.imageUrl,
    };
