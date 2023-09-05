import 'package:crypto_currency/features/auth/data/mappers/user_coin_mapper.dart';
import 'package:crypto_currency/features/auth/data/models/user_dto.dart';
import 'package:crypto_currency/features/auth/domain/entities/user.dart';
import 'package:crypto_currency/features/coin_ranking_list/data/mappers/coin_mapper.dart';
import 'package:crypto_currency/features/orders/data/mappers/order_mapper.dart';

class UserMapper {
  static User fromDTO(UserDTO userDto) {
    return User(
      id: userDto.id,
      name: userDto.name,
      balance: userDto.balance,
      coins: userDto.coins.map(UserCoinMapper.fromDTO).toList(),
      favorites: userDto.favorites.map(CoinMapper.fromDTO).toList(),
      orders: userDto.orders.map(OrderMapper.fromDTO).toList(),
    );
  }
}
