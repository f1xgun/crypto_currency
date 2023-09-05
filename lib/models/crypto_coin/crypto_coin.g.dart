// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCoin _$CryptoCoinFromJson(Map<String, dynamic> json) => CryptoCoin(
      id: json['id'] as int,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      slug: json['slug'] as String,
      cmcRank: json['cmc_rank'] as int,
      numMarketPairs: json['num_market_pairs'] as int,
      circulatingSupply: (json['circulating_supply'] as num?)?.toDouble(),
      totalSupply: (json['total_supply'] as num?)?.toDouble(),
      maxSupply: (json['max_supply'] as num?)?.toDouble(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
      dateAdded: DateTime.parse(json['date_added'] as String),
      platform: json['platform'] == null
          ? null
          : Platform.fromJson(json['platform'] as Map<String, dynamic>),
      quote: Quote.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptoCoinToJson(CryptoCoin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'cmc_rank': instance.cmcRank,
      'num_market_pairs': instance.numMarketPairs,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
      'last_updated': instance.lastUpdated.toIso8601String(),
      'date_added': instance.dateAdded.toIso8601String(),
      'platform': instance.platform,
      'quote': instance.quote,
    };
