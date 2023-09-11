import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_dto.g.dart';
part 'order_dto.freezed.dart';

@freezed
class OrderDTO with _$OrderDTO {
  const factory OrderDTO({
    required int type,
    @JsonKey(name: 'coin_symbol') required String coinSymbol,
    required double amount,
    required double price,
    required String date,
  }) = _OrderDTO;

  factory OrderDTO.fromJson(Map<String, dynamic> json) =>
      _$OrderDTOFromJson(json);
}
