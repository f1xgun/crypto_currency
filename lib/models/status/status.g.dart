// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      timestamp: DateTime.parse(json['timestamp'] as String),
      errorCode: json['errorCode'] as int,
      errorMessage: json['errorMessage'],
      elapsed: json['elapsed'] as int,
      creditCount: json['creditCount'] as int,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
      'elapsed': instance.elapsed,
      'creditCount': instance.creditCount,
    };
