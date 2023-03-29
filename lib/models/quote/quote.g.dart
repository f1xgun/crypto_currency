// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      price: double.parse((json['price'] as num).toDouble().toStringAsFixed(2)),
      volume24H: (json['volume_24h'] as num).toDouble(),
      marketCap: (json['market_cap'] as num).toDouble(),
      percentChange1H: (json['percent_change_1h'] as num).toDouble(),
      percentChange24H: (json['percent_change_24h'] as num).toDouble(),
      percentChange7D: (json['percent_change_7d'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['last_updated']),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'price': instance.price,
      'volume_24h': instance.volume24H,
      'market_cap': instance.marketCap,
      'percent_change_1h': instance.percentChange1H,
      'percent_change_24h': instance.percentChange24H,
      'percent_change_7d': instance.percentChange7D,
      'last_updated': instance.lastUpdated.toIso8601String(),
    };
