import 'package:crypto_currency/models/crypto_coin/crypto_coin.dart';
import 'package:crypto_currency/models/status/status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Payload {
  Status status;
  List<CryptoCoin> data;

  Payload({required this.status, required this.data});

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}
