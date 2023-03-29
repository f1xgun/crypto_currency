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
      cmcRank: json['cmcRank'] as int,
      numMarketPairs: json['numMarketPairs'] as int,
      circulatingSupply: (json['circulatingSupply'] as num).toDouble(),
      totalSupply: (json['totalSupply'] as num).toDouble(),
      maxSupply: (json['maxSupply'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      dateAdded: DateTime.parse(json['dateAdded'] as String),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => $enumDecode(_$TagEnumMap, e))
          .toList(),
      platform: Platform.fromJson(json['platform'] as Map<String, dynamic>),
      quote: Quote.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CryptoCoinToJson(CryptoCoin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'cmcRank': instance.cmcRank,
      'numMarketPairs': instance.numMarketPairs,
      'circulatingSupply': instance.circulatingSupply,
      'totalSupply': instance.totalSupply,
      'maxSupply': instance.maxSupply,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'dateAdded': instance.dateAdded.toIso8601String(),
      'tags': instance.tags.map((e) => _$TagEnumMap[e]!).toList(),
      'platform': instance.platform,
      'quote': instance.quote,
    };

const _$TagEnumMap = {
  Tag.MINEABLE: 'MINEABLE',
};
