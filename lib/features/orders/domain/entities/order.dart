import 'package:crypto_currency/features/orders/domain/entities/order_type_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required OrderType type,
    required String coinSymbol,
    required double amount,
    required double price,
    required DateTime date,
  }) = _Order;
}
