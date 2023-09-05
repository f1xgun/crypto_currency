import 'package:crypto_currency/features/auth/domain/entities/user_coin.dart';
import 'package:crypto_currency/features/coin_ranking_list/domain/entities/coin.dart';
import 'package:crypto_currency/features/orders/domain/entities/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required double balance,
    required List<UserCoin> coins,
    required List<Coin> favorites,
    required List<Order> orders,
    String? avatartUrl,
  }) = _User;
}
