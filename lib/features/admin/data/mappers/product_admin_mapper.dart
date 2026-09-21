import 'package:experience_app/features/admin/data/models/product_admin_model.dart';
import 'package:experience_app/features/admin/domain/entities/product_admin.dart';

extension ProductAdminMapper on ProductAdminModel {
  ProductAdmin toEntity() {
    return ProductAdmin(
      id: id,
      name: name,
      description: description,
      price: price,
      size: size,
      colorValue: colorValue,
      imageUrl: imageUrl,
    );
  }
}

extension ProductEntityMapper on ProductAdmin {
  ProductAdminModel toModel() {
    return ProductAdminModel(
      id: id,
      name: name,
      description: description,
      price: price,
      size: size,
      colorValue: colorValue,
      imageUrl: imageUrl,
    );
  }
}
