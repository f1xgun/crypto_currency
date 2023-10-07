import 'package:crypto_currency/features/orders/data/models/order_dto.dart';
import 'package:crypto_currency/features/orders/domain/entities/order.dart';
import 'package:crypto_currency/features/orders/domain/entities/order_type_enum.dart';

final List<Map<String, dynamic>> ordersJSON = [
  {
    'type': 0,
    'coin_symbol': 'BTC',
    'amount': 1.0,
    'price': 0.5,
    'date': '2023-09-05 00:00:00',
  },
  {
    'type': 1,
    'coin_symbol': 'BTC',
    'amount': 15.0,
    'price': 5.0,
    'date': '2024-09-05 15:24:02',
  },
];

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
