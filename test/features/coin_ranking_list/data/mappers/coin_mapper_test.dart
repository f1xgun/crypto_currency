import 'package:crypto_currency/features/coin_ranking_list/data/mappers/coin_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock_data/coins.dart';

void main() {
  group('Coin mapper', () {
    test('Map #1', () {
      expect(CoinMapper.fromDTO(coinsDTO[0]), coins[0]);
    });

    test('Map #2', () {
      expect(CoinMapper.fromDTO(coinsDTO[1]), coins[1]);
    });
  });
}
