import 'package:crypto_currency/features/orders/data/mappers/order_mapper.dart';
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
}
