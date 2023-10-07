import 'dart:math';

import 'package:crypto_currency/features/coin_ranking_list/data/mappers/coin_mapper.dart';
import 'package:crypto_currency/features/coin_ranking_list/data/models/coin_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock_data/coins.dart';

void main() {
  group('CoinMapper', () {
    for (int i = 0; i < min(coinsDTO.length, coins.length); i++) {
      test('Map #${i + 1}', () {
        expect(CoinMapper.fromDTO(coinsDTO[i]), coins[i]);
      });
    }
  });

  group('CoinDTO.fromJSON', () {
    for (int i = 0; i < min(coinsJSON.length, coinsDTO.length); i++) {
      test('Map #${i + 1}', () {
        expect(CoinDTO.fromJson(coinsJSON[i]), coinsDTO[i]);
      });
    }
  });
}
