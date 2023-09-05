import 'package:crypto_currency/features/auth/data/models/user_coin_dto.dart';
import 'package:crypto_currency/features/auth/data/models/user_dto.dart';
import 'package:crypto_currency/features/auth/domain/entities/user.dart';
import 'package:crypto_currency/features/auth/domain/entities/user_coin.dart';

import 'coins.dart';
import 'orders.dart';

final List<UserCoinDTO> userCoinsDTO = [
  for (int i = 0; i < coinsDTO.length; i++)
    UserCoinDTO(coin: coinsDTO[i], amount: i.toDouble())
];

final List<UserCoin> userCoins = [
  for (int i = 0; i < coins.length; i++)
    UserCoin(coin: coins[i], amount: i.toDouble())
];

List<UserDTO> usersDTO = [
  UserDTO(
      id: '0',
      name: 'Example 1',
      balance: 5000,
      coins: userCoinsDTO,
      favorites: coinsDTO,
      orders: ordersDTO),
  const UserDTO(
      id: '1', name: '', balance: 0, coins: [], favorites: [], orders: []),
];

List<User> users = [
  User(
    id: '0',
    name: 'Example 1',
    balance: 5000,
    coins: userCoins,
    favorites: coins,
    orders: orders,
  ),
  const User(
      id: '1', name: '', balance: 0, coins: [], favorites: [], orders: []),
];
