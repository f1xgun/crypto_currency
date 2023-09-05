// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_coin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCoinDTO _$$_UserCoinDTOFromJson(Map<String, dynamic> json) =>
    _$_UserCoinDTO(
      coin: CoinDTO.fromJson(json['coin'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$_UserCoinDTOToJson(_$_UserCoinDTO instance) =>
    <String, dynamic>{
      'coin': instance.coin,
      'amount': instance.amount,
    };
