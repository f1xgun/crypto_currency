import 'package:crypto_currency/features/auth/data/models/user_coin_dto.dart';
import 'package:crypto_currency/features/auth/domain/entities/user_coin.dart';
import 'package:crypto_currency/features/coin_ranking_list/data/mappers/coin_mapper.dart';

class UserCoinMapper {
  static UserCoin fromDTO(UserCoinDTO userCoinDTO) {
    return UserCoin(
      coin: CoinMapper.fromDTO(userCoinDTO.coin),
      amount: userCoinDTO.amount,
    );
  }
}
