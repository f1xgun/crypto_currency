import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable()
class Quote {
  final double price;
  final double volume24H;
  final double marketCap;
  final double percentChange1H;
  final double percentChange24H;
  final double percentChange7D;
  final DateTime lastUpdated;
  const Quote({
      required this.price,
      required this.volume24H,
      required this.marketCap,
      required this.percentChange1H,
      required this.percentChange24H,
      required this.percentChange7D,
      required this.lastUpdated
  });

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
