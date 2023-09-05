import 'package:crypto_currency/features/coin_ranking_list/data/mappers/coin_mapper.dart';
import 'package:crypto_currency/features/coin_ranking_list/data/models/coin_dto.dart';
import 'package:crypto_currency/features/coin_ranking_list/domain/entities/coin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final List<CoinDTO> coinsDTO = [
    const CoinDTO(
        symbol: 'BTC',
        price: 25000,
        highPrice: 30000,
        priceChangePercent24h: 24),
    const CoinDTO(
        symbol: 'ETH',
        price: 5000,
        highPrice: 2000,
        priceChangePercent24h: -5.24),
  ];

  final List<Coin> coins = [
    const Coin(
        symbol: 'BTC',
        price: 25000,
        highPrice: 30000,
        priceChangePercent24h: 24),
    const Coin(
        symbol: 'ETH',
        price: 5000,
        highPrice: 2000,
        priceChangePercent24h: -5.24)
  ];
  group('Coin mapper', () {
    test('Map #1', () {
      expect(CoinMapper.fromDTO(coinsDTO[0]), coins[0]);
    });

    test('Map #2', () {
      expect(CoinMapper.fromDTO(coinsDTO[1]), coins[1]);
    });
  });
}
