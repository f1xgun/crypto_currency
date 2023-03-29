// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      timestamp: DateTime.parse(json['timestamp'] as String),
      errorCode: json['error_code'] as int,
      errorMessage: json['error_message'] as String,
      elapsed: json['elapsed'] as int,
      creditCount: json['credit_count'] as int,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'error_code': instance.errorCode,
      'error_message': instance.errorMessage,
      'elapsed': instance.elapsed,
      'credit_count': instance.creditCount,
    };
