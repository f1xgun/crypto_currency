import 'package:crypto_currency/models/coin_platform/coin_platform.dart';
import 'package:crypto_currency/models/quote/quote.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin.g.dart';

@JsonSerializable()
class CryptoCoin {
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final int cmcRank;
  final int numMarketPairs;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final DateTime lastUpdated;
  final DateTime dateAdded;
  final Platform? platform;
  final Quote quote;

  const CryptoCoin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.cmcRank,
    required this.numMarketPairs,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.lastUpdated,
    required this.dateAdded,
    required this.platform,
    required this.quote,
  });

  factory CryptoCoin.fromJson(Map<String, dynamic> json) =>
      _$CryptoCoinFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCoinToJson(this);
}
