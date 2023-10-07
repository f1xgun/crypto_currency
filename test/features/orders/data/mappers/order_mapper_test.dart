import 'dart:math';

import 'package:crypto_currency/features/orders/data/mappers/order_mapper.dart';
import 'package:crypto_currency/features/orders/data/models/order_dto.dart';
import 'package:crypto_currency/features/orders/domain/entities/order_type_enum.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock_data/orders.dart';

void main() {
  group('OrderMapper', () {
    for (int i = 0; i < min(ordersDTO.length, orders.length); i++) {
      test('Map #${i + 1}', () {
        expect(OrderMapper.fromDTO(ordersDTO[i]), orders[i]);
      });
    }
  });

  group('Order type mapper', () {
    test('OrderType.buy from OrderDTO.type == 0', () {
      expect(OrderMapper.typeFromDTO(0), OrderType.buy);
    });

    test('OrderType.sell from OrderDTO.type == 1', () {
      expect(OrderMapper.typeFromDTO(1), OrderType.sell);
    });

    test('OrderType.none for another values', () {
      expect(OrderMapper.typeFromDTO(5), OrderType.none);
    });
  });

  group('OrderDTO.fromJSON', () {
    for (int i = 0; i < min(ordersDTO.length, ordersJSON.length); i++) {
      test('Map #${i + 1}', () {
        expect(OrderDTO.fromJson(ordersJSON[i]), ordersDTO[i]);
      });
    }
  });
}
