import 'package:crypto_currency/features/coin_ranking_list/domain/entities/coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_coin.freezed.dart';

@freezed
class UserCoin with _$UserCoin {
  const factory UserCoin({
    required Coin coin,
    required double amount,
  }) = _UserCoin;
}
