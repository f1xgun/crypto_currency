import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable()
class Quote {
  double price;
  double volume24H;
  double marketCap;
  double percentChange1H;
  double percentChange24H;
  double percentChange7D;
  DateTime lastUpdated;
  Quote({
    required this.price,
    required this.volume24H,
    required this.marketCap,
    required this.percentChange1H,
    required this.percentChange24H,
    required this.percentChange7D,
    required this.lastUpdated
  });

  factory Quote.fromJson(Map<String, dynamic> json) =>
      _$QuoteFromJson(json);

  Map<String, dynamic> json() => _$QuoteToJson(this);
}
