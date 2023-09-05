import 'package:crypto_currency/features/orders/data/mappers/order_mapper.dart';
import 'package:crypto_currency/features/orders/data/models/order_dto.dart';
import 'package:crypto_currency/features/orders/domain/entities/order.dart';
import 'package:crypto_currency/features/orders/domain/entities/order_type_enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final List<OrderDTO> ordersDTO = [
    const OrderDTO(
      type: 0,
      coinSymbol: 'BTC',
      amount: 1,
      price: 0.5,
      date: '2023-09-05 00:00:00',
    ),
    const OrderDTO(
      type: 1,
      coinSymbol: 'BTC',
      amount: 15,
      price: 5,
      date: '2024-09-05 15:24:02',
    ),
  ];

  final List<Order> orders = [
    Order(
      type: OrderType.buy,
      coinSymbol: 'BTC',
      amount: 1,
      price: 0.5,
      date: DateTime(2023, 9, 5),
    ),
    Order(
      type: OrderType.sell,
      coinSymbol: 'BTC',
      amount: 15,
      price: 5,
      date: DateTime(2024, 9, 5, 15, 24, 2),
    ),
  ];

  group('Order mapper', () {
    test('Map #1', () {
      expect(OrderMapper.fromDTO(ordersDTO[0]), orders[0]);
    });

    test('Map #2', () {
      expect(OrderMapper.fromDTO(ordersDTO[1]), orders[1]);
    });
  });
}
