import 'package:experience_app/features/ecommerce/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    required String size,
    required String color,
    @Default(1) int quantity,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}