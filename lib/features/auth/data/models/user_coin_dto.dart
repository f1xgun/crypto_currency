import 'package:crypto_currency/features/coin_ranking_list/data/models/coin_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_coin_dto.g.dart';
part 'user_coin_dto.freezed.dart';

@freezed
class UserCoinDTO with _$UserCoinDTO {
  const factory UserCoinDTO({
    required CoinDTO coin,
    required double amount,
  }) = _UserCoinDTO;

  factory UserCoinDTO.fromJson(Map<String, dynamic> json) =>
      _$UserCoinDTOFromJson(json);
}
