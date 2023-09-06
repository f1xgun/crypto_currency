import 'package:crypto_currency/features/orders/data/mappers/order_mapper.dart';
import 'package:crypto_currency/features/orders/domain/entities/order_type_enum.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mock_data/orders.dart';

void main() {
  group('Order mapper', () {
    test('Map #1', () {
      expect(OrderMapper.fromDTO(ordersDTO[0]), orders[0]);
    });

    test('Map #2', () {
      expect(OrderMapper.fromDTO(ordersDTO[1]), orders[1]);
    });
  });

  group('Order type mapper', () {
    test('OrderType.buy from OrderDTO.type = 0', () {
      expect(OrderMapper.typeFromDTO(0), OrderType.buy);
    });

    test('OrderType.sell from OrderDTO.type = 1', () {
      expect(OrderMapper.typeFromDTO(1), OrderType.sell);
    });

    test('OrderType.none for another values', () {
      expect(OrderMapper.typeFromDTO(5), OrderType.none);
    });
  });
}
