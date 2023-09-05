import 'package:crypto_currency/features/auth/data/mappers/user_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock_data/users.dart';

void main() {
  group('User mapper', () {
    test('Map #1', () {
      expect(UserMapper.fromDTO(usersDTO[0]), users[0]);
    });

    test('Map #2', () {
      expect(UserMapper.fromDTO(usersDTO[1]), users[1]);
    });
  });
}
