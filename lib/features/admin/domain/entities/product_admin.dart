import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_admin.freezed.dart';

@freezed
abstract class ProductAdmin with _$ProductAdmin {
  const factory ProductAdmin({
    required String id,
    required String name,
    required String description,
    required double price,
    required String size,
    required int colorValue,
    String? imageUrl,
  }) = _ProductAdmin;
}