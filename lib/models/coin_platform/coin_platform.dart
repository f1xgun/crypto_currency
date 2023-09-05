import 'package:json_annotation/json_annotation.dart';

part 'coin_platform.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Platform {
  int id;
  String name;
  String symbol;
  String slug;
  String tokenAddress;

  Platform({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.tokenAddress,
  });

  factory Platform.fromJson(Map<String, dynamic> json) =>
      _$PlatformFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformToJson(this);
}
