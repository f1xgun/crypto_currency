// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => CryptoCoin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
