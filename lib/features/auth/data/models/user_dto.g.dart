// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDTO _$$_UserDTOFromJson(Map<String, dynamic> json) => _$_UserDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      balance: (json['balance'] as num).toDouble(),
      coins: (json['coins'] as List<dynamic>)
          .map((e) => UserCoinDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      favorites: (json['favorites'] as List<dynamic>)
          .map((e) => CoinDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$$_UserDTOToJson(_$_UserDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'coins': instance.coins,
      'favorites': instance.favorites,
      'orders': instance.orders,
      'avatar_url': instance.avatarUrl,
    };
