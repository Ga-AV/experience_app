// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductAdminModel _$ProductAdminModelFromJson(Map<String, dynamic> json) =>
    _ProductAdminModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      size: json['size'] as String,
      colorValue: (json['colorValue'] as num).toInt(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$ProductAdminModelToJson(_ProductAdminModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'size': instance.size,
      'colorValue': instance.colorValue,
      'imageUrl': instance.imageUrl,
    };
