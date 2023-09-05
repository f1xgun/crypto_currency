import 'package:crypto_currency/features/coin_ranking_list/data/models/coin_dto.dart';
import 'package:crypto_currency/features/coin_ranking_list/domain/entities/coin.dart';

final List<CoinDTO> coinsDTO = [
  const CoinDTO(
      symbol: 'BTC', price: 25000, highPrice: 30000, priceChangePercent24h: 24),
  const CoinDTO(
      symbol: 'ETH',
      price: 5000,
      highPrice: 2000,
      priceChangePercent24h: -5.24),
];

final List<Coin> coins = [
  const Coin(
      symbol: 'BTC', price: 25000, highPrice: 30000, priceChangePercent24h: 24),
  const Coin(
      symbol: 'ETH', price: 5000, highPrice: 2000, priceChangePercent24h: -5.24)
];
