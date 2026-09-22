import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale.freezed.dart';

@freezed
abstract class Sale with _$Sale {
  const factory Sale({
    required String userId,
    required double total,
    required String estado,
    required List<SaleItem> items,
  }) = _Sale;
}

@freezed
abstract class SaleItem with _$SaleItem {
  const factory SaleItem({
    required String productId,
    required String name,
    required double price,
    required int quantity,
    required String size,
    required String color,
  }) = _SaleItem;
}
