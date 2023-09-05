import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_dto.g.dart';
part 'coin_dto.freezed.dart';

@freezed
class CoinDTO with _$CoinDTO {
  const factory CoinDTO({
    required String symbol,
    required double price,
    @JsonKey(name: 'high_price')
    required double highPrice,
    @JsonKey(name: 'price_change_percent_24h')
    required double priceChangePercent24h,
    String? imageUrl,
  }) = _CoinDTO;

  factory CoinDTO.fromJson(Map<String, dynamic> json) =>
      _$CoinDTOFromJson(json);
}
