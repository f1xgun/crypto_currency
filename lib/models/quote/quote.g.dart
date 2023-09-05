// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      price: (json['price'] as num).toDouble(),
      volume24H: (json['volume24_h'] as num).toDouble(),
      marketCap: (json['market_cap'] as num).toDouble(),
      percentChange1H: (json['percent_change1_h'] as num).toDouble(),
      percentChange24H: (json['percent_change24_h'] as num).toDouble(),
      percentChange7D: (json['percent_change7_d'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'price': instance.price,
      'volume24_h': instance.volume24H,
      'market_cap': instance.marketCap,
      'percent_change1_h': instance.percentChange1H,
      'percent_change24_h': instance.percentChange24H,
      'percent_change7_d': instance.percentChange7D,
      'last_updated': instance.lastUpdated.toIso8601String(),
    };
