// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDTO _$$_OrderDTOFromJson(Map<String, dynamic> json) => _$_OrderDTO(
      type: json['type'] as int,
      coinSymbol: json['coin_symbol'] as String,
      amount: (json['amount'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_OrderDTOToJson(_$_OrderDTO instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coin_symbol': instance.coinSymbol,
      'amount': instance.amount,
      'price': instance.price,
      'date': instance.date.toIso8601String(),
    };
