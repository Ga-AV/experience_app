import 'package:experience_app/features/ecommerce/data/models/cart_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItem> items,
  }) = _CartState;
}