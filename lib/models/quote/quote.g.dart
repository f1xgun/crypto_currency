// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      price: (json['price'] as num).toDouble(),
      volume24H: (json['volume24H'] as num).toDouble(),
      marketCap: (json['marketCap'] as num).toDouble(),
      percentChange1H: (json['percentChange1H'] as num).toDouble(),
      percentChange24H: (json['percentChange24H'] as num).toDouble(),
      percentChange7D: (json['percentChange7D'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'price': instance.price,
      'volume24H': instance.volume24H,
      'marketCap': instance.marketCap,
      'percentChange1H': instance.percentChange1H,
      'percentChange24H': instance.percentChange24H,
      'percentChange7D': instance.percentChange7D,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
