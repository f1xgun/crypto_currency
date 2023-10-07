import 'dart:math';

import 'package:crypto_currency/features/auth/data/mappers/user_mapper.dart';
import 'package:crypto_currency/features/auth/data/models/user_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock_data/users.dart';

void main() {
  group('UserMapper', () {
    for (int i = 0; i < min(usersDTO.length, users.length); i++) {
      test('Map #${i + 1}', () {
        expect(UserMapper.fromDTO(usersDTO[i]), users[i]);
      });
    }
  });

  group('UserDTO.fromJson', () {
    for (int i = 0; i < min(usersJSON.length, usersDTO.length); i++) {
      test('Map #${i + 1}', () {
        expect(UserDTO.fromJson(usersJSON[i]), usersDTO[i]);
      });
    }
  });
}
