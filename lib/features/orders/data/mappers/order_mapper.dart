import 'package:crypto_currency/features/orders/data/models/order_dto.dart';
import 'package:crypto_currency/features/orders/domain/entities/order.dart';
import 'package:crypto_currency/features/orders/domain/entities/order_type_enum.dart';

class OrderMapper {
  static Order fromDTO(OrderDTO order) {
    return Order(
      amount: order.amount,
      coinSymbol: order.coinSymbol,
      price: order.price,
      date: DateTime.parse(order.date),
      type: typeFromDTO(order.type),
    );
  }

  static OrderType typeFromDTO(int orderType) {
    switch (orderType) {
      case 0:
        return OrderType.buy;
      case 1:
        return OrderType.sell;
      default:
        return OrderType.none;
    }
  }
}
