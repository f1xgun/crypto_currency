import 'package:crypto_currency/models/coin_platform/coin_platform.dart';
import 'package:crypto_currency/models/quote/quote.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin.g.dart';

@JsonSerializable()
class CryptoCoin {
  int id;
  String name;
  String symbol;
  String slug;
  int cmcRank;
  int numMarketPairs;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  DateTime lastUpdated;
  DateTime dateAdded;
  Platform? platform;
  Quote quote;

  CryptoCoin({
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
