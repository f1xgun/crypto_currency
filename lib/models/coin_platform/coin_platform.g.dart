// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_platform.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Platform _$PlatformFromJson(Map<String, dynamic> json) => Platform(
      id: json['id'] as int,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      slug: json['slug'] as String,
      tokenAddress: json['token_address'] as String,
    );

Map<String, dynamic> _$PlatformToJson(Platform instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'token_address': instance.tokenAddress,
    };
