import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_admin_model.freezed.dart';  
part 'product_admin_model.g.dart';

@freezed
abstract class ProductAdminModel with _$ProductAdminModel {
  const factory ProductAdminModel({
    required String id,
    required String name,
    required String description,
    required double price,
    required String size,
    required int colorValue,
    String? imageUrl,
  }) = _ProductAdminModel;

  factory ProductAdminModel.fromJson(Map<String,dynamic> json)
      => _$ProductAdminModelFromJson(json);
}