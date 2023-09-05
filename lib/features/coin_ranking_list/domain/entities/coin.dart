import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin.freezed.dart';

@freezed
class Coin with _$Coin {
  const factory Coin({
    required String symbol,
    required double price,
    required double highPrice,
    required double priceChangePercent24h,
    String? imageUrl,
  }) = _Coin;
}
