// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  size: json['size'] as String,
  color: json['color'] as String,
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'product': instance.product,
  'size': instance.size,
  'color': instance.color,
  'quantity': instance.quantity,
};
