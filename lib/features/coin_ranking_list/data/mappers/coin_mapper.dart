import 'package:crypto_currency/features/coin_ranking_list/data/models/coin_dto.dart';
import 'package:crypto_currency/features/coin_ranking_list/domain/entities/coin.dart';

class CoinMapper {
  static Coin fromDTO(CoinDTO coin) {
    return Coin(
      symbol: coin.symbol,
      highPrice: coin.highPrice,
      price: coin.price,
      priceChangePercent24h: coin.priceChangePercent24h,
      imageUrl: coin.imageUrl,
    );
  }
}
