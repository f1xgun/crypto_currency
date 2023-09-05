import 'package:crypto_currency/features/auth/data/models/user_coin_dto.dart';
import 'package:crypto_currency/features/coin_ranking_list/data/models/coin_dto.dart';
import 'package:crypto_currency/features/orders/data/models/order_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const factory UserDTO({
    required String id,
    required String name,
    required double balance,
    required List<UserCoinDTO> coins,
    required List<CoinDTO> favorites,
    required List<OrderDTO> orders,
    @JsonKey(name: 'avatar_url')
    String? avatarUrl,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
