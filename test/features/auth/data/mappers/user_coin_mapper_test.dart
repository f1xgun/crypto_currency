import 'package:crypto_currency/features/auth/data/mappers/user_coin_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock_data/users.dart';

void main() {
  group('UserCoin mapper', () {
    test('Map #1', () {
      expect(UserCoinMapper.fromDTO(userCoinsDTO[0]), userCoins[0]);
    });

    test('Map #2', () {
      expect(UserCoinMapper.fromDTO(userCoinsDTO[1]), userCoins[1]);
    });
  });
}
